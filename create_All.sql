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

 Date: 17/04/2019 16:48:42
*/

CREATE SCHEMA MusiCrowd;


-- ----------------------------
-- Sequence structure for groupe_groupe_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "musicrowd"."groupe_groupe_id_seq";
CREATE SEQUENCE "musicrowd"."groupe_groupe_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "musicrowd"."groupe_groupe_id_seq" OWNER TO "winstryke";

-- ----------------------------
-- Sequence structure for participation_projet_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "musicrowd"."participation_projet_id_seq";
CREATE SEQUENCE "musicrowd"."participation_projet_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "musicrowd"."participation_projet_id_seq" OWNER TO "winstryke";

-- ----------------------------
-- Sequence structure for participation_reward_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "musicrowd"."participation_reward_id_seq";
CREATE SEQUENCE "musicrowd"."participation_reward_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "musicrowd"."participation_reward_id_seq" OWNER TO "winstryke";

-- ----------------------------
-- Sequence structure for participation_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "musicrowd"."participation_user_id_seq";
CREATE SEQUENCE "musicrowd"."participation_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "musicrowd"."participation_user_id_seq" OWNER TO "winstryke";

-- ----------------------------
-- Sequence structure for projet_projet_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "musicrowd"."projet_projet_id_seq";
CREATE SEQUENCE "musicrowd"."projet_projet_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "musicrowd"."projet_projet_id_seq" OWNER TO "winstryke";

-- ----------------------------
-- Sequence structure for projet_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "musicrowd"."projet_user_id_seq";
CREATE SEQUENCE "musicrowd"."projet_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "musicrowd"."projet_user_id_seq" OWNER TO "winstryke";

-- ----------------------------
-- Sequence structure for reward_projet_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "musicrowd"."reward_projet_id_seq";
CREATE SEQUENCE "musicrowd"."reward_projet_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "musicrowd"."reward_projet_id_seq" OWNER TO "winstryke";

-- ----------------------------
-- Sequence structure for reward_reward_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "musicrowd"."reward_reward_id_seq";
CREATE SEQUENCE "musicrowd"."reward_reward_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "musicrowd"."reward_reward_id_seq" OWNER TO "winstryke";

-- ----------------------------
-- Sequence structure for sponsor_sponsor_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "musicrowd"."sponsor_sponsor_id_seq";
CREATE SEQUENCE "musicrowd"."sponsor_sponsor_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "musicrowd"."sponsor_sponsor_id_seq" OWNER TO "winstryke";

-- ----------------------------
-- Sequence structure for utilisateur_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "musicrowd"."utilisateur_user_id_seq";
CREATE SEQUENCE "musicrowd"."utilisateur_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "musicrowd"."utilisateur_user_id_seq" OWNER TO "winstryke";

