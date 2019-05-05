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
-- Sequence structure for sponsor_type_sponsor_type_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "sponsor_type_sponsor_type_id_seq" CASCADE;
CREATE SEQUENCE "sponsor_type_sponsor_type_id_seq" 
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
-- Sequence structure for milestones_milestone_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "milestones_milestone_id_seq" CASCADE;
CREATE SEQUENCE "milestones_milestone_id_seq" 
INCREMENT 1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for Fiction_Date
-- ----------------------------
DROP TABLE IF EXISTS "fiction_date" CASCADE;
CREATE TABLE "fiction_date" (
  "fictive_date" date NOT NULL
)
;

-- ----------------------------
-- Table structure for Milestones
-- ----------------------------
DROP TABLE IF EXISTS "milestones" CASCADE;
CREATE TABLE "milestones" (
  "projet_id" int4 NOT NULL,
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "objectif" int4,
  "milsetone_id" int4 NOT NULL DEFAULT nextval('musicrowd.milestones_milestone_id_seq'::regclass)
)
;

-- ----------------------------
-- Table structure for participation
-- ----------------------------
DROP TABLE IF EXISTS "participation" CASCADE;
CREATE TABLE "participation" (
  "user_id" int4 NOT NULL,
  "projet_id" int4 NOT NULL,
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
  "montant" int4,
  "date_p" date
)
;

-- ----------------------------
-- Table structure for projet
-- ----------------------------
DROP TABLE IF EXISTS "projet" CASCADE;
CREATE TABLE "projet" (
  "projet_id" int4 NOT NULL DEFAULT nextval('musicrowd.projet_projet_id_seq'::regclass),
  "user_id" int4 NOT NULL,
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
  "projet_id" int4 NOT NULL,
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
  "sponsor_type_id" int4 NOT NULL DEFAULT nextval('musicrowd.sponsor_type_sponsor_type_id_seq'::regclass),
  "sponsor_type_name" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for sponsored_projects
-- ----------------------------
DROP TABLE IF EXISTS "sponsored_projects" CASCADE;
CREATE TABLE "sponsored_projects" (
  "id_projet" int4 NOT NULL,
  "id_sponsor" int4 NOT NULL,
  "sponsoring_action" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "tax" int4
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
-- Primary Key structure for table Fiction_Date
-- ----------------------------
ALTER TABLE "fiction_date" ADD CONSTRAINT "fiction_date_pkey" PRIMARY KEY ("fictive_date");

-- ----------------------------
-- Primary Key structure for table Milestones
-- ----------------------------
ALTER TABLE "milestones" ADD CONSTRAINT "milestones_pkey" PRIMARY KEY ("projet_id", "milsetone_id");

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
-- Indexes structure for table projet
-- ----------------------------
CREATE INDEX "user_id_idx" ON "projet" USING btree (
  "user_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

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
-- Indexes structure for table reward
-- ----------------------------
CREATE INDEX "projet_id_idx" ON "reward" USING btree (
  "projet_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

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
-- Indexes structure for table sponsor
-- ----------------------------
CREATE INDEX "sponsor_type_id_idx" ON "sponsor" USING btree (
  "sponsor_type_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sponsor
-- ----------------------------
ALTER TABLE "sponsor" ADD CONSTRAINT "sponsor_pkey" PRIMARY KEY ("sponsor_id");

-- ----------------------------
-- Primary Key structure for table sponsor_type
-- ----------------------------
ALTER TABLE "sponsor_type" ADD CONSTRAINT "sponsor_type_pkey" PRIMARY KEY ("sponsor_type_id");

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
-- Foreign Keys structure for table participation
-- ----------------------------
ALTER TABLE "participation" ADD CONSTRAINT "participation_projet_id_fkey" FOREIGN KEY ("projet_id") REFERENCES "projet" ("projet_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "participation" ADD CONSTRAINT "participation_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "utilisateur" ("user_id") ON DELETE CASCADE ON UPDATE CASCADE;


-- ----------------------------
-- Foreign Keys structure for table projet
-- ----------------------------
ALTER TABLE "projet" ADD CONSTRAINT "projet_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "utilisateur" ("user_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table milestones
-- ----------------------------
ALTER TABLE "milestones" ADD CONSTRAINT "milestones_projet_id_fkey" FOREIGN KEY ("projet_id") REFERENCES "projet" ("projet_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table reward
-- ----------------------------
ALTER TABLE "reward" ADD CONSTRAINT "reward_projet_id_fkey" FOREIGN KEY ("projet_id") REFERENCES "projet" ("projet_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table sponsor
-- ----------------------------
ALTER TABLE "sponsor" ADD CONSTRAINT "sponsor_sponsor_type_id_fk" FOREIGN KEY ("sponsor_type_id") REFERENCES "sponsor_type" ("sponsor_type_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table sponsored_projects
-- ----------------------------
ALTER TABLE "sponsored_projects" ADD CONSTRAINT "id_sponsor_fk" FOREIGN KEY ("id_sponsor") REFERENCES "sponsor" ("sponsor_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sponsored_projects" ADD CONSTRAINT "id_projet_sponsored_fk" FOREIGN KEY ("id_projet") REFERENCES "projet" ("projet_id") ON DELETE CASCADE ON UPDATE CASCADE;
