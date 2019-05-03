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

 Date: 03/05/2019 20:16:59
*/


-- ----------------------------
-- Sequence structure for participation_projet_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "participation_projet_id_seq" CASCADE;
CREATE SEQUENCE "participation_projet_id_seq" 
INCREMENT 1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for participation_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "participation_user_id_seq" CASCADE;
CREATE SEQUENCE "participation_user_id_seq" 
INCREMENT 1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for projet_projet_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "projet_projet_id_seq" CASCADE;
CREATE SEQUENCE "projet_projet_id_seq" 
INCREMENT 1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for projet_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "projet_user_id_seq" CASCADE;
CREATE SEQUENCE "projet_user_id_seq" 
INCREMENT 1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for reward_projet_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "reward_projet_id_seq" CASCADE;
CREATE SEQUENCE "reward_projet_id_seq" 
INCREMENT 1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for reward_reward_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "reward_reward_id_seq" CASCADE;
CREATE SEQUENCE "reward_reward_id_seq" 
INCREMENT 1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sponsor_sponsor_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "sponsor_sponsor_id_seq" CASCADE;
CREATE SEQUENCE "sponsor_sponsor_id_seq" 
INCREMENT 1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sponsored_projects_id_projet_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "sponsored_projects_id_projet_seq" CASCADE;
CREATE SEQUENCE "sponsored_projects_id_projet_seq" 
INCREMENT 1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sponsored_projects_id_sponsor_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "sponsored_projects_id_sponsor_seq" CASCADE;
CREATE SEQUENCE "sponsored_projects_id_sponsor_seq" 
INCREMENT 1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for utilisateur_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "utilisateur_user_id_seq" CASCADE;
CREATE SEQUENCE "utilisateur_user_id_seq" 
INCREMENT 1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Records of Fiction_Date
-- ----------------------------
BEGIN;
INSERT INTO "Fiction_Date" ("fiction_Date") VALUES ('2019-05-26');
COMMIT;

-- ----------------------------
-- Records of Milestones
-- ----------------------------
BEGIN;
INSERT INTO "Milestones" ("projet_id", "description", "objectif", "milsetone_id") VALUES (2, 'Prise en Charge de Logic Pro X', 20000, 2);
INSERT INTO "Milestones" ("projet_id", "description", "objectif", "milsetone_id") VALUES (3, 'Prise en charge de module 16 bits', 250000, 3);
INSERT INTO "Milestones" ("projet_id", "description", "objectif", "milsetone_id") VALUES (4, 'Deux Morceau de plus dans l''Album', 60000, 4);
COMMIT;

-- ----------------------------
-- Records of participation_archivage
-- ----------------------------
BEGIN;
INSERT INTO "participation_archivage" ("projet_id", "user_id", "date_p") VALUES (1, 2, '2019-05-03');
COMMIT;

-- ----------------------------
-- Records of projet
-- ----------------------------
BEGIN;
INSERT INTO "projet" ("projet_id", "user_id", "nom_proj", "description", "date_deb", "date_fin", "objectif", "somme_recoltee", "taxe_perc", "termine") VALUES (2, 2, 'Tranxen 400', 'VST Compatible avec Pro Tools, permet de moduler les pic, les poc mais aussi les pitch et les potch', '2019-02-15', '2019-05-23', 10000, 0, 50, 'f');
INSERT INTO "projet" ("projet_id", "user_id", "nom_proj", "description", "date_deb", "date_fin", "objectif", "somme_recoltee", "taxe_perc", "termine") VALUES (3, 3, 'ChipWave', 'Logiciel de MAO taillé pour la création de musique 8 bits.', '2019-01-01', '2019-05-10', 200000, 0, 5, 'f');
INSERT INTO "projet" ("projet_id", "user_id", "nom_proj", "description", "date_deb", "date_fin", "objectif", "somme_recoltee", "taxe_perc", "termine") VALUES (4, 4, 'Outrun Alpha', 'Back to The 80s !', '2019-01-30', '2019-05-01', 50000, 0, 15, 'f');
COMMIT;

