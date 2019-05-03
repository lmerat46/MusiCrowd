-- ----------------------------
-- Function structure for getSponsorTaxOnProject
-- ----------------------------
CREATE OR REPLACE FUNCTION "getSponsorTaxOnProject"("projet_idd" int4)
  RETURNS TABLE("project_name" varchar, "sponsor_name" varchar, "sponsor_type" varchar, "sponsor_pay" int4) AS $BODY$
BEGIN
RETURN QUERY
SELECT projet_archivage.nom_proj,sponsor.nom,sponsor_type.sponsor_type_name, ((projet_archivage.somme_recoltee*sponsored_projects.tax)/100) as "Sponsor_part" 
FROM projet_archivage 
JOIN sponsored_projects ON projet_archivage.projet_id=sponsored_projects.id_projet 
JOIN sponsor ON sponsor.sponsor_id = sponsored_projects.id_sponsor 
JOIN sponsor_type ON sponsor.sponsor_type_id = sponsor_type.sponsor_type_id WHERE projet_archivage.projet_id = projet_idd;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;