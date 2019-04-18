/*CREATE OR REPLACE FUNCTION check_objectif_atteint() RETURNS trigger AS $$
DECLARE
total numeric;
BEGIN
	IF date_fin = NOW() THEN 
		CASE
		WHEN somme_recoltee >= objectif THEN
			INSERT INTO Archive VALUES();
		ELSE
			RAISE NOTICE 'Objectif non atteint';
			RETURN NULL;
	END IF;
	
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER pas_plus_de_1000
BEFORE UPDATE ON MusiCRowd.Projet
FOR EACH ROW
EXECUTE PROCEDURE check_objectif_atteint();*/

CREATE OR REPLACE FUNCTION "musicrowd"."onCompletion"()
  RETURNS "pg_catalog"."trigger" AS $BODY$ 
	BEGIN
  -- Routine body goes here...
	IF NEW.somme_recoltee >= OLD.objectif
	THEN
		UPDATE projet SET termine = TRUE WHERE projet_id = NEW.projet_id;
		RETURN NEW; END IF;
	RETURN NULL;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

CREATE TRIGGER "OnComplete_trigg" AFTER UPDATE OF "objectif", "somme_recoltee" ON "musicrowd"."projet"
FOR EACH ROW
EXECUTE PROCEDURE "musicrowd"."onCompletion"();


CREATE OR REPLACE FUNCTION "musicrowd"."archivage"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
	DECLARE termineOK BOOL;
	BEGIN
	SELECT INTO termineOK termine FROM Projet p  WHERE p.projet_id = projet_id;
	if termineOK  THEN
		INSERT INTO archive VALUES(projet_id, user_id, reward_id, date_p);
		DELETE FROM Participation p WHERE p.projet_id = projet_id AND p.user_id = user_id AND p.reward_id = reward_id;
	ELSE RAISE NOTICE 'archivage impossible';
	END IF;
END
$BODY$
  LANGUAGE plpgsql VOLATILE



CREATE TRIGGER "onComplete_trigg_archivage" AFTER INSERT  ON "musicrowd"."participation"
FOR EACH ROW
EXECUTE PROCEDURE "musicrowd"."archivage"();