-- ----------------------------
-- Records of projet_archivage
-- ----------------------------
BEGIN;
INSERT INTO "projet_archivage" ("projet_id", "user_id", "nom_proj", "description", "date_deb", "date_fin", "objectif", "somme_recoltee", "taxe_perc") VALUES (1, 1, 'OnduLab X', 'Simulateur numérique d''effet de basse', '2018-12-31', '2019-05-26', '2600000', 1000000, 10);
COMMIT;

-- ----------------------------
-- Records of reward
-- ----------------------------
BEGIN;
INSERT INTO "reward" ("reward_id", "projet_id", "nom_cadeau", "detail_cadeau", "somme_min", "somme_max") VALUES (10, 4, 'Remerciement', 'remerciement de la part de toute l équipe', 5, 10);
INSERT INTO "reward" ("reward_id", "projet_id", "nom_cadeau", "detail_cadeau", "somme_min", "somme_max") VALUES (4, 2, 'Tranxen 400 lite', 'Module uniquement les pic et les poc', 50, 200);
INSERT INTO "reward" ("reward_id", "projet_id", "nom_cadeau", "detail_cadeau", "somme_min", "somme_max") VALUES (5, 2, 'Tranxen 400 standard', 'Module les pic les poc mais un peu les pitch', 200, 500);
INSERT INTO "reward" ("reward_id", "projet_id", "nom_cadeau", "detail_cadeau", "somme_min", "somme_max") VALUES (6, 2, 'Tranxen 400 ultimate', 'Module tout', 500, 2000);
INSERT INTO "reward" ("reward_id", "projet_id", "nom_cadeau", "detail_cadeau", "somme_min", "somme_max") VALUES (7, 2, 'Tranxen 400 ultimate + Pro Tools', 'Module tout et en plus tu peux l''essayer sur le meilleur soft de prod musical', 2000, 30000);
INSERT INTO "reward" ("reward_id", "projet_id", "nom_cadeau", "detail_cadeau", "somme_min", "somme_max") VALUES (8, 3, 'ChipWave Standard', 'Recevez l''édition standard de chipwave ', 100, 300);
INSERT INTO "reward" ("reward_id", "projet_id", "nom_cadeau", "detail_cadeau", "somme_min", "somme_max") VALUES (9, 3, 'ChipWave Ultimate', 'Avec des modules FPGA pour mieux simulez votre bonne vieille NES', 300, 500);
INSERT INTO "reward" ("reward_id", "projet_id", "nom_cadeau", "detail_cadeau", "somme_min", "somme_max") VALUES (11, 4, 'L''album', 'A exemplaire de notre album qui vous ramenera au temps joyeux des synthé et des coupes de cheveux de mauvais gout', 10, 50);
INSERT INTO "reward" ("reward_id", "projet_id", "nom_cadeau", "detail_cadeau", "somme_min", "somme_max") VALUES (12, 4, 'L''album + Tee Shirt', 'Notre Album + Un Tee Shirt avec la cover de l''album', 50, 100);
INSERT INTO "reward" ("reward_id", "projet_id", "nom_cadeau", "detail_cadeau", "somme_min", "somme_max") VALUES (13, 4, 'L''album + Tee Shirt + Place de concert', 'une virée en F1 avec Splash aux commandes', 100, 400);
INSERT INTO "reward" ("reward_id", "projet_id", "nom_cadeau", "detail_cadeau", "somme_min", "somme_max") VALUES (14, 4, 'Album + Tee shirt + Concert privé', 'Si tu as un jardin assez grand on vient jouer chez toi !', 400, 1000);
INSERT INTO "reward" ("reward_id", "projet_id", "nom_cadeau", "detail_cadeau", "somme_min", "somme_max") VALUES (15, 4, 'Album + Tee Shirt + Korg Analogue', 'Remporte le synthé de notre claviériste signé par nos soins !', 1000, 30000);
COMMIT;

