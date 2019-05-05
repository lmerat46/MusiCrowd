-- ----------------------------
-- Function structure for archivage
-- ----------------------------
CREATE OR REPLACE FUNCTION "archivage"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
	DECLARE partici RECORD;
	DECLARE rew RECORD;
BEGIN
	IF NEW.date_fin IN (SELECT fictive_date FROM musicrowd.fiction_date) THEN

		FOR partici IN SELECT * FROM musicrowd.participation pa WHERE pa.projet_id = NEW.projet_id

		LOOP
				INSERT INTO musicrowd.participation_archivage VALUES(partici.projet_id, partici.user_id,  partici.date_p);
				DELETE FROM musicrowd.participation p WHERE p.projet_id = partici.projet_id AND p.user_id = partici.user_id;
		END LOOP;

		FOR rew IN SELECT * FROM musicrowd.reward r WHERE r.projet_id = OLD.projet_id
		LOOP
				DELETE FROM musicrowd.reward rd WHERE rd.projet_id = rew.projet_id;
		END LOOP;

	RETURN NEW;
	END IF;
	RETURN NULL;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;


-- ----------------------------
-- Function structure for On_SignUp
-- ----------------------------
CREATE OR REPLACE FUNCTION "On_SignUp"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
	DECLARE tmp DATE;
	BEGIN
		SELECT fictive_date INTO tmp FROM musicrowd.fiction_date;
		NEW.date_inscription = tmp;
		NEW.date_connexion = tmp;
		RETURN NEW;
	END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for onCompletion
-- ----------------------------
CREATE OR REPLACE FUNCTION "onCompletion"()
  RETURNS "pg_catalog"."trigger" AS $BODY$ 
	DECLARE rec RECORD;
	DECLARE partici RECORD;
	BEGIN
  -- Routine body goes here...
	FOR rec IN SELECT * FROM musicrowd.projet
	LOOP
		IF ((rec.somme_recoltee >= rec.objectif)) AND rec.date_fin = NEW.fictive_date
		THEN	
			UPDATE musicrowd.projet SET termine = TRUE WHERE projet_id = rec.projet_id;
			RAISE NOTICE 'Somme percue apres application de la taxe musicrowd: %', rec.objectif - (rec.objectif*rec.taxe_perc/100);
			RETURN NEW; 
		ELSIF (	rec.date_fin = NEW.fictive_date) THEN
			UPDATE musicrowd.projet SET termine = FALSE WHERE projet_id = rec.projet_id;
			FOR partici IN SELECT * FROM musicrowd.participation pa WHERE pa.projet_id = rec.projet_id
		LOOP
			NEW.somme_recoltee = NEW.somme_recoltee - partici.montant;
			UPDATE musicrowd.utilisateur SET balance = balance + partici.montant WHERE user_id = partici.user_id;
		END LOOP;
		RETURN NEW;
			RETURN NEW; END IF;
	END LOOP;
	RETURN NULL;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for OnProjectCreation
-- ----------------------------
CREATE OR REPLACE FUNCTION "OnProjectCreation"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
	BEGIN
  -- Routine body goes here...
	UPDATE utilisateur SET nb_projet_crees = nb_projet_crees + 1, date_connexion = (SELECT fictive_date FROM fiction_date) WHERE utilisateur.user_id = NEW.user_id;
	INSERT INTO reward (projet_id,nom_cadeau,detail_cadeau,somme_min,somme_max) VALUES (NEW.projet_id,'Remerciement','Merci pour avoir contribué à ce projet cher fan',1,New.objectif);
	RETURN NEW;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for OnUserParticipation
-- ----------------------------
CREATE OR REPLACE FUNCTION "OnUserParticipation"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
DECLARE rec RECORD;
BEGIN
  UPDATE musicrowd.utilisateur SET nb_projet_supportes = nb_projet_supportes + 1, date_connexion = (SELECT fictive_date FROM fiction_date) WHERE utilisateur.user_id = NEW.user_id;
	UPDATE musicrowd.projet SET somme_recoltee = somme_recoltee + NEW.montant WHERE projet.projet_id = NEW.projet_id;
	RETURN NEW;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for RGPD
