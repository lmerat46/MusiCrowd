CREATE OR REPLACE FUNCTION "getProjectMilestones"("projet_idd" int4)
  RETURNS TABLE("projet_id" int4, "nom_projet" varchar, "milestones_description" varchar) AS $BODY$
BEGIN
RETURN QUERY
SELECT projet.projet_id, nom_proj, "Milestones"."description" FROM projet JOIN milestones ON projet.projet_id = "Milestones".projet_id
WHERE projet.projet_id = 1 AND projet.somme_recoltee >= milestones.objectif;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
