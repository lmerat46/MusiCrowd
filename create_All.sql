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

 Date: 03/05/2019 15:47:53
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
-- Table structure for Fiction_Date
-- ----------------------------
DROP TABLE IF EXISTS "Fiction_Date" CASCADE;
CREATE TABLE "Fiction_Date" (
  "fiction_Date" date NOT NULL
)
;

-- ----------------------------
-- Table structure for Milestones
-- ----------------------------
DROP TABLE IF EXISTS "Milestones" CASCADE;
CREATE TABLE "Milestones" (
  "projet_id" int4 NOT NULL,
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "objectif" int4,
  "milsetone_id" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for participation
-- ----------------------------
DROP TABLE IF EXISTS "participation" CASCADE;
CREATE TABLE "participation" (
  "user_id" int4 NOT NULL DEFAULT nextval('musicrowd.participation_user_id_seq'::regclass),
  "projet_id" int4 NOT NULL DEFAULT nextval('musicrowd.participation_projet_id_seq'::regclass),
  "montant" int4,
  "date_p" date NOT NULL
)
;

-- ----------------------------
-- Table structure for participation_archivage
-- ----------------------------
DROP TABLE IF EXISTS "participation_archivage" CASCADE;
CREATE TABLE "participation_archivage" (
  "projet_id" int4 NOT NULL,
  "user_id" int4 NOT NULL,
  "date_p" date
)
;

-- ----------------------------
-- Table structure for projet
-- ----------------------------
DROP TABLE IF EXISTS "projet" CASCADE;
CREATE TABLE "projet" (
  "projet_id" int4 NOT NULL DEFAULT nextval('musicrowd.projet_projet_id_seq'::regclass),
  "user_id" int4 NOT NULL DEFAULT nextval('musicrowd.projet_user_id_seq'::regclass),
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
-- Table structure for projet_archivage
-- ----------------------------
DROP TABLE IF EXISTS "projet_archivage" CASCADE;
CREATE TABLE "projet_archivage" (
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
-- Table structure for reward
-- ----------------------------
DROP TABLE IF EXISTS "reward" CASCADE;
CREATE TABLE "reward" (
  "reward_id" int4 NOT NULL DEFAULT nextval('musicrowd.reward_reward_id_seq'::regclass),
  "projet_id" int4 NOT NULL DEFAULT nextval('musicrowd.reward_projet_id_seq'::regclass),
  "nom_cadeau" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "detail_cadeau" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "somme_min" int4,
  "somme_max" int4
)
;

-- ----------------------------
-- Table structure for sponsor
-- ----------------------------
DROP TABLE IF EXISTS "sponsor" CASCADE;
CREATE TABLE "sponsor" (
  "sponsor_id" int4 NOT NULL DEFAULT nextval('musicrowd.sponsor_sponsor_id_seq'::regclass),
  "nom" varchar(255) COLLATE "pg_catalog"."default",
  "sponsor_type_id" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for sponsor_type
-- ----------------------------
DROP TABLE IF EXISTS "sponsor_type" CASCADE;
CREATE TABLE "sponsor_type" (
  "sponsor_type_id" int4 NOT NULL,
  "sponsor_type_name" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for sponsored_projects
-- ----------------------------
DROP TABLE IF EXISTS "sponsored_projects" CASCADE;
CREATE TABLE "sponsored_projects" (
  "id_projet" int4 NOT NULL DEFAULT nextval('musicrowd.sponsored_projects_id_projet_seq'::regclass),
  "id_sponsor" int4 NOT NULL DEFAULT nextval('musicrowd.sponsored_projects_id_sponsor_seq'::regclass),
  "sponsoring_action" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for utilisateur
-- ----------------------------
DROP TABLE IF EXISTS "utilisateur" CASCADE;
CREATE TABLE "utilisateur" (
  "user_id" int4 NOT NULL DEFAULT nextval('musicrowd.utilisateur_user_id_seq'::regclass),
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
-- Table structure for utilisateur_archivage
-- ----------------------------
DROP TABLE IF EXISTS "utilisateur_archivage" CASCADE;
CREATE TABLE "utilisateur_archivage" (
  "user_id" int4 NOT NULL,
  "nb_projet_supportes" int4,
  "nb_projet_crees" int4
)
;

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
SELECT setval('"projet_projet_id_seq"', 5, true);
ALTER SEQUENCE "projet_user_id_seq"
OWNED BY "projet"."user_id";
SELECT setval('"projet_user_id_seq"', 2, false);
ALTER SEQUENCE "reward_projet_id_seq"
OWNED BY "reward"."projet_id";
SELECT setval('"reward_projet_id_seq"', 2, false);
ALTER SEQUENCE "reward_reward_id_seq"
OWNED BY "reward"."reward_id";
SELECT setval('"reward_reward_id_seq"', 16, true);
ALTER SEQUENCE "sponsor_sponsor_id_seq"
OWNED BY "sponsor"."sponsor_id";
SELECT setval('"sponsor_sponsor_id_seq"', 2, false);
ALTER SEQUENCE "sponsored_projects_id_projet_seq"
OWNED BY "sponsored_projects"."id_projet";
SELECT setval('"sponsored_projects_id_projet_seq"', 2, false);
ALTER SEQUENCE "sponsored_projects_id_sponsor_seq"
OWNED BY "sponsored_projects"."id_sponsor";
SELECT setval('"sponsored_projects_id_sponsor_seq"', 2, false);
ALTER SEQUENCE "utilisateur_user_id_seq"
OWNED BY "utilisateur"."user_id";
SELECT setval('"utilisateur_user_id_seq"', 6, true);

-- ----------------------------
-- Primary Key structure for table Fiction_Date
-- ----------------------------
ALTER TABLE "Fiction_Date" ADD CONSTRAINT "Fiction_Date_pkey" PRIMARY KEY ("fiction_Date");

-- ----------------------------
-- Primary Key structure for table Milestones
-- ----------------------------
ALTER TABLE "Milestones" ADD CONSTRAINT "Milestones_pkey" PRIMARY KEY ("projet_id", "milsetone_id");

-- ----------------------------
-- Checks structure for table participation
-- ----------------------------
ALTER TABLE "participation" ADD CONSTRAINT "participation_montant_check" CHECK ((montant > 0));

-- ----------------------------
-- Primary Key structure for table participation
-- ----------------------------
ALTER TABLE "participation" ADD CONSTRAINT "participation_pkey" PRIMARY KEY ("user_id", "projet_id");

-- ----------------------------
-- Primary Key structure for table participation_archivage
-- ----------------------------
ALTER TABLE "participation_archivage" ADD CONSTRAINT "archivage_pkey" PRIMARY KEY ("projet_id", "user_id");

-- ----------------------------
-- Uniques structure for table projet
-- ----------------------------
ALTER TABLE "projet" ADD CONSTRAINT "projet_nom_proj_key" UNIQUE ("nom_proj");

-- ----------------------------
-- Checks structure for table projet
-- ----------------------------
ALTER TABLE "projet" ADD CONSTRAINT "projet_check" CHECK ((date_deb < date_fin));
ALTER TABLE "projet" ADD CONSTRAINT "projet_check1" CHECK ((date_fin > date_deb));
ALTER TABLE "projet" ADD CONSTRAINT "projet_objectif_check" CHECK ((objectif >= 1000));

-- ----------------------------
-- Primary Key structure for table projet
-- ----------------------------
ALTER TABLE "projet" ADD CONSTRAINT "projet_pkey" PRIMARY KEY ("projet_id");

-- ----------------------------
-- Primary Key structure for table projet_archivage
-- ----------------------------
ALTER TABLE "projet_archivage" ADD CONSTRAINT "projet_archivage_pkey" PRIMARY KEY ("projet_id");

-- ----------------------------
-- Checks structure for table reward
-- ----------------------------
ALTER TABLE "reward" ADD CONSTRAINT "reward_somme_min_check" CHECK ((somme_min > 0));
ALTER TABLE "reward" ADD CONSTRAINT "reward_check" CHECK ((somme_min < somme_max));
ALTER TABLE "reward" ADD CONSTRAINT "reward_check1" CHECK ((somme_max > somme_min));

-- ----------------------------
-- Primary Key structure for table reward
-- ----------------------------
ALTER TABLE "reward" ADD CONSTRAINT "reward_pkey" PRIMARY KEY ("reward_id");

-- ----------------------------
-- Primary Key structure for table sponsor
-- ----------------------------
ALTER TABLE "sponsor" ADD CONSTRAINT "sponsor_pkey" PRIMARY KEY ("sponsor_id");

-- ----------------------------
-- Primary Key structure for table sponsor_type
-- ----------------------------
ALTER TABLE "sponsor_type" ADD CONSTRAINT "sponsor_type_pkey" PRIMARY KEY ("sponsor_type_id");

-- ----------------------------
-- Indexes structure for table sponsored_projects
-- ----------------------------
CREATE INDEX "spons_proj__idx" ON "sponsored_projects" USING btree (
  "id_projet" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "id_sponsor" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sponsored_projects
-- ----------------------------
ALTER TABLE "sponsored_projects" ADD CONSTRAINT "sponsored_projects_pkey" PRIMARY KEY ("id_projet", "id_sponsor");

-- ----------------------------
-- Uniques structure for table utilisateur
-- ----------------------------
ALTER TABLE "utilisateur" ADD CONSTRAINT "utilisateur_telephone_key" UNIQUE ("telephone");
ALTER TABLE "utilisateur" ADD CONSTRAINT "utilisateur_rib_key" UNIQUE ("rib");

-- ----------------------------
-- Primary Key structure for table utilisateur
-- ----------------------------
ALTER TABLE "utilisateur" ADD CONSTRAINT "utilisateur_pkey" PRIMARY KEY ("user_id");

-- ----------------------------
-- Primary Key structure for table utilisateur_archivage
-- ----------------------------
ALTER TABLE "utilisateur_archivage" ADD CONSTRAINT "utilisateur_archivage_pkey" PRIMARY KEY ("user_id");

-- ----------------------------
-- Foreign Keys structure for table Milestones
-- ----------------------------
ALTER TABLE "Milestones" ADD CONSTRAINT "projet_id_fk" FOREIGN KEY ("projet_id") REFERENCES "projet" ("projet_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table participation
-- ----------------------------
ALTER TABLE "participation" ADD CONSTRAINT "participation_projet_id_fkey" FOREIGN KEY ("projet_id") REFERENCES "projet" ("projet_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "participation" ADD CONSTRAINT "participation_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "utilisateur" ("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table participation_archivage
-- ----------------------------
ALTER TABLE "participation_archivage" ADD CONSTRAINT "projet_archivage_id_fk" FOREIGN KEY ("projet_id") REFERENCES "projet_archivage" ("projet_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table projet
-- ----------------------------
ALTER TABLE "projet" ADD CONSTRAINT "projet_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "utilisateur" ("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table reward
-- ----------------------------
ALTER TABLE "reward" ADD CONSTRAINT "reward_projet_id_fkey" FOREIGN KEY ("projet_id") REFERENCES "projet" ("projet_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table sponsor
-- ----------------------------
ALTER TABLE "sponsor" ADD CONSTRAINT "sponsor_sponsor_type_id_fk" FOREIGN KEY ("sponsor_type_id") REFERENCES "sponsor_type" ("sponsor_type_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table sponsored_projects
-- ----------------------------
ALTER TABLE "sponsored_projects" ADD CONSTRAINT "id_projet_fk" FOREIGN KEY ("id_projet") REFERENCES "projet" ("projet_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sponsored_projects" ADD CONSTRAINT "id_sponsor_fk" FOREIGN KEY ("id_sponsor") REFERENCES "sponsor" ("sponsor_id") ON DELETE CASCADE ON UPDATE CASCADE;
