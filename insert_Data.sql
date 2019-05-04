-- ----------------------------
-- Function add utilisateur
-- ----------------------------
CREATE OR REPLACE FUNCTION add_utilisateur(mdp text, nom text, prenom text, adresse text, telephone text, mail text, rib text, nb_projet_supportes numeric, nb_projet_crees numeric, balance numeric)
  RETURNS void AS $BODY$
BEGIN
INSERT INTO "utilisateur" ("mdp", "nom", "prenom", "adresse", "telephone", "mail", "rib", "nb_projet_supportes", "nb_projet_crees", "balance") VALUES (mdp, nom, prenom, adresse, telephone, mail, rib, nb_projet_supportes, nb_projet_crees, balance);
END
$BODY$
  LANGUAGE plpgsql;

-- ----------------------------
-- Function add Milestones
-- ----------------------------
CREATE OR REPLACE FUNCTION add_milestone(projet_id numeric, description text, objectif numeric)
  RETURNS void AS $BODY$
BEGIN
INSERT INTO "Milestones" ("projet_id", "description", "objectif") VALUES (projet_id, description, objectif);
END
$BODY$
  LANGUAGE plpgsql;

-- ----------------------------
-- Records of reward
-- ----------------------------
CREATE OR REPLACE FUNCTION add_reward(projet_id numeric, nom_cadeau text, detail_cadeau text, somme_min numeric, somme_max numeric)
  RETURNS void AS $BODY$
BEGIN
INSERT INTO "reward" ("projet_id", "nom_cadeau", "detail_cadeau", "somme_min", "somme_max") VALUES (projet_id, nom_cadeau, detail_cadeau, somme_min, somme_max);
END
$BODY$
  LANGUAGE plpgsql;

-- ----------------------------
-- Records of participation
-- ----------------------------
CREATE OR REPLACE FUNCTION add_participation(user_id numeric, projet_id numeric, montant numeric, date_p date)
  RETURNS void AS $BODY$
BEGIN
INSERT INTO "participation" (user_id, projet_id, montant, date_p) VALUES (user_id, projet_id, montant, date_p);
END
$BODY$
  LANGUAGE plpgsql;

-- ----------------------------
-- Records of projet
-- ----------------------------
CREATE OR REPLACE FUNCTION add_projet(user_id numeric, nom_proj text, description text, date_deb date, date_fin date, objectif numeric, somme_recoltee numeric, taxe_perc numeric)
  RETURNS void AS $BODY$
BEGIN
INSERT INTO "projet" ("user_id", "nom_proj", "description", "date_deb", "date_fin", "objectif", "somme_recoltee", "taxe_perc", "termine") VALUES (user_id, nom_proj, description, date_deb, date_fin, objectif, somme_recoltee, taxe_perc, 'f');
END
$BODY$
  LANGUAGE plpgsql;

-- ----------------------------
-- Records of sponsor_type
-- ----------------------------
CREATE OR REPLACE FUNCTION add_sponsor_type(sponsor_type_name text)
  RETURNS void AS $BODY$
BEGIN
INSERT INTO "sponsor_type" ("sponsor_type_name") VALUES (sponsor_type_name);
END
$BODY$
  LANGUAGE plpgsql;

-- ----------------------------
-- Records of sponsor
-- ----------------------------
CREATE OR REPLACE FUNCTION add_sponsor(nom text, sponsor_type_id numeric)
  RETURNS void AS $BODY$
BEGIN
INSERT INTO "sponsor" ("nom", "sponsor_type_id") VALUES (nom, sponsor_type_id);
END
$BODY$
  LANGUAGE plpgsql;

-- ----------------------------
-- Records of sponsored_projects
-- ----------------------------
CREATE OR REPLACE FUNCTION add_sponsored_projects(id_projet numeric, id_sponsor numeric, sponsoring_action text, tax numeric)
  RETURNS void AS $BODY$
BEGIN
INSERT INTO "sponsored_projects" ("id_projet", "id_sponsor", "sponsoring_action", "tax") VALUES (id_projet, id_sponsor, sponsoring_action, tax);
END
$BODY$
  LANGUAGE plpgsql;



-- ----------------------------
-- Records of Fiction_Date
-- ----------------------------
BEGIN;
INSERT INTO "Fiction_Date" ("fiction_Date") VALUES ('2019-01-23');
COMMIT;

-- ----------------------------
-- Records of utilisateur
-- ----------------------------
SELECT add_utilisateur('mot6passe', 'Jurski', 'Yan', '10 rue Thomas Mann', '0789235646', 'jurski@irif.fr', NULL, 0, 0, 3000);
SELECT add_utilisateur('mot3passe', 'Rogova', 'Alexandra', '124 rue de compans', '0677667766', 'alexandra.rogova@etu.univ-paris-diderot.fr', 'DE092897828762', 0, 1, 10000);
SELECT add_utilisateur('mot5passe', 'Laplante', 'Sophie', '19 rue de Vaugirard', '0645567219', 'laplante@irif.fr', 'FR04576786273', 0, 1, 20);
SELECT add_utilisateur('mot2passe', 'Merat', 'Laure', '184 rue de Tolbiac', '0666666666', 'laure.merat@etu.univ-paris-diderot.fr', 'FR45898676776796237H65', 0, 1, 2000);
SELECT add_utilisateur('mot1passe', 'Amari', 'Nabil', '5 rue Thomas Mann', '0777777777', 'nabil.amari@etu.univ-paris-diderot.fr', 'FR04399902978798786N65', 2, 1, 700000);

