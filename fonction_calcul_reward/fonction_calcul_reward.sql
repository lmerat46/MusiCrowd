CREATE OR REPLACE FUNCTION "getalluser_rewards"("user_idd" int4, "projet_idd" int4)
  RETURNS TABLE("nom" varchar, "detail" varchar) AS $BODY$
BEGIN
RETURN QUERY
SELECT reward.nom_cadeau, reward.detail_cadeau FROM reward WHERE reward.projet_id = projet_idd AND reward.somme_min <= (SELECT participation.montant FROM participation WHERE participation.projet_id = projet_idd AND participation.user_id = user_idd);
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
