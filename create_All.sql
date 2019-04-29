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

 Date: 29/04/2019 18:13:47
*/


-- ----------------------------
-- Sequence structure for participation_projet_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "musicrowd"."participation_projet_id_seq" CASCADE;
CREATE SEQUENCE "musicrowd"."participation_projet_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for participation_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "musicrowd"."participation_user_id_seq" CASCADE;
CREATE SEQUENCE "musicrowd"."participation_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for projet_projet_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "musicrowd"."projet_projet_id_seq" CASCADE;
CREATE SEQUENCE "musicrowd"."projet_projet_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for projet_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "musicrowd"."projet_user_id_seq" CASCADE;
CREATE SEQUENCE "musicrowd"."projet_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for reward_projet_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "musicrowd"."reward_projet_id_seq" CASCADE;
CREATE SEQUENCE "musicrowd"."reward_projet_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for reward_reward_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "musicrowd"."reward_reward_id_seq" CASCADE;
CREATE SEQUENCE "musicrowd"."reward_reward_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sponsor_sponsor_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "musicrowd"."sponsor_sponsor_id_seq" CASCADE;
CREATE SEQUENCE "musicrowd"."sponsor_sponsor_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sponsored_projects_id_projet_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "musicrowd"."sponsored_projects_id_projet_seq" CASCADE;
CREATE SEQUENCE "musicrowd"."sponsored_projects_id_projet_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sponsored_projects_id_sponsor_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "musicrowd"."sponsored_projects_id_sponsor_seq" CASCADE;
CREATE SEQUENCE "musicrowd"."sponsored_projects_id_sponsor_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for utilisateur_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "musicrowd"."utilisateur_user_id_seq" CASCADE;
CREATE SEQUENCE "musicrowd"."utilisateur_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for Fiction_Date
-- ----------------------------
DROP TABLE IF EXISTS "musicrowd"."Fiction_Date" CASCADE;
CREATE TABLE "musicrowd"."Fiction_Date" (
  "fiction_Date" date NOT NULL
)
;

-- ----------------------------
-- Records of Fiction_Date
-- ----------------------------
INSERT INTO "musicrowd"."Fiction_Date" VALUES ('2019-05-23');