-- ----------------------------
-- Table structure for genre
-- ----------------------------
DROP TABLE IF EXISTS "musicrowd"."genre";
CREATE TABLE "musicrowd"."genre" (
  "nom" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;
ALTER TABLE "musicrowd"."genre" OWNER TO "winstryke";

-- ----------------------------
-- Table structure for groupe
-- ----------------------------
DROP TABLE IF EXISTS "musicrowd"."groupe";
CREATE TABLE "musicrowd"."groupe" (
  "groupe_id" int4 NOT NULL DEFAULT nextval('"musicrowd".groupe_groupe_id_seq'::regclass),
  "nom" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;
ALTER TABLE "musicrowd"."groupe" OWNER TO "winstryke";

-- ----------------------------
-- Table structure for participation
-- ----------------------------
DROP TABLE IF EXISTS "musicrowd"."participation";
CREATE TABLE "musicrowd"."participation" (
  "user_id" int4 NOT NULL DEFAULT nextval('"musicrowd".participation_user_id_seq'::regclass),
  "projet_id" int4 NOT NULL DEFAULT nextval('"musicrowd".participation_projet_id_seq'::regclass),
  "reward_id" int4 NOT NULL DEFAULT nextval('"musicrowd".participation_reward_id_seq'::regclass),
  "montant" int4,
  "date_p" date NOT NULL
)
;
ALTER TABLE "musicrowd"."participation" OWNER TO "winstryke";

-- ----------------------------
-- Table structure for projet
-- ----------------------------
DROP TABLE IF EXISTS "musicrowd"."projet";
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
ALTER TABLE "musicrowd"."projet" OWNER TO "winstryke";

-- ----------------------------
-- Table structure for reward
-- ----------------------------
DROP TABLE IF EXISTS "musicrowd"."reward";
CREATE TABLE "musicrowd"."reward" (
  "reward_id" int4 NOT NULL DEFAULT nextval('"musicrowd".reward_reward_id_seq'::regclass),
  "projet_id" int4 NOT NULL DEFAULT nextval('"musicrowd".reward_projet_id_seq'::regclass),
  "nom_cadeau" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "detail_cadeau" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "somme_min" int4,
  "somme_max" int4
)
;
ALTER TABLE "musicrowd"."reward" OWNER TO "winstryke";

-- ----------------------------
-- Table structure for sponsor
-- ----------------------------
DROP TABLE IF EXISTS "musicrowd"."sponsor";
CREATE TABLE "musicrowd"."sponsor" (
  "sponsor_id" int4 NOT NULL DEFAULT nextval('"musicrowd".sponsor_sponsor_id_seq'::regclass),
  "nom" varchar(255) COLLATE "pg_catalog"."default",
  "sponsor_type_id" int4 NOT NULL
)
;
ALTER TABLE "musicrowd"."sponsor" OWNER TO "winstryke";

-- ----------------------------
-- Table structure for sponsor_type
-- ----------------------------
DROP TABLE IF EXISTS "musicrowd"."sponsor_type";
CREATE TABLE "musicrowd"."sponsor_type" (
  "sponsor_type_id" int4 NOT NULL,
  "sponsor_type_name" varchar(255) COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "musicrowd"."sponsor_type" OWNER TO "winstryke";

-- ----------------------------
-- Table structure for utilisateur
-- ----------------------------
DROP TABLE IF EXISTS "musicrowd"."utilisateur";
CREATE TABLE "musicrowd"."utilisateur" (
  "user_id" int4 NOT NULL DEFAULT nextval('"musicrowd".utilisateur_user_id_seq'::regclass),
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
ALTER TABLE "musicrowd"."utilisateur" OWNER TO "winstryke";

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "musicrowd"."groupe_groupe_id_seq"
OWNED BY "musicrowd"."groupe"."groupe_id";
SELECT setval('"musicrowd"."groupe_groupe_id_seq"', 2, false);
ALTER SEQUENCE "musicrowd"."participation_projet_id_seq"
OWNED BY "musicrowd"."participation"."projet_id";
SELECT setval('"musicrowd"."participation_projet_id_seq"', 2, false);
ALTER SEQUENCE "musicrowd"."participation_reward_id_seq"
OWNED BY "musicrowd"."participation"."reward_id";
SELECT setval('"musicrowd"."participation_reward_id_seq"', 2, false);
ALTER SEQUENCE "musicrowd"."participation_user_id_seq"
OWNED BY "musicrowd"."participation"."user_id";
SELECT setval('"musicrowd"."participation_user_id_seq"', 2, false);
ALTER SEQUENCE "musicrowd"."projet_projet_id_seq"
OWNED BY "musicrowd"."projet"."projet_id";
SELECT setval('"musicrowd"."projet_projet_id_seq"', 5, true);
ALTER SEQUENCE "musicrowd"."projet_user_id_seq"
OWNED BY "musicrowd"."projet"."user_id";
SELECT setval('"musicrowd"."projet_user_id_seq"', 2, false);
ALTER SEQUENCE "musicrowd"."reward_projet_id_seq"
OWNED BY "musicrowd"."reward"."projet_id";
SELECT setval('"musicrowd"."reward_projet_id_seq"', 2, false);
ALTER SEQUENCE "musicrowd"."reward_reward_id_seq"
OWNED BY "musicrowd"."reward"."reward_id";
SELECT setval('"musicrowd"."reward_reward_id_seq"', 16, true);
ALTER SEQUENCE "musicrowd"."sponsor_sponsor_id_seq"
OWNED BY "musicrowd"."sponsor"."sponsor_id";
SELECT setval('"musicrowd"."sponsor_sponsor_id_seq"', 2, false);
ALTER SEQUENCE "musicrowd"."utilisateur_user_id_seq"
OWNED BY "musicrowd"."utilisateur"."user_id";
SELECT setval('"musicrowd"."utilisateur_user_id_seq"', 7, true);

-- ----------------------------
-- Primary Key structure for table genre
-- ----------------------------
ALTER TABLE "musicrowd"."genre" ADD CONSTRAINT "genre_pkey" PRIMARY KEY ("nom");

-- ----------------------------
-- Uniques structure for table groupe
-- ----------------------------
ALTER TABLE "musicrowd"."groupe" ADD CONSTRAINT "groupe_nom_key" UNIQUE ("nom");

-- ----------------------------
-- Primary Key structure for table groupe
-- ----------------------------
ALTER TABLE "musicrowd"."groupe" ADD CONSTRAINT "groupe_pkey" PRIMARY KEY ("groupe_id");

-- ----------------------------
-- Checks structure for table participation
-- ----------------------------
ALTER TABLE "musicrowd"."participation" ADD CONSTRAINT "participation_montant_check" CHECK ((montant > 0));

-- ----------------------------
-- Primary Key structure for table participation
-- ----------------------------
ALTER TABLE "musicrowd"."participation" ADD CONSTRAINT "participation_pkey" PRIMARY KEY ("user_id", "projet_id", "reward_id");

-- ----------------------------
-- Uniques structure for table projet
-- ----------------------------
ALTER TABLE "musicrowd"."projet" ADD CONSTRAINT "projet_nom_proj_key" UNIQUE ("nom_proj");

-- ----------------------------
-- Checks structure for table projet
-- ----------------------------
ALTER TABLE "musicrowd"."projet" ADD CONSTRAINT "projet_check1" CHECK ((date_fin > date_deb));
ALTER TABLE "musicrowd"."projet" ADD CONSTRAINT "projet_date_deb_check" CHECK ((date_deb >= date(now())));
ALTER TABLE "musicrowd"."projet" ADD CONSTRAINT "projet_objectif_check" CHECK ((objectif >= 1000));
ALTER TABLE "musicrowd"."projet" ADD CONSTRAINT "projet_check" CHECK ((date_deb < date_fin));

-- ----------------------------
-- Primary Key structure for table projet
-- ----------------------------
ALTER TABLE "musicrowd"."projet" ADD CONSTRAINT "projet_pkey" PRIMARY KEY ("projet_id");

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
-- Uniques structure for table utilisateur
-- ----------------------------
ALTER TABLE "musicrowd"."utilisateur" ADD CONSTRAINT "utilisateur_telephone_key" UNIQUE ("telephone");
ALTER TABLE "musicrowd"."utilisateur" ADD CONSTRAINT "utilisateur_rib_key" UNIQUE ("rib");

-- ----------------------------
-- Primary Key structure for table utilisateur
-- ----------------------------
ALTER TABLE "musicrowd"."utilisateur" ADD CONSTRAINT "utilisateur_pkey" PRIMARY KEY ("user_id");

-- ----------------------------
-- Foreign Keys structure for table participation
-- ----------------------------
ALTER TABLE "musicrowd"."participation" ADD CONSTRAINT "participation_projet_id_fkey" FOREIGN KEY ("projet_id") REFERENCES "musicrowd"."projet" ("projet_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "musicrowd"."participation" ADD CONSTRAINT "participation_reward_id_fkey" FOREIGN KEY ("reward_id") REFERENCES "musicrowd"."reward" ("reward_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "musicrowd"."participation" ADD CONSTRAINT "participation_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "musicrowd"."utilisateur" ("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

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
