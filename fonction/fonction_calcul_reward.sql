CREATE OR REPLACE FUNCTION "getalluser_rewards"("user_idd" int4, "projet_idd" int4)
  RETURNS TABLE("nom" varchar, "detail" varchar) AS $BODY$
BEGIN
RAISE NOTICE '%, %',user_idd, projet_idd;
RETURN QUERY
(SELECT reward.nom_cadeau, reward.detail_cadeau FROM reward WHERE reward.projet_id = projet_idd AND reward.somme_min <= (SELECT montant FROM participation_archivage WHERE projet_id = projet_idd AND user_id = user_idd)) UNION (SELECT reward.nom_cadeau, reward.detail_cadeau FROM reward WHERE reward.projet_id = projet_idd AND reward.somme_min <= (SELECT montant FROM participation WHERE projet_id = projet_idd AND user_id = user_idd));
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
