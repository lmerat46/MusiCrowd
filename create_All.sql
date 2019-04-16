DROP TABLE IF EXISTS MusiCrowd.Participation;
DROP TABLE IF EXISTS MusiCrowd.Reward;
DROP TABLE IF EXISTS MusiCrowd.Projet;
DROP TABLE IF EXISTS MusiCrowd.Groupe;
DROP TABLE IF EXISTS MusiCrowd.Sponsor;
DROP TABLE IF EXISTS MusiCrowd.Genre;
DROP TABLE IF EXISTS MusiCrowd.Utilisateur;




DROP SCHEMA IF EXISTS MusiCrowd;

CREATE SCHEMA MusiCrowd;

CREATE TABLE MusiCrowd.Utilisateur (
	user_id SERIAL,
	mdp varchar(255) NOT NULL,
	nom varchar(255) NOT NULL,
	prenom varchar(255) NOT NULL,
	adresse varchar(255) NOT NULL,
	telephone varchar(255) NOT NULL UNIQUE,
	mail varchar(255) NOT NULL,
	rib varchar(255) UNIQUE,
	nb_projet_supportes INT,
	nb_projet_crees INT,
	PRIMARY KEY(user_id)
);

CREATE TABLE MusiCrowd.Sponsor (
	sponsor_id SERIAL,
	nom varchar(255),
	PRIMARY KEY(sponsor_id)
);

CREATE TABLE MusiCrowd.Genre (
	nom varchar(255),
	PRIMARY KEY(nom)
);

CREATE TABLE MusiCrowd.Groupe (
	groupe_id SERIAL NOT NULL,
	sponsor_id SERIAL,
	genre_nom varchar(255),
	nom varchar(255) NOT NULL UNIQUE,
	PRIMARY KEY(groupe_id),
	FOREIGN KEY(sponsor_id) REFERENCES MusiCrowd.Sponsor(sponsor_id),
	FOREIGN KEY(genre_nom) REFERENCES MusiCrowd.Genre(nom)


);

CREATE TABLE MusiCrowd.Projet (
	projet_id SERIAL,
	groupe_id SERIAL,
	sponsor_id SERIAL,
	nom_proj varchar(255) NOT NULL UNIQUE,
	description varchar(255) NOT NULL,
	date_deb date NOT NULL,
	date_fin date NOT NULL,
	objectif INT,
	somme_recoltee INT,
	taxe_perc INT NOT NULL,
	termine BOOLEAN,
	PRIMARY KEY(projet_id),
	FOREIGN KEY(groupe_id) REFERENCES MusiCrowd.Groupe(groupe_id),
	FOREIGN KEY(sponsor_id) REFERENCES MusiCrowd.Sponsor(sponsor_id),
	CHECK (date_deb >= date(NOW())),
	CHECK (date_deb < date_fin),
	CHECK (date_fin > date_deb),
	CHECK (objectif >= 1000)

);

CREATE TABLE MusiCrowd.Reward (
	reward_id SERIAL,
	projet_id SERIAL,
	nom_cadeau varchar(255) NOT NULL,
	detail_cadeau varchar(255) NOT NULL,
	somme_min INT,
	somme_max INT,
	PRIMARY KEY(reward_id),
	FOREIGN KEY(projet_id) REFERENCES MusiCrowd.Projet(projet_id),
	CHECK (somme_min > 0),
	CHECK (somme_min < somme_max),
	CHECK (somme_max > somme_min)
);

CREATE TABLE MusiCrowd.Participation (
	user_id SERIAL,
	projet_id SERIAL,
	reward_id SERIAL,
	montant INT,
	date_p date NOT NULL,
	PRIMARY KEY(user_id, projet_id, reward_id),
	FOREIGN KEY(user_id) REFERENCES MusiCrowd.Utilisateur(user_id),
	FOREIGN KEY(projet_id) REFERENCES MusiCrowd.Projet(projet_id),
	FOREIGN KEY(reward_id) REFERENCES MusiCrowd.Reward(reward_id),
	CHECK (montant > 0)
);


--CREATE TABLE MusiCrowd.Archive (
--	archive_id SERIAL NOT NULL,
--	projet_id SERIAL,
--);
