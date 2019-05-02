/*
 Navicat Premium Data Transfer

 Source Server         : PgSQL
 Source Server Type    : PostgreSQL
 Source Server Version : 110002
 Source Host           : localhost:5432
 Source Catalog        : MusiCrowdDB
 Source Schema         : musicrowd

 Target Server Type    : PostgreSQL
 Target Server Version : 110002
 File Encoding         : 65001

 Date: 23/04/2019 15:42:03
*/


-- ----------------------------
-- Function structure for OnProjectCreation
-- ----------------------------
DROP FUNCTION IF EXISTS "OnProjectCreation"() CASCADE;
CREATE OR REPLACE FUNCTION "OnProjectCreation"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
	BEGIN
  -- Routine body goes here...
	UPDATE utilisateur SET nb_projet_crees = nb_projet_crees + 1 WHERE utilisateur.user_id = NEW.user_id;
	INSERT INTO reward (projet_id,nom_cadeau,detail_cadeau,somme_min,somme_max) VALUES (NEW.projet_id,'Remerciement','Merci pour avoir contribué à ce projet cher fan',1,New.objectif);
	RETURN NEW;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for OnUserParticipation
-- ----------------------------
DROP FUNCTION IF EXISTS "OnUserParticipation"() CASCADE;
CREATE OR REPLACE FUNCTION "OnUserParticipation"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
BEGIN
  UPDATE musicrowd.utilisateur SET nb_projet_supportes = nb_projet_supportes + 1 WHERE utilisateur.user_id = NEW.user_id;
	UPDATE musicrowd.projet SET somme_recoltee = somme_recoltee + NEW.montant WHERE projet.projet_id = NEW.projet_id;
	RETURN NEW;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for RibCheck
-- ----------------------------
DROP FUNCTION IF EXISTS "RibCheck"() CASCADE;
CREATE OR REPLACE FUNCTION "RibCheck"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
	DECLARE ribb text;
	DECLARE rec record;
	BEGIN
  -- Routine body goes here...
	SELECT INTO ribb rib FROM musicrowd.utilisateur WHERE utilisateur.user_id = NEW.user_id;
IF ribb IS NULL 
THEN
RAISE NOTICE 'NO RIB BRO';
RETURN NULL; END IF;
SELECT * INTO rec FROM musicrowd.participation WHERE user_id = NEW.user_id AND projet_id = NEW.projet_id;
IF rec IS NULL
THEN
RETURN NEW;
ELSE
UPDATE musicrowd.Participation SET montant = montant + NEW.montant, date_p = NEW.date_p WHERE user_id = NEW.user_id AND projet_id = NEW.projet_id;
RETURN NULL;
END IF;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for archivage
-- ----------------------------
DROP FUNCTION IF EXISTS "archivage"() CASCADE;
CREATE OR REPLACE FUNCTION "archivage"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
	DECLARE partici RECORD;
BEGIN
	IF NEW.termine IS TRUE THEN
		FOR partici IN SELECT * FROM musicrowd.participation pa WHERE pa.projet_id = NEW.projet_id
		LOOP
			INSERT INTO musicrowd.archivage VALUES(partici.projet_id, partici.user_id,  partici.date_p);
			DELETE FROM musicrowd.participation p WHERE p.projet_id = partici.projet_id AND p.user_id = partici.user_id;
			RAISE NOTICE 'WAS HERE';
		END LOOP;
	ELSE RAISE NOTICE 'archivage impossible'; END IF;
	RETURN NEW;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for onCompletion
-- ----------------------------
DROP FUNCTION IF EXISTS "onCompletion"() CASCADE;
CREATE OR REPLACE FUNCTION "onCompletion"()
  RETURNS "pg_catalog"."trigger" AS $BODY$ 
	BEGIN
  -- Routine body goes here...
	IF NEW.somme_recoltee >= OLD.objectif AND New.date_fin = NOW()
	THEN
		UPDATE musicrowd.projet SET termine = TRUE WHERE projet_id = NEW.projet_id;
		RAISE NOTICE 'Somme percue apres application de la taxe: %', New.objectif - (NEW.objectif*NEW.taxe_perc/100);
		RETURN NEW; END IF;
	RETURN NULL;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Triggers structure for table participation
-- ----------------------------
CREATE TRIGGER "OnUserParticipation_trigg" AFTER INSERT ON "musicrowd"."participation"
FOR EACH ROW
EXECUTE PROCEDURE "musicrowd"."OnUserParticipation"();
CREATE TRIGGER "RibCheck_trigg" BEFORE INSERT ON "musicrowd"."participation"
FOR EACH ROW
EXECUTE PROCEDURE "musicrowd"."RibCheck"();

-- ----------------------------
-- Triggers structure for table projet
-- ----------------------------
CREATE TRIGGER "OnComplete_trigg" AFTER UPDATE OF "objectif", "somme_recoltee" ON "musicrowd"."projet"
FOR EACH ROW
EXECUTE PROCEDURE "musicrowd"."onCompletion"();
CREATE TRIGGER "OnProjectCreation_trigg" AFTER INSERT ON "musicrowd"."projet"
FOR EACH ROW
EXECUTE PROCEDURE "musicrowd"."OnProjectCreation"();
CREATE TRIGGER "onComplete_trigg_archivage" AFTER UPDATE OF "termine" ON "musicrowd"."projet"
FOR EACH ROW
EXECUTE PROCEDURE "musicrowd"."archivage"();