-- ----------------------------
CREATE OR REPLACE FUNCTION "RGPD"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
	DECLARE util RECORD;
	BEGIN
  -- Routine body goes here...
	FOR util IN SELECT * FROM musicrowd.utilisateur
	LOOP
	IF date (util.date_connexion + "interval"('3 year')) <= (SELECT fictive_date FROM musicrowd.fiction_date)  THEN
		INSERT INTO musicrowd.utilisateur_archivage VALUES (util.user_id,util.nb_projet_supportes,util.nb_projet_crees);
		DELETE FROM musicrowd.utilisateur WHERE user_id = util.user_id;
	END IF;
END LOOP;
	RETURN NEW;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for RibCheck
-- ----------------------------
CREATE OR REPLACE FUNCTION "RibCheck"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
	DECLARE ribb text;
	DECLARE balanceb integer;
	DECLARE rec record;
	BEGIN
  -- Routine body goes here...
	SELECT balance, rib INTO balanceb, ribb FROM musicrowd.utilisateur WHERE utilisateur.user_id = NEW.user_id;
	
IF ribb IS NULL
THEN
RAISE EXCEPTION 'NO RIB';
RETURN NULL; 
ELSIF balanceb >= NEW.montant THEN
	SELECT * INTO rec FROM musicrowd.participation WHERE user_id = NEW.user_id AND projet_id = NEW.projet_id;
IF rec IS NULL
THEN
UPDATE musicrowd.utilisateur SET balance = balance - NEW.montant WHERE utilisateur.user_id = NEW.user_id;
	RETURN NEW;
ELSE
UPDATE musicrowd.utilisateur SET balance = balance - NEW.montant WHERE utilisateur.user_id = NEW.user_id;
UPDATE musicrowd.Participation SET montant = montant + NEW.montant, date_p = NEW.date_p WHERE user_id = NEW.user_id AND projet_id = NEW.projet_id;
UPDATE musicrowd.projet SET somme_recoltee = somme_recoltee + NEW.montant WHERE projet_id = NEW.projet_id;
RETURN NULL;
END IF;
ELSE 
	RAISE EXCEPTION 'NOT ENOUGH MONEY: %. REQUIRED: %', balanceb, NEW.montant;
	RETURN NULL;
END IF;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Triggers structure for table fiction_date
-- ----------------------------
CREATE TRIGGER "OnComplete_trigg" AFTER UPDATE OF fictive_date ON fiction_date
FOR EACH ROW
EXECUTE PROCEDURE "musicrowd"."onCompletion"();
CREATE TRIGGER "RGPD_trigg" AFTER UPDATE OF fictive_date ON fiction_date
FOR EACH ROW
EXECUTE PROCEDURE "musicrowd"."RGPD"();

-- ----------------------------
-- Triggers structure for table participation
-- ----------------------------
CREATE TRIGGER "OnUserParticipation_trigg" AFTER INSERT ON "participation"
FOR EACH ROW
EXECUTE PROCEDURE "musicrowd"."OnUserParticipation"();
CREATE TRIGGER "RibCheck_trigg" BEFORE INSERT ON "participation"
FOR EACH ROW
EXECUTE PROCEDURE "musicrowd"."RibCheck"();

-- ----------------------------
-- ----------------------------
-- Triggers structure for table projet
-- ----------------------------
CREATE TRIGGER "OnProjectCreation_trigg" AFTER INSERT ON "projet"
FOR EACH ROW
EXECUTE PROCEDURE "musicrowd"."OnProjectCreation"();
CREATE TRIGGER "onComplete_trigg_archivage" AFTER UPDATE OF "termine" ON "projet"
FOR EACH ROW
EXECUTE PROCEDURE "musicrowd"."archivage"();


-- ----------------------------
-- Triggers structure for table utilisateur
-- ----------------------------
CREATE TRIGGER "On_SignUp_trigg" BEFORE INSERT ON "utilisateur"
FOR EACH ROW
EXECUTE PROCEDURE "musicrowd"."On_SignUp"();
