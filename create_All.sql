-- ----------------------------
-- Sequence structure for participation_projet_id_seq
-- ----------------------------
CREATE SEQUENCE "participation_projet_id_seq" 
INCREMENT 1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for participation_user_id_seq
-- ----------------------------
CREATE SEQUENCE "participation_user_id_seq" 
INCREMENT 1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for projet_projet_id_seq
-- ----------------------------
CREATE SEQUENCE "projet_projet_id_seq" 
INCREMENT 1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for projet_user_id_seq
-- ----------------------------
CREATE SEQUENCE "projet_user_id_seq" 
INCREMENT 1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for reward_projet_id_seq
-- ----------------------------
CREATE SEQUENCE "reward_projet_id_seq" 
INCREMENT 1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for reward_reward_id_seq
-- ----------------------------
CREATE SEQUENCE "reward_reward_id_seq" 
INCREMENT 1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sponsor_sponsor_id_seq
-- ----------------------------
CREATE SEQUENCE "sponsor_sponsor_id_seq" 
INCREMENT 1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sponsored_projects_id_projet_seq
-- ----------------------------
CREATE SEQUENCE "sponsored_projects_id_projet_seq" 
INCREMENT 1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sponsored_projects_id_sponsor_seq
-- ----------------------------
CREATE SEQUENCE "sponsored_projects_id_sponsor_seq" 
INCREMENT 1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for utilisateur_user_id_seq
-- ----------------------------
CREATE SEQUENCE "utilisateur_user_id_seq" 
INCREMENT 1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for Fiction_Date
-- ----------------------------
CREATE TABLE "Fiction_Date" (
  "fiction_Date" date NOT NULL
)
;

-- ----------------------------
-- Table structure for Milestones
-- ----------------------------
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
CREATE TABLE "participation_archivage" (
  "projet_id" int4 NOT NULL,
  "user_id" int4 NOT NULL,
  "date_p" date
)
;

-- ----------------------------
-- Table structure for projet
-- ----------------------------
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
CREATE TABLE "projet_archivage" (
  "projet_id" int4 NOT NULL,
  "user_id" int4,
  "nom_proj" varchar(255) COLLATE "pg_catalog"."default",
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "date_deb" date,
  "date_fin" date,
  "objectif" varchar(255) COLLATE "pg_catalog"."default",
  "somme_recoltee" int4 DEFAULT 0,
  "taxe_perc" int4 DEFAULT 0
)
;

-- ----------------------------
-- Table structure for reward
-- ----------------------------
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
CREATE TABLE "sponsor" (
  "sponsor_id" int4 NOT NULL DEFAULT nextval('musicrowd.sponsor_sponsor_id_seq'::regclass),
  "nom" varchar(255) COLLATE "pg_catalog"."default",
  "sponsor_type_id" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for sponsor_type
-- ----------------------------
CREATE TABLE "sponsor_type" (
  "sponsor_type_id" int4 NOT NULL,
  "sponsor_type_name" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for sponsored_projects
-- ----------------------------
CREATE TABLE "sponsored_projects" (
  "id_projet" int4 NOT NULL DEFAULT nextval('musicrowd.sponsored_projects_id_projet_seq'::regclass),
  "id_sponsor" int4 NOT NULL DEFAULT nextval('musicrowd.sponsored_projects_id_sponsor_seq'::regclass),
  "sponsoring_action" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "tax" int4
)
;

-- ----------------------------
-- Table structure for utilisateur
-- ----------------------------
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
CREATE TABLE "utilisateur_archivage" (
  "user_id" int4 NOT NULL,
  "nb_projet_supportes" int4,
  "nb_projet_crees" int4
)
;

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
-- Primary Key structure for table projet_archivage
-- ----------------------------
ALTER TABLE "projet_archivage" ADD CONSTRAINT "projet_archivage_pkey" PRIMARY KEY ("projet_id");

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
-- Foreign Keys structure for table Milestones
-- ----------------------------
ALTER TABLE "Milestones" ADD CONSTRAINT "projet_id_fk" FOREIGN KEY ("projet_id") REFERENCES "projet" ("projet_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table participation
-- ----------------------------
ALTER TABLE "participation" ADD CONSTRAINT "participation_projet_id_fkey" FOREIGN KEY ("projet_id") REFERENCES "projet" ("projet_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "participation" ADD CONSTRAINT "participation_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "utilisateur" ("user_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table participation_archivage
-- ----------------------------
ALTER TABLE "participation_archivage" ADD CONSTRAINT "projet_archivage_id_fk" FOREIGN KEY ("projet_id") REFERENCES "projet_archivage" ("projet_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table projet
-- ----------------------------
ALTER TABLE "projet" ADD CONSTRAINT "projet_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "utilisateur" ("user_id") ON DELETE CASCADE ON UPDATE CASCADE;

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
