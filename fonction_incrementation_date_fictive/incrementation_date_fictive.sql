DROP FUNCTION IF EXISTS "incrementation_date_fictive"(y numeric, m numeric, d numeric) CASCADE;
CREATE OR REPLACE FUNCTION "incrementation_date_fictive"(y numeric, m numeric, d numeric)
  RETURNS "pg_catalog"."void" AS $BODY$
	BEGIN
  -- Routine body goes here...
	UPDATE "musicrowd"."Fiction_Date" SET "fiction_Date" = DATE("fiction_Date" +  y * INTERVAL ' 1 YEAR' + m * INTERVAL '1 MONTH' + d * INTERVAL '1 DAY'); 
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
