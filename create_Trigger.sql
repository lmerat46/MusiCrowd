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
	DECLARE projetID INT;
	BEGIN
	SELECT INTO projetID projet_id FROM participation p  WHERE p.projet_id = projet_id
	if termine  THEN
		INSERT INTO archive VALUES(total.projet_id, total.user_id, total.reward_id, toal.date_p);
	ELSE RAISE NOTICE 'archivage impossible';
	END IF;
END
$BODY$
  LANGUAGE plpgsql VOLATILE



CREATE TRIGGER "onComplete_trigg_archivage" AFTER UPDATE OF "objectif", "somme_recoltee" ON "musicrowd"."projet"
FOR EACH ROW
EXECUTE PROCEDURE "musicrowd"."archivage"();
