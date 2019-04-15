CREATE OR REPLACE FUNCTION check_objectif_atteint() RETURNS trigger AS $$
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
EXECUTE PROCEDURE check_objectif_atteint();