-- ----------------------------
-- Records of sponsor
-- ----------------------------
BEGIN;
INSERT INTO "sponsor" ("sponsor_id", "nom", "sponsor_type_id") VALUES (1, 'Gibson', 1);
INSERT INTO "sponsor" ("sponsor_id", "nom", "sponsor_type_id") VALUES (2, 'Korg', 1);
INSERT INTO "sponsor" ("sponsor_id", "nom", "sponsor_type_id") VALUES (3, 'ESP', 1);
INSERT INTO "sponsor" ("sponsor_id", "nom", "sponsor_type_id") VALUES (4, 'Fender', 1);
INSERT INTO "sponsor" ("sponsor_id", "nom", "sponsor_type_id") VALUES (5, 'Facebook', 7);
COMMIT;

-- ----------------------------
-- Records of sponsor_type
-- ----------------------------
BEGIN;
INSERT INTO "sponsor_type" ("sponsor_type_id", "sponsor_type_name") VALUES (1, 'Instruments Manufacturer');
INSERT INTO "sponsor_type" ("sponsor_type_id", "sponsor_type_name") VALUES (2, 'Software Company');
INSERT INTO "sponsor_type" ("sponsor_type_id", "sponsor_type_name") VALUES (3, 'Television Network');
INSERT INTO "sponsor_type" ("sponsor_type_id", "sponsor_type_name") VALUES (4, 'Radio Network');
INSERT INTO "sponsor_type" ("sponsor_type_id", "sponsor_type_name") VALUES (5, 'News Paper');
INSERT INTO "sponsor_type" ("sponsor_type_id", "sponsor_type_name") VALUES (6, 'Magazine');
INSERT INTO "sponsor_type" ("sponsor_type_id", "sponsor_type_name") VALUES (7, 'Social network');
COMMIT;

-- ----------------------------
-- Records of sponsored_projects
-- ----------------------------
BEGIN;
INSERT INTO "sponsored_projects" ("id_projet", "id_sponsor", "sponsoring_action", "tax") VALUES (4, 2, 'Apport d''instrument de la marque auprèes des musiciens', 0);
INSERT INTO "sponsored_projects" ("id_projet", "id_sponsor", "sponsoring_action", "tax") VALUES (4, 5, 'Publicité sur le réseau social', 10);
INSERT INTO "sponsored_projects" ("id_projet", "id_sponsor", "sponsoring_action", "tax") VALUES (1, 5, 'Publicité sur le réseau social', 10);
COMMIT;

-- ----------------------------
-- Records of utilisateur
-- ----------------------------
BEGIN;
INSERT INTO "utilisateur" ("user_id", "mdp", "nom", "prenom", "adresse", "telephone", "mail", "rib", "nb_projet_supportes", "nb_projet_crees", "balance", "date_inscription", "date_connexion") VALUES (5, 'mot6passe', 'Jurski', 'Yan', '10 rue Thomas Mann', '0789235646', 'jurski@irif.fr', NULL, 0, 0, 3000, NULL, NULL);
INSERT INTO "utilisateur" ("user_id", "mdp", "nom", "prenom", "adresse", "telephone", "mail", "rib", "nb_projet_supportes", "nb_projet_crees", "balance", "date_inscription", "date_connexion") VALUES (3, 'mot3passe', 'Rogova', 'Alexandra', '124 rue de compans', '0677667766', 'alexandra.rogova@etu.univ-paris-diderot.fr', 'DE092897828762', 0, 1, 10000, NULL, NULL);
INSERT INTO "utilisateur" ("user_id", "mdp", "nom", "prenom", "adresse", "telephone", "mail", "rib", "nb_projet_supportes", "nb_projet_crees", "balance", "date_inscription", "date_connexion") VALUES (4, 'mot5passe', 'Laplante', 'Sophie', '19 rue de Vaugirard', '0645567219', 'laplante@irif.fr', 'FR04576786273', 0, 1, 20, NULL, NULL);
INSERT INTO "utilisateur" ("user_id", "mdp", "nom", "prenom", "adresse", "telephone", "mail", "rib", "nb_projet_supportes", "nb_projet_crees", "balance", "date_inscription", "date_connexion") VALUES (1, 'mot2passe', 'Merat', 'Laure', '184 rue de Tolbiac', '0666666666', 'laure.merat@etu.univ-paris-diderot.fr', 'FR45898676776796237H65', 0, 1, 2000, NULL, NULL);
INSERT INTO "utilisateur" ("user_id", "mdp", "nom", "prenom", "adresse", "telephone", "mail", "rib", "nb_projet_supportes", "nb_projet_crees", "balance", "date_inscription", "date_connexion") VALUES (2, 'mot1passe', 'Amari', 'Nabil', '5 rue Thomas Mann', '0777777777', 'nabil.amari@etu.univ-paris-diderot.fr', 'FR04399902978798786N65', 2, 1, 700000, NULL, NULL);
COMMIT;

-- ----------------------------
-- Function structure for OnProjectCreation
-- ----------------------------
DROP FUNCTION IF EXISTS "OnProjectCreation"() CASCADE;
CREATE OR REPLACE FUNCTION "OnProjectCreation"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
	BEGIN
  -- Routine body goes here...
	UPDATE utilisateur SET nb_projet_crees = nb_projet_crees + 1 WHERE utilisateur.user_id = NEW.user_id;
	INSERT INTO reward (projet_id,nom_cadeau,detail_cadeau,somme_min,somme_max) VALUES (NEW.projet_id,'Remerciement','Merci pour avoir contribué à ce projet cher fan',1,New.objectif);
	RETURN NEW;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for OnUserParticipation
-- ----------------------------
DROP FUNCTION IF EXISTS "OnUserParticipation"() CASCADE;
CREATE OR REPLACE FUNCTION "OnUserParticipation"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
BEGIN
  UPDATE musicrowd.utilisateur SET nb_projet_supportes = nb_projet_supportes + 1 WHERE utilisateur.user_id = NEW.user_id;
	UPDATE musicrowd.projet SET somme_recoltee = somme_recoltee + NEW.montant WHERE projet.projet_id = NEW.projet_id;
	RETURN NEW;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for On_SignUp
-- ----------------------------
DROP FUNCTION IF EXISTS "On_SignUp"() CASCADE;
CREATE OR REPLACE FUNCTION "On_SignUp"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
	DECLARE tmp DATE;
	BEGIN
		SELECT "fiction_Date" INTO tmp FROM musicrowd."Fiction_Date";
		NEW.date_inscription := tmp;
		NEW.date_connexion := tmp;
		RETURN NEW;
	END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for RGPD
-- ----------------------------
DROP FUNCTION IF EXISTS "RGPD"() CASCADE;
CREATE OR REPLACE FUNCTION "RGPD"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
	DECLARE util RECORD;
	BEGIN
  -- Routine body goes here...
	FOR util IN SELECT * FROM musicrowd.utilisateur
	LOOP
	RAISE NOTICE 'VALUE: %', date (util.date_connexion + "interval"('3 year') );
	IF date (util.date_connexion + "interval"('3 year')) <= (SELECT "fiction_Date" FROM musicrowd."Fiction_Date")  THEN
		RAISE NOTICE 'WAS HERE';
		INSERT INTO musicrowd.utilisateur_archivage VALUES (util.user_id,util.nb_projet_supportes,util.nb_projet_crees);
		DELETE FROM musicrowd.utilisateur WHERE user_id = util.user_id;
	END IF;
END LOOP;
	RETURN NEW;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for RibCheck
