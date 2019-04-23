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

 Date: 23/04/2019 15:37:54
*/


-- ----------------------------
-- Table structure for Fiction_Date
-- ----------------------------
DROP TABLE IF EXISTS "Fiction_Date" CASCADE;
CREATE TABLE "Fiction_Date" (
  "fiction_Date" date NOT NULL
)
;

-- ----------------------------
-- Table structure for archivage
-- ----------------------------
DROP TABLE IF EXISTS "archivage" CASCADE;
CREATE TABLE "archivage" (
  "projet_id" int4 NOT NULL,
  "user_id" int4 NOT NULL,
  "date_p" date
)
;

-- ----------------------------
-- Table structure for genre
-- ----------------------------
DROP TABLE IF EXISTS "genre" CASCADE;
CREATE TABLE "genre" (
  "nom" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for groupe
-- ----------------------------
DROP TABLE IF EXISTS "groupe" CASCADE;
CREATE TABLE "groupe" (
  "groupe_id" int4 NOT NULL DEFAULT nextval('musicrowd.groupe_groupe_id_seq'::regclass),
  "nom" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
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
  "nb_projet_supportes" int4,
  "nb_projet_crees" int4
)
;

-- ----------------------------
-- Primary Key structure for table Fiction_Date
-- ----------------------------
ALTER TABLE "Fiction_Date" ADD CONSTRAINT "Fiction_Date_pkey" PRIMARY KEY ("fiction_Date");

-- ----------------------------
-- Primary Key structure for table archivage
-- ----------------------------
ALTER TABLE "archivage" ADD CONSTRAINT "archivage_pkey" PRIMARY KEY ("projet_id", "user_id");

-- ----------------------------
-- Primary Key structure for table genre
-- ----------------------------
ALTER TABLE "genre" ADD CONSTRAINT "genre_pkey" PRIMARY KEY ("nom");

-- ----------------------------
-- Uniques structure for table groupe
-- ----------------------------
ALTER TABLE "groupe" ADD CONSTRAINT "groupe_nom_key" UNIQUE ("nom");

-- ----------------------------
-- Primary Key structure for table groupe
-- ----------------------------
ALTER TABLE "groupe" ADD CONSTRAINT "groupe_pkey" PRIMARY KEY ("groupe_id");

-- ----------------------------
-- Checks structure for table participation
-- ----------------------------
ALTER TABLE "participation" ADD CONSTRAINT "participation_montant_check" CHECK ((montant > 0));

-- ----------------------------
-- Primary Key structure for table participation
-- ----------------------------
ALTER TABLE "participation" ADD CONSTRAINT "participation_pkey" PRIMARY KEY ("user_id", "projet_id");

-- ----------------------------
-- Uniques structure for table projet
-- ----------------------------
ALTER TABLE "projet" ADD CONSTRAINT "projet_nom_proj_key" UNIQUE ("nom_proj");

-- ----------------------------
-- Checks structure for table projet
-- ----------------------------
ALTER TABLE "projet" ADD CONSTRAINT "projet_check1" CHECK ((date_fin > date_deb));
ALTER TABLE "projet" ADD CONSTRAINT "projet_date_deb_check" CHECK ((date_deb >= date(now())));
ALTER TABLE "projet" ADD CONSTRAINT "projet_objectif_check" CHECK ((objectif >= 1000));
ALTER TABLE "projet" ADD CONSTRAINT "projet_check" CHECK ((date_deb < date_fin));

-- ----------------------------
-- Primary Key structure for table projet
-- ----------------------------
ALTER TABLE "projet" ADD CONSTRAINT "projet_pkey" PRIMARY KEY ("projet_id");

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
-- Foreign Keys structure for table archivage
-- ----------------------------
ALTER TABLE "archivage" ADD CONSTRAINT "projet_id_fk" FOREIGN KEY ("projet_id") REFERENCES "projet" ("projet_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "archivage" ADD CONSTRAINT "user_id_fk" FOREIGN KEY ("user_id") REFERENCES "utilisateur" ("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table participation
-- ----------------------------
ALTER TABLE "participation" ADD CONSTRAINT "participation_projet_id_fkey" FOREIGN KEY ("projet_id") REFERENCES "projet" ("projet_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "participation" ADD CONSTRAINT "participation_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "utilisateur" ("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

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
