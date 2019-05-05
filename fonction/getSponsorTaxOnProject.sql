CREATE OR REPLACE FUNCTION "get_sponsor_tax_on_project"("projet_idd" int4)
  RETURNS TABLE("project_name" varchar, "sponsor_name" varchar, "sponsor_type" varchar, "sponsor_pay" int4) AS $BODY$
BEGIN
RETURN QUERY
SELECT projet.nom_proj,sponsor.nom,sponsor_type.sponsor_type_name, ((projet.somme_recoltee*sponsored_projects.tax)/100) as "Sponsor_part" 
FROM projet
JOIN sponsored_projects ON projet.projet_id=sponsored_projects.id_projet 
JOIN sponsor ON sponsor.sponsor_id = sponsored_projects.id_sponsor 
JOIN sponsor_type ON sponsor.sponsor_type_id = sponsor_type.sponsor_type_id WHERE projet.projet_id = projet_idd;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
