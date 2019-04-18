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
	DECLARE projID INT;
	BEGIN
  -- Routine body goes here...
	SELECT INTO projID projet_id FROM projet WHERE NEW.somme_recoltee >= objectif;
	UPDATE projet SET termine = TRUE WHERE projet_id = projID;
	RETURN NEW;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
COST 100;


CREATE TRIGGER "OnComplete_trigg" AFTER UPDATE OF "objectif", "somme_recoltee" ON "musicrowd"."projet"
FOR EACH ROW
EXECUTE PROCEDURE "musicrowd"."onCompletion"();

/*
CREATE OR REPLACE FUNCTION "musicrowd"."archivage"(projet_id NUMERIC, termine BOOL)
  RETURNS "pg_catalog"."trigger" AS $BODY$
	
	BEGIN
	total := SELECT * FROM participation p  WHERE p.projet_id = projet_id AND termine = TRUE;
	if total IS NOT NULL THEN
		--LOOP
		--EXIT WHEN total IS NULL;
		INSERT INTO archive VALUES(total.projet_id, total.user_id, total.reward_id, toal.date_p);
		--total := total.next?????
		--END LOOP;
	ELSE RAISE NOTICE 'archivage impossible';
	END IF;
	INSERT INTO archive VALUES ();
END
$BODY$
  LANGUAGE plpgsql VOLATILE



CREATE TRIGGER "onComplete_trigg_archivage" AFTER UPDATE OF "objectif", "somme_recoltee" ON "musicrowd"."projet"
FOR EACH ROW
EXECUTE PROCEDURE "musicrowd"."archivage"();
*/
