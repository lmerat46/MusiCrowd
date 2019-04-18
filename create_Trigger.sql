/*
 Navicat Premium Data Transfer

 Source Server         : PgSQL
 Source Server Type    : PostgreSQL
 Source Server Version : 110002
 Source Host           : localhost:5432
 Source Catalog        : MusiCrowdDB
 Source Schema         : musicrowd

 Target Server Type    : PostgreSQL
 Target Server Version : 110002
 File Encoding         : 65001

 Date: 18/04/2019 17:42:48
*/

-- ----------------------------
-- Function structure for archivage
-- ----------------------------
DROP FUNCTION IF EXISTS "archivage"();
CREATE OR REPLACE FUNCTION "archivage"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
	DECLARE partici RECORD;
BEGIN
	IF NEW.termine IS TRUE THEN
		FOR partici IN SELECT * FROM musicrowd.participation pa WHERE pa.projet_id = NEW.projet_id
		LOOP
			INSERT INTO musicrowd.archivage VALUES(partici.projet_id, partici.user_id, partici.reward_id, partici.date_p);
			DELETE FROM musicrowd.participation p WHERE p.projet_id = partici.projet_id AND p.user_id = partici.user_id AND p.reward_id = partici.reward_id;
			RAISE NOTICE 'WAS HERE';
		END LOOP;
	ELSE RAISE NOTICE 'archivage impossible'; END IF;
	RETURN NEW;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for onCompletion
-- ----------------------------
DROP FUNCTION IF EXISTS "onCompletion"();
CREATE OR REPLACE FUNCTION "onCompletion"()
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

-- ----------------------------
-- Triggers structure for table projet
-- ----------------------------
CREATE TRIGGER "OnComplete_trigg" AFTER UPDATE OF "somme_recoltee", "objectif" ON "projet"
FOR EACH ROW
EXECUTE PROCEDURE "musicrowd"."onCompletion"();
CREATE TRIGGER "onComplete_trigg_archivage" AFTER UPDATE OF "termine" ON "projet"
FOR EACH ROW
EXECUTE PROCEDURE "musicrowd"."archivage"();