-- ----------------------------
-- Table structure for Milestones
-- ----------------------------
DROP TABLE IF EXISTS "musicrowd"."Milestones" CASCADE;
CREATE TABLE "musicrowd"."Milestones" (
  "projet_id" int4 NOT NULL,
  "Description" varchar(255) COLLATE "pg_catalog"."default",
  "Objectif" int4,
  "milsetone_id" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for participation
-- ----------------------------
DROP TABLE IF EXISTS "musicrowd"."participation" CASCADE;
CREATE TABLE "musicrowd"."participation" (
  "user_id" int4 NOT NULL DEFAULT nextval('"musicrowd".participation_user_id_seq'::regclass),
  "projet_id" int4 NOT NULL DEFAULT nextval('"musicrowd".participation_projet_id_seq'::regclass),
  "montant" int4,
  "date_p" date NOT NULL
)
;

-- ----------------------------
-- Table structure for participation_archivage
-- ----------------------------
DROP TABLE IF EXISTS "musicrowd"."participation_archivage" CASCADE;
CREATE TABLE "musicrowd"."participation_archivage" (
  "projet_id" int4 NOT NULL,
  "user_id" int4 NOT NULL,
  "date_p" date
)
;

-- ----------------------------
-- Records of participation_archivage
-- ----------------------------
INSERT INTO "musicrowd"."participation_archivage" VALUES (2, 2, '2019-04-25');
INSERT INTO "musicrowd"."participation_archivage" VALUES (4, 2, '2019-04-29');
INSERT INTO "musicrowd"."participation_archivage" VALUES (5, 2, '2019-04-29');

-- ----------------------------
-- Table structure for projet
-- ----------------------------
DROP TABLE IF EXISTS "musicrowd"."projet" CASCADE;
CREATE TABLE "musicrowd"."projet" (
  "projet_id" int4 NOT NULL DEFAULT nextval('"musicrowd".projet_projet_id_seq'::regclass),
  "user_id" int4 NOT NULL DEFAULT nextval('"musicrowd".projet_user_id_seq'::regclass),
  "nom_proj" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "description" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "date_deb" date NOT NULL,
  "date_fin" date NOT NULL,
  "objectif" int4,
  "somme_recoltee" int4,
  "taxe_perc" int4 NOT NULL,
  "termine" bool
)
;

-- ----------------------------
-- Records of projet
-- ----------------------------
INSERT INTO "musicrowd"."projet" VALUES (1, 1, 'boite de musique à manger', 'manger la musique au lieu de l écouter', '2019-05-11', '2019-06-01', 200000, 0, 10, 'f');

-- ----------------------------
-- Table structure for projet_archivage
-- ----------------------------
DROP TABLE IF EXISTS "musicrowd"."projet_archivage" CASCADE;
CREATE TABLE "musicrowd"."projet_archivage" (
  "projet_id" int4 NOT NULL,
  "user_id" int4,
  "nom_proj" varchar(255) COLLATE "pg_catalog"."default",
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "date_deb" date,
  "date_fin" date,
  "objectif" varchar(255) COLLATE "pg_catalog"."default",
  "somme_recoltee" varchar(255) COLLATE "pg_catalog"."default",
  "taxe_perc" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of projet_archivage
-- ----------------------------
INSERT INTO "musicrowd"."projet_archivage" VALUES (2, 2, 'Music 4 the Proo', 'musique pour les pro ps4 only', '2019-04-15', '2019-04-28', '50', NULL, NULL);
INSERT INTO "musicrowd"."projet_archivage" VALUES (6, 4, 'EP de mon groupe', 'DU bon hard rock', '2019-04-23', '2019-05-31', '10', NULL, NULL);
INSERT INTO "musicrowd"."projet_archivage" VALUES (4, 2, 'Financer notre nouvel album', '8 morceau de pur synthwave', '2019-05-17', '2019-06-02', '15', NULL, NULL);
INSERT INTO "musicrowd"."projet_archivage" VALUES (5, 3, 'Guitar HERO 12', 'bureau', '2019-04-23', '2019-05-23', '5', NULL, NULL);

-- ----------------------------
-- Table structure for reward
-- ----------------------------
DROP TABLE IF EXISTS "musicrowd"."reward" CASCADE;
CREATE TABLE "musicrowd"."reward" (
  "reward_id" int4 NOT NULL DEFAULT nextval('"musicrowd".reward_reward_id_seq'::regclass),
  "projet_id" int4 NOT NULL DEFAULT nextval('"musicrowd".reward_projet_id_seq'::regclass),
  "nom_cadeau" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "detail_cadeau" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "somme_min" int4,
  "somme_max" int4
)
;

-- ----------------------------
-- Records of reward
-- ----------------------------
INSERT INTO "musicrowd"."reward" VALUES (1, 1, 'Reconnaissance', 'reconnaissance éternelle du dieu de la guitare: Splash', 10, 400);
INSERT INTO "musicrowd"."reward" VALUES (2, 1, 'porte_clef', 'un porte clef à l effligie de notre seigneur tout puissant: Splash', 400, 450);
INSERT INTO "musicrowd"."reward" VALUES (3, 1, 'une guitare', 'guitare toute dernière génération avec tous pleins de boutons rigolos', 450, 2000);

-- ----------------------------
-- Table structure for sponsor
-- ----------------------------
DROP TABLE IF EXISTS "musicrowd"."sponsor" CASCADE;
CREATE TABLE "musicrowd"."sponsor" (
  "sponsor_id" int4 NOT NULL DEFAULT nextval('"musicrowd".sponsor_sponsor_id_seq'::regclass),
  "nom" varchar(255) COLLATE "pg_catalog"."default",
  "sponsor_type_id" int4 NOT NULL
)
;

-- ----------------------------
-- Records of sponsor
-- ----------------------------
INSERT INTO "musicrowd"."sponsor" VALUES (1, 'Gibson', 2);
INSERT INTO "musicrowd"."sponsor" VALUES (2, 'ESP', 2);
INSERT INTO "musicrowd"."sponsor" VALUES (3, 'SONY BMG', 1);

-- ----------------------------
-- Table structure for sponsor_type
-- ----------------------------
DROP TABLE IF EXISTS "musicrowd"."sponsor_type" CASCADE;
CREATE TABLE "musicrowd"."sponsor_type" (
  "sponsor_type_id" int4 NOT NULL,
  "sponsor_type_name" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of sponsor_type
-- ----------------------------
INSERT INTO "musicrowd"."sponsor_type" VALUES (1, 'Major');
INSERT INTO "musicrowd"."sponsor_type" VALUES (2, 'Maker');
INSERT INTO "musicrowd"."sponsor_type" VALUES (3, 'Radio');
INSERT INTO "musicrowd"."sponsor_type" VALUES (4, 'TV Channel');
INSERT INTO "musicrowd"."sponsor_type" VALUES (5, 'Corporation');
INSERT INTO "musicrowd"."sponsor_type" VALUES (6, 'Fashion Designer');

-- ----------------------------
-- Table structure for sponsored_projects
-- ----------------------------
DROP TABLE IF EXISTS "musicrowd"."sponsored_projects" CASCADE;
CREATE TABLE "musicrowd"."sponsored_projects" (
  "id_projet" int4 NOT NULL DEFAULT nextval('"musicrowd".sponsored_projects_id_projet_seq'::regclass),
  "id_sponsor" int4 NOT NULL DEFAULT nextval('"musicrowd".sponsored_projects_id_sponsor_seq'::regclass),
  "sponsoring_action" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of sponsored_projects
-- ----------------------------
INSERT INTO "musicrowd"."sponsored_projects" VALUES (1, 1, 'Les artistes derrière le projet gagne du materiel Gibson');

-- ----------------------------
-- Table structure for utilisateur
-- ----------------------------
DROP TABLE IF EXISTS "musicrowd"."utilisateur" CASCADE;
CREATE TABLE "musicrowd"."utilisateur" (
  "user_id" int4 NOT NULL DEFAULT nextval('"musicrowd".utilisateur_user_id_seq'::regclass),
  "mdp" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "nom" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "prenom" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "adresse" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "telephone" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "mail" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "rib" varchar(255) COLLATE "pg_catalog"."default",
  "nb_projet_supportes" int4 NOT NULL DEFAULT 0,
  "nb_projet_crees" int4 NOT NULL DEFAULT 0,
  "balance" int8 NOT NULL DEFAULT 0,
  "date_inscription" date,
  "date_connexion" date
)
;

-- ----------------------------
-- Records of utilisateur
-- ----------------------------
INSERT INTO "musicrowd"."utilisateur" VALUES (3, 'mot3passe', 'Rogova', 'Alexandra', '124 rue de compans', '0677667766', 'alexandra.rogova@etu.univ-paris-diderot.fr', NULL, 0, 1, 0, '2019-04-21', '2020-04-21');
INSERT INTO "musicrowd"."utilisateur" VALUES (4, 'mot4passe', 'Lolilol', 'hellol', '6 rue Thomas Mann', '0766776677', 'lolilol@irif.fr', 'DE567787868547980B34', 3, 1, 0, '2019-04-21', '2020-04-21');
INSERT INTO "musicrowd"."utilisateur" VALUES (1, 'mot2passe', 'Merat', 'Laure', '184 rue de Tolbiac', '0666666666', 'laure.merat@etu.univ-paris-diderot.fr', 'FR45898676776796237H65', 1, 0, 0, '2019-04-21', '2020-04-21');
INSERT INTO "musicrowd"."utilisateur" VALUES (7, 'rand', 'Hello', 'test', '20 rue pistache', '0891256023', 'jojojo@jojo.com', NULL, 0, 0, 0, '2019-04-29', '2020-04-21');
INSERT INTO "musicrowd"."utilisateur" VALUES (2, 'mot1passe', 'Amari', 'Nabil', '5 rue Thomas Mann', '0777777777', 'nabil.amari@etu.univ-paris-diderot.fr', 'FR04399902978798786N65', 6, 0, 49200000, '2019-04-21', '2020-04-21');
INSERT INTO "musicrowd"."utilisateur" VALUES (6, 'mot6passe', 'Jurski', 'Yan', '10 rue Thomas Mann', '0789235646', 'jurski@irif.fr', NULL, 0, 0, 0, '2019-04-21', '2020-04-21');

-- ----------------------------
-- Table structure for utilisateur_archivage
-- ----------------------------
DROP TABLE IF EXISTS "musicrowd"."utilisateur_archivage" CASCADE;
CREATE TABLE "musicrowd"."utilisateur_archivage" (
  "user_id" int4 NOT NULL,
  "nb_projet_supportes" int4,
  "nb_projet_crees" int4
)
;

-- ----------------------------
-- Records of utilisateur_archivage
-- ----------------------------
INSERT INTO "musicrowd"."utilisateur_archivage" VALUES (5, 0, 0);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "musicrowd"."participation_projet_id_seq"
OWNED BY "musicrowd"."participation"."projet_id";
SELECT setval('"musicrowd"."participation_projet_id_seq"', 2, false);
ALTER SEQUENCE "musicrowd"."participation_user_id_seq"
OWNED BY "musicrowd"."participation"."user_id";
SELECT setval('"musicrowd"."participation_user_id_seq"', 2, false);
ALTER SEQUENCE "musicrowd"."projet_projet_id_seq"
OWNED BY "musicrowd"."projet"."projet_id";
SELECT setval('"musicrowd"."projet_projet_id_seq"', 7, true);
ALTER SEQUENCE "musicrowd"."projet_user_id_seq"
OWNED BY "musicrowd"."projet"."user_id";
SELECT setval('"musicrowd"."projet_user_id_seq"', 2, false);
ALTER SEQUENCE "musicrowd"."reward_projet_id_seq"
OWNED BY "musicrowd"."reward"."projet_id";
SELECT setval('"musicrowd"."reward_projet_id_seq"', 2, false);
ALTER SEQUENCE "musicrowd"."reward_reward_id_seq"
OWNED BY "musicrowd"."reward"."reward_id";
SELECT setval('"musicrowd"."reward_reward_id_seq"', 17, true);
ALTER SEQUENCE "musicrowd"."sponsor_sponsor_id_seq"
OWNED BY "musicrowd"."sponsor"."sponsor_id";
SELECT setval('"musicrowd"."sponsor_sponsor_id_seq"', 2, false);
ALTER SEQUENCE "musicrowd"."sponsored_projects_id_projet_seq"
OWNED BY "musicrowd"."sponsored_projects"."id_projet";
SELECT setval('"musicrowd"."sponsored_projects_id_projet_seq"', 2, false);
ALTER SEQUENCE "musicrowd"."sponsored_projects_id_sponsor_seq"
OWNED BY "musicrowd"."sponsored_projects"."id_sponsor";
SELECT setval('"musicrowd"."sponsored_projects_id_sponsor_seq"', 2, false);
ALTER SEQUENCE "musicrowd"."utilisateur_user_id_seq"
OWNED BY "musicrowd"."utilisateur"."user_id";
SELECT setval('"musicrowd"."utilisateur_user_id_seq"', 8, true);

-- ----------------------------
-- Primary Key structure for table Fiction_Date
-- ----------------------------
ALTER TABLE "musicrowd"."Fiction_Date" ADD CONSTRAINT "Fiction_Date_pkey" PRIMARY KEY ("fiction_Date");

-- ----------------------------
-- Primary Key structure for table Milestones
-- ----------------------------
ALTER TABLE "musicrowd"."Milestones" ADD CONSTRAINT "Milestones_pkey" PRIMARY KEY ("projet_id", "milsetone_id");

-- ----------------------------
-- Checks structure for table participation
-- ----------------------------
ALTER TABLE "musicrowd"."participation" ADD CONSTRAINT "participation_montant_check" CHECK ((montant > 0));

-- ----------------------------
-- Primary Key structure for table participation
-- ----------------------------
ALTER TABLE "musicrowd"."participation" ADD CONSTRAINT "participation_pkey" PRIMARY KEY ("user_id", "projet_id");

-- ----------------------------
-- Primary Key structure for table participation_archivage
-- ----------------------------
ALTER TABLE "musicrowd"."participation_archivage" ADD CONSTRAINT "archivage_pkey" PRIMARY KEY ("projet_id", "user_id");

-- ----------------------------
-- Uniques structure for table projet
-- ----------------------------
ALTER TABLE "musicrowd"."projet" ADD CONSTRAINT "projet_nom_proj_key" UNIQUE ("nom_proj");

-- ----------------------------
-- Checks structure for table projet
-- ----------------------------
ALTER TABLE "musicrowd"."projet" ADD CONSTRAINT "projet_check" CHECK ((date_deb < date_fin));
ALTER TABLE "musicrowd"."projet" ADD CONSTRAINT "projet_check1" CHECK ((date_fin > date_deb));
ALTER TABLE "musicrowd"."projet" ADD CONSTRAINT "projet_objectif_check" CHECK ((objectif >= 1000));

-- ----------------------------
-- Primary Key structure for table projet
-- ----------------------------
ALTER TABLE "musicrowd"."projet" ADD CONSTRAINT "projet_pkey" PRIMARY KEY ("projet_id");

-- ----------------------------
-- Primary Key structure for table projet_archivage
-- ----------------------------
ALTER TABLE "musicrowd"."projet_archivage" ADD CONSTRAINT "projet_archivage_pkey" PRIMARY KEY ("projet_id");

-- ----------------------------
-- Checks structure for table reward
-- ----------------------------
ALTER TABLE "musicrowd"."reward" ADD CONSTRAINT "reward_somme_min_check" CHECK ((somme_min > 0));
ALTER TABLE "musicrowd"."reward" ADD CONSTRAINT "reward_check" CHECK ((somme_min < somme_max));
ALTER TABLE "musicrowd"."reward" ADD CONSTRAINT "reward_check1" CHECK ((somme_max > somme_min));

-- ----------------------------
-- Primary Key structure for table reward
-- ----------------------------
ALTER TABLE "musicrowd"."reward" ADD CONSTRAINT "reward_pkey" PRIMARY KEY ("reward_id");

-- ----------------------------
-- Primary Key structure for table sponsor
-- ----------------------------
ALTER TABLE "musicrowd"."sponsor" ADD CONSTRAINT "sponsor_pkey" PRIMARY KEY ("sponsor_id");

-- ----------------------------
-- Primary Key structure for table sponsor_type
-- ----------------------------
ALTER TABLE "musicrowd"."sponsor_type" ADD CONSTRAINT "sponsor_type_pkey" PRIMARY KEY ("sponsor_type_id");

-- ----------------------------
-- Indexes structure for table sponsored_projects
-- ----------------------------
CREATE INDEX "spons_proj__idx" ON "musicrowd"."sponsored_projects" USING btree (
  "id_projet" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "id_sponsor" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sponsored_projects
-- ----------------------------
ALTER TABLE "musicrowd"."sponsored_projects" ADD CONSTRAINT "sponsored_projects_pkey" PRIMARY KEY ("id_projet", "id_sponsor");

-- ----------------------------
-- Uniques structure for table utilisateur
-- ----------------------------
ALTER TABLE "musicrowd"."utilisateur" ADD CONSTRAINT "utilisateur_telephone_key" UNIQUE ("telephone");
ALTER TABLE "musicrowd"."utilisateur" ADD CONSTRAINT "utilisateur_rib_key" UNIQUE ("rib");

-- ----------------------------
-- Primary Key structure for table utilisateur
-- ----------------------------
ALTER TABLE "musicrowd"."utilisateur" ADD CONSTRAINT "utilisateur_pkey" PRIMARY KEY ("user_id");

-- ----------------------------
-- Primary Key structure for table utilisateur_archivage
-- ----------------------------
ALTER TABLE "musicrowd"."utilisateur_archivage" ADD CONSTRAINT "utilisateur_archivage_pkey" PRIMARY KEY ("user_id");

-- ----------------------------
-- Foreign Keys structure for table Milestones
-- ----------------------------
ALTER TABLE "musicrowd"."Milestones" ADD CONSTRAINT "projet_id_fk" FOREIGN KEY ("projet_id") REFERENCES "musicrowd"."projet" ("projet_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table participation
-- ----------------------------
ALTER TABLE "musicrowd"."participation" ADD CONSTRAINT "participation_projet_id_fkey" FOREIGN KEY ("projet_id") REFERENCES "musicrowd"."projet" ("projet_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "musicrowd"."participation" ADD CONSTRAINT "participation_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "musicrowd"."utilisateur" ("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table participation_archivage
-- ----------------------------
ALTER TABLE "musicrowd"."participation_archivage" ADD CONSTRAINT "projet_archivage_id_fk" FOREIGN KEY ("projet_id") REFERENCES "musicrowd"."projet_archivage" ("projet_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table projet
-- ----------------------------
ALTER TABLE "musicrowd"."projet" ADD CONSTRAINT "projet_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "musicrowd"."utilisateur" ("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table reward
-- ----------------------------
ALTER TABLE "musicrowd"."reward" ADD CONSTRAINT "reward_projet_id_fkey" FOREIGN KEY ("projet_id") REFERENCES "musicrowd"."projet" ("projet_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table sponsor
-- ----------------------------
ALTER TABLE "musicrowd"."sponsor" ADD CONSTRAINT "sponsor_sponsor_type_id_fk" FOREIGN KEY ("sponsor_type_id") REFERENCES "musicrowd"."sponsor_type" ("sponsor_type_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table sponsored_projects
-- ----------------------------
ALTER TABLE "musicrowd"."sponsored_projects" ADD CONSTRAINT "id_projet_fk" FOREIGN KEY ("id_projet") REFERENCES "musicrowd"."projet" ("projet_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "musicrowd"."sponsored_projects" ADD CONSTRAINT "id_sponsor_fk" FOREIGN KEY ("id_sponsor") REFERENCES "musicrowd"."sponsor" ("sponsor_id") ON DELETE CASCADE ON UPDATE CASCADE;