-- ----------------------------
DROP FUNCTION IF EXISTS "RibCheck"() CASCADE;
CREATE OR REPLACE FUNCTION "RibCheck"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
	DECLARE ribb text;
	DECLARE balanceb integer;
	DECLARE rec record;
	BEGIN
  -- Routine body goes here...
	SELECT balance, rib INTO balanceb, ribb FROM musicrowd.utilisateur WHERE utilisateur.user_id = NEW.user_id;
	
IF ribb IS NULL
THEN
RAISE EXCEPTION 'NO RIB BRO OR you are broke';
RETURN NULL; 
ELSIF balanceb >= NEW.montant THEN
	SELECT * INTO rec FROM musicrowd.participation WHERE user_id = NEW.user_id AND projet_id = NEW.projet_id;
IF rec IS NULL
THEN
UPDATE musicrowd.utilisateur SET balance = balance - NEW.montant WHERE utilisateur.user_id = NEW.user_id;
	RETURN NEW;
ELSE
UPDATE musicrowd.Participation SET montant = montant + NEW.montant, date_p = NEW.date_p WHERE user_id = NEW.user_id AND projet_id = NEW.projet_id;
RETURN NULL;
END IF;
ELSE 
	RAISE EXCEPTION 'NOT ENOUGH MONEY';
	RETURN NULL;
END IF;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for archivage
-- ----------------------------
DROP FUNCTION IF EXISTS "archivage"() CASCADE;
CREATE OR REPLACE FUNCTION "archivage"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
	DECLARE partici RECORD;
	DECLARE rew RECORD;
BEGIN
	RAISE NOTICE 'HERE';
	RAISE NOTICE 'VALUE: %', OLD.date_fin;
		RAISE NOTICE 'VALUE2: %', NEW.date_fin;
				RAISE NOTICE 'VALUE3: %', NOW();
	IF NEW.date_fin IN (SELECT "fiction_Date" FROM musicrowd."Fiction_Date") THEN
	RAISE NOTICE 'yeah ifffffff';
			INSERT INTO musicrowd.projet_archivage VALUES(OLD.projet_id, OLD.user_id,  OLD.nom_proj,OLD.description, OLD.date_deb, OLD.date_fin,OLD.somme_recoltee,OLD.objectif, OLD.taxe_perc);

		FOR partici IN SELECT * FROM musicrowd.participation pa WHERE pa.projet_id = NEW.projet_id

		LOOP
				INSERT INTO musicrowd.participation_archivage VALUES(partici.projet_id, partici.user_id,  partici.date_p);
			IF NEW.termine IS FALSE THEN
				UPDATE musicrowd.utilisateur SET balance = balance + partici.montant WHERE utilisateur.user_id = partici.user_id;
				NEW.somme_recoltee = NEW.somme_recoltee - partici.montant; 
			END IF;
				DELETE FROM musicrowd.participation p WHERE p.projet_id = partici.projet_id AND p.user_id = partici.user_id;
		END LOOP;
		
		FOR rew IN SELECT * FROM musicrowd.reward r WHERE r.projet_id = OLD.projet_id
		LOOP
				DELETE FROM musicrowd.reward rd WHERE rd.projet_id = rew.projet_id;
		END LOOP;
		DELETE FROM musicrowd.projet prt WHERE prt.projet_id = OLD.projet_id;
	RETURN NEW;
	END IF;
	RETURN NULL;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for getProjectMilestones
-- ----------------------------
DROP FUNCTION IF EXISTS "getProjectMilestones"("projet_idd" int4) CASCADE;
CREATE OR REPLACE FUNCTION "getProjectMilestones"("projet_idd" int4)
  RETURNS TABLE("projet_id" int4, "nom_projet" varchar, "milestones_description" varchar) AS $BODY$
BEGIN
RETURN QUERY
SELECT projet.projet_id, nom_proj, "Milestones"."description" FROM projet JOIN "Milestones" ON projet.projet_id = "Milestones".projet_id
WHERE projet.projet_id = 1 AND projet.somme_recoltee >= "Milestones"."objectif";
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;

