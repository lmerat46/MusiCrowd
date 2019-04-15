DROP TABLE IF EXISTS MusiCrowd.Participant;
DROP TABLE IF EXISTS MusiCrowd.Beneficiaire;
DROP TABLE IF EXISTS MusiCrowd.Projet;
DROP TABLE IF EXISTS MusiCrowd.Reward;
DROP TABLE IF EXISTS MusiCrowd.ProjetTaxe;
DROP TABLE IF EXISTS MusiCrowd.Participation;

DROP SCHEMA IF EXISTS MusiCrowd;

CREATE SCHEMA MusiCrowd;

CREATE TABLE MusiCrowd.Participant (
	user_id SERIAL,
	mdp varchar(255) NOT NULL,
	nom varchar(255) NOT NULL,
	prenom varchar(255) NOT NULL,
	adresse varchar(255) NOT NULL,
	telephone varchar(255) NOT NULL,
	mail varchar(255) NOT NULL,
	rib varchar(255) UNIQUE,
	nb_projet_supportes INT,
	PRIMARY KEY(user_id)
);

CREATE TABLE MusiCrowd.Beneficiaire (
	user_id SERIAL,
	mdp varchar(255) NOT NULL,
	nom varchar(255) NOT NULL,
	prenom varchar(255) NOT NULL,
	adresse varchar(255) NOT NULL,
	telephone varchar(255) NOT NULL,
	mail varchar(255) NOT NULL,
	rib varchar(255) UNIQUE,
	nb_projet_crees INT,
	PRIMARY KEY(user_id)
);


CREATE TABLE MusiCrowd.Projet (
	projet_id SERIAL,
	user_id SERIAL,
	nom_proj varchar(255) NOT NULL UNIQUE,
	description varchar(255) NOT NULL,
	date_deb date NOT NULL,
	date_fin date NOT NULL,
	objectif INT,
	somme_recoltee INT,
	PRIMARY KEY(projet_id),
	FOREIGN KEY(user_id) REFERENCES Beneficiaire(user_id),
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
	FOREIGN KEY(projet_id) REFERENCES Projet(projet_id),
	CHECK (somme_min > 0),
	CHECK (somme_min < somme_max),
	CHECK (somme_max > somme_min)
);

CREATE TABLE MusiCrowd.ProjetTaxe (
	projet_id SERIAL,
	taxe_perc INT NOT NULL,
	somme_percue INT,
	PRIMARY KEY(projet_id),
	FOREIGN KEY(projet_id) REFERENCES projet(projet_id)
);

CREATE TABLE MusiCrowd.Participation (
	user_id SERIAL,
	projet_id SERIAL,
	reward_id SERIAL,
	montant INT,
	date_p date NOT NULL,
	PRIMARY KEY(user_id, projet_id, reward_id),
	FOREIGN KEY(user_id) REFERENCES Participant(user_id),
	FOREIGN KEY(projet_id) REFERENCES Projet(projet_id),
	FOREIGN KEY(reward_id) REFERENCES Reward(reward_id),
	CHECK (montant > 0)
);


--CREATE TABLE MusiCrowd.Archive (

--);