-- ----------------------------
-- Records of Milestones
-- ----------------------------
SELECT add_milestone(2, 'Prise en Charge de Logic Pro X', 20000);
SELECT add_milestone(3, 'Prise en charge de module 16 bits', 250000);
SELECT add_milestone(4, 'Deux Morceau de plus dans l''Album', 60000);

-- ----------------------------
-- Records of projet
-- ----------------------------
SELECT add_projet(2, 'Tranxen 400', 'VST Compatible avec Pro Tools, permet de moduler les pic, les poc mais aussi les pitch et les potch', '2019-02-15', '2019-05-23', 10000, 0, 50);
SELECT add_projet(3, 'ChipWave', 'Logiciel de MAO taillé pour la création de musique 8 bits.', '2019-01-01', '2019-05-10', 200000, 0, 5);
SELECT add_projet(4, 'Outrun Alpha', 'Back to The 80s !', '2019-01-30', '2019-05-01', 50000, 0, 15);
SELECT add_projet(1, 'OnduLab X', 'Simulateur numérique d''effet de basse', '2018-12-31', '2019-05-26', '2600000', 1000000, 10);


/*
-- ----------------------------
-- Records of participation_archivage
-- ----------------------------
BEGIN;
INSERT INTO "participation_archivage" ("projet_id", "user_id", "date_p") VALUES (1, 2, '2019-05-03');
COMMIT;
*/

-- ----------------------------
-- Records of reward
-- ----------------------------
SELECT add_reward(2, 'Tranxen 400 lite', 'Module uniquement les pic et les poc', 50, 200);
SELECT add_reward(2, 'Tranxen 400 standard', 'Module les pic les poc mais un peu les pitch', 200, 500);
SELECT add_reward(2, 'Tranxen 400 ultimate', 'Module tout', 500, 2000);
SELECT add_reward(2, 'Tranxen 400 ultimate + Pro Tools', 'Module tout et en plus tu peux l''essayer sur le meilleur soft de prod musical', 2000, 30000);
SELECT add_reward(3, 'ChipWave Standard', 'Recevez l''édition standard de chipwave ', 100, 300);
SELECT add_reward(3, 'ChipWave Ultimate', 'Avec des modules FPGA pour mieux simulez votre bonne vieille NES', 300, 500);
SELECT add_reward(4, 'L''album', 'A exemplaire de notre album qui vous ramenera au temps joyeux des synthé et des coupes de cheveux de mauvais gout', 10, 50);
SELECT add_reward(4, 'L''album + Tee Shirt', 'Notre Album + Un Tee Shirt avec la cover de l''album', 50, 100);
SELECT add_reward(4, 'L''album + Tee Shirt + Place de concert', 'une virée en F1 avec Splash aux commandes', 100, 400);
SELECT add_reward(4, 'Album + Tee shirt + Concert privé', 'Si tu as un jardin assez grand on vient jouer chez toi !', 400, 1000);
SELECT add_reward(4, 'Album + Tee Shirt + Korg Analogue', 'Remporte le synthé de notre claviériste signé par nos soins !', 1000, 30000);


-- ----------------------------
-- Records of participation
-- ----------------------------
SELECT add_participation(1,1, 50, '2018-12-31');
SELECT add_participation(1,2, 2000, '2019-03-26');
SELECT add_participation(2, 1, 3000, '2019-04-14');
SELECT add_participation(3, 4, 100, '2019-02-03');
SELECT add_participation(3, 3, 10, '2019-01-30');
SELECT add_participation(4, 1, 400, '2019-03-29');
SELECT add_participation(4, 3, 20, '2019-05-01');
SELECT add_participation(4, 4, 35, '2019-04-01');
SELECT add_participation(5, 2, 2000, '2019-04-04');
SELECT add_participation(5, 3, 10, '2019-05-09');
SELECT add_participation(3, 4, 1000, '2019-05-01');

-- ----------------------------
-- Records of sponsor_type
-- ----------------------------
SELECT add_sponsor_type('Instruments Manufacturer');
SELECT add_sponsor_type('Software Company');
SELECT add_sponsor_type('Television Network');
SELECT add_sponsor_type('Radio Network');
SELECT add_sponsor_type('News Paper');
SELECT add_sponsor_type('Magazine');
SELECT add_sponsor_type('Social network');

-- ----------------------------
-- Records of sponsor
-- ----------------------------
SELECT add_sponsor('Gibson', 1);
SELECT add_sponsor('Korg', 1);
SELECT add_sponsor('ESP', 1);
SELECT add_sponsor('Fender', 1);
SELECT add_sponsor('Facebook', 7);

-- ----------------------------
-- Records of sponsored_projects
-- ----------------------------
SELECT add_sponsored_projects(4, 2, 'Apport d''instrument de la marque auprèes des musiciens', 0);
SELECT add_sponsored_projects(4, 5, 'Publicité sur le réseau social', 10);
SELECT add_sponsored_projects(1, 5, 'Publicité sur le réseau social', 10);