-- ----------------------------
-- Function structure for getSponsorTaxOnProject
-- ----------------------------
DROP FUNCTION IF EXISTS "getSponsorTaxOnProject"("projet_idd" int4) CASCADE;
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

-- ----------------------------
-- Function structure for getalluser_rewards
-- ----------------------------
DROP FUNCTION IF EXISTS "getalluser_rewards"("user_idd" int4, "projet_idd" int4) CASCADE;
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

-- ----------------------------
-- Function structure for onCompletion
-- ----------------------------
DROP FUNCTION IF EXISTS "onCompletion"() CASCADE;
CREATE OR REPLACE FUNCTION "onCompletion"()
  RETURNS "pg_catalog"."trigger" AS $BODY$ 
	DECLARE rec RECORD;
	DECLARE partici RECORD;
	BEGIN
  -- Routine body goes here...
	FOR rec IN SELECT * FROM musicrowd.projet
	LOOP
		IF ((rec.somme_recoltee >= rec.objectif)) AND rec.date_fin = NEW."fiction_Date"
		THEN
			UPDATE musicrowd.projet SET termine = TRUE WHERE projet_id = rec.projet_id;
			RAISE NOTICE 'Somme percue apres application de la taxe musicrowd: %', rec.objectif - (rec.objectif*rec.taxe_perc/100);
			RETURN NEW; 
		ELSIF (	rec.date_fin = NEW."fiction_Date") THEN
			UPDATE musicrowd.projet SET termine = FALSE WHERE projet_id = rec.projet_id;
			FOR partici IN SELECT * FROM musicrowd.participation pa WHERE pa.projet_id = rec.projet_id
		LOOP
			--BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
			NEW.somme_recoltee = NEW.somme_recoltee - partici.montant;
			UPDATE musicrowd.utilisateur SET balance = balance + partici.montant WHERE user_id = partici.user_id;
			--COMMIT;
		END LOOP;
		-- DELETE PROJET OR archivage quand meme?
		RETURN NEW;
			RETURN NEW; END IF;
	END LOOP;
	RETURN NULL;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "participation_projet_id_seq"
OWNED BY "participation"."projet_id";
SELECT setval('"participation_projet_id_seq"', 2, false);
ALTER SEQUENCE "participation_user_id_seq"
OWNED BY "participation"."user_id";
SELECT setval('"participation_user_id_seq"', 2, false);
ALTER SEQUENCE "projet_projet_id_seq"
OWNED BY "projet"."projet_id";
SELECT setval('"projet_projet_id_seq"', 2, false);
ALTER SEQUENCE "projet_user_id_seq"
OWNED BY "projet"."user_id";
SELECT setval('"projet_user_id_seq"', 2, false);
ALTER SEQUENCE "reward_projet_id_seq"
OWNED BY "reward"."projet_id";
SELECT setval('"reward_projet_id_seq"', 2, false);
ALTER SEQUENCE "reward_reward_id_seq"
OWNED BY "reward"."reward_id";
SELECT setval('"reward_reward_id_seq"', 2, false);
ALTER SEQUENCE "sponsor_sponsor_id_seq"
OWNED BY "sponsor"."sponsor_id";
SELECT setval('"sponsor_sponsor_id_seq"', 2, false);
ALTER SEQUENCE "sponsored_projects_id_projet_seq"
OWNED BY "sponsored_projects"."id_projet";
SELECT setval('"sponsored_projects_id_projet_seq"', 2, false);
ALTER SEQUENCE "sponsored_projects_id_sponsor_seq"
OWNED BY "sponsored_projects"."id_sponsor";
SELECT setval('"sponsored_projects_id_sponsor_seq"', 3, true);
ALTER SEQUENCE "utilisateur_user_id_seq"
OWNED BY "utilisateur"."user_id";
SELECT setval('"utilisateur_user_id_seq"', 2, false);
