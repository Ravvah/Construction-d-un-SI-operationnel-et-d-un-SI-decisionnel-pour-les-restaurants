DROP VIEW DSID_LIV_OPE.VUE_ACHAT_PREPARATION CASCADE CONSTRAINTS 
;

DROP VIEW DSID_LIV_OPE.VUE_LIVRAISON CASCADE CONSTRAINTS 
;

DROP TABLE dsid_liv_ope.adresse_client CASCADE CONSTRAINTS;

DROP TABLE dsid_liv_ope.adresse_normalisee_client CASCADE CONSTRAINTS;

DROP TABLE dsid_liv_ope.adresse_normalisee_restaurant CASCADE CONSTRAINTS;

DROP TABLE dsid_liv_ope.adresse_restaurant CASCADE CONSTRAINTS;

DROP TABLE dsid_liv_ope.client CASCADE CONSTRAINTS;

DROP TABLE dsid_liv_ope.commande CASCADE CONSTRAINTS;

DROP TABLE dsid_liv_ope.livraison CASCADE CONSTRAINTS;

DROP TABLE dsid_liv_ope.livreur CASCADE CONSTRAINTS;

DROP TABLE dsid_liv_ope.menu CASCADE CONSTRAINTS;

DROP TABLE dsid_liv_ope.moyen_livraison CASCADE CONSTRAINTS;

DROP TABLE dsid_liv_ope.moyen_paiement CASCADE CONSTRAINTS;

DROP TABLE dsid_liv_ope.preparation CASCADE CONSTRAINTS;

DROP TABLE dsid_liv_ope.restaurant CASCADE CONSTRAINTS;

DROP SEQUENCE dsid_liv_ope.adresse_client_seq;

DROP SEQUENCE dsid_liv_ope.adresse_norm_client_seq;

DROP SEQUENCE dsid_liv_ope.adresse_norm_restaurant_seq;

DROP SEQUENCE dsid_liv_ope.adresse_restaurant_seq;

DROP SEQUENCE dsid_liv_ope.client_seq;

DROP SEQUENCE dsid_liv_ope.commande_seq;

DROP SEQUENCE dsid_liv_ope.livraison_seq;

DROP SEQUENCE dsid_liv_ope.livreur_seq;

DROP SEQUENCE dsid_liv_ope.menu_seq;

DROP SEQUENCE dsid_liv_ope.moyen_livraison_seq;

DROP SEQUENCE dsid_liv_ope.moyen_paiement_seq;

DROP SEQUENCE dsid_liv_ope.preparation_seq;

DROP SEQUENCE dsid_liv_ope.restaurant_seq;

CREATE TABLE dsid_liv_ope.adresse_client (
    id_adresse_client INTEGER NOT NULL,
    adresse_client    VARCHAR2(200 CHAR)
);

ALTER TABLE dsid_liv_ope.adresse_client ADD CONSTRAINT adresse_client_pk PRIMARY KEY ( id_adresse_client );

CREATE TABLE dsid_liv_ope.adresse_normalisee_client (
    id_adresse_norm_client INTEGER NOT NULL,
    id_adresse_client      INTEGER NOT NULL,
    numero_voie            VARCHAR2(10 CHAR),
    nom_voie               VARCHAR2(100 CHAR),
    code_postal            VARCHAR2(5 CHAR),
    nom_ville              VARCHAR2(100 CHAR),
    longitude              VARCHAR2(20 CHAR),
    latitude               VARCHAR2(20 CHAR)
);

ALTER TABLE dsid_liv_ope.adresse_normalisee_client ADD CONSTRAINT adresse_norm_client_pk PRIMARY KEY ( id_adresse_norm_client );

CREATE TABLE dsid_liv_ope.adresse_normalisee_restaurant (
    id_adresse_norm_restaurant INTEGER NOT NULL,
    id_adresse_restaurant      INTEGER NOT NULL,
    numero_voie                VARCHAR2(10 CHAR),
    nom_voie                   VARCHAR2(100 CHAR),
    code_postal                VARCHAR2(5 CHAR),
    nom_ville                  VARCHAR2(100 CHAR),
    longitude                  VARCHAR2(20 CHAR),
    latitude                   VARCHAR2(20 CHAR)
);

ALTER TABLE dsid_liv_ope.adresse_normalisee_restaurant ADD CONSTRAINT adresse_normalisee_restaurant PRIMARY KEY ( id_adresse_norm_restaurant
);

CREATE TABLE dsid_liv_ope.adresse_restaurant (
    id_adresse_restaurant INTEGER NOT NULL,
    adresse_restaurant    VARCHAR2(200 CHAR)
);

ALTER TABLE dsid_liv_ope.adresse_restaurant ADD CONSTRAINT adresse_restaurant PRIMARY KEY ( id_adresse_restaurant );

CREATE TABLE dsid_liv_ope.client (
    id_client         INTEGER NOT NULL,
    id_adresse_client INTEGER NOT NULL,
    nom_client        VARCHAR2(100 CHAR),
    prenom_client     VARCHAR2(100 CHAR)
);

ALTER TABLE dsid_liv_ope.client ADD CONSTRAINT client_pk PRIMARY KEY ( id_client );

CREATE TABLE dsid_liv_ope.commande (
    id_commande       INTEGER NOT NULL,
    id_client         INTEGER NOT NULL,
    id_menu           INTEGER NOT NULL,
    id_moyen_paiement INTEGER NOT NULL,
    numero_commande   INTEGER,
    date_commande     DATE,
    montant_total     FLOAT
);

ALTER TABLE dsid_liv_ope.commande ADD CONSTRAINT commande_pk PRIMARY KEY ( id_commande );

CREATE TABLE dsid_liv_ope.livraison (
    id_livraison          INTEGER NOT NULL,
    id_preparation        INTEGER NOT NULL,
    id_livreur            INTEGER NOT NULL,
    numero_livraison      INTEGER,
    date_debut_livraison  DATE,
    date_fin_livraison    DATE,
    nombre_article_livres INTEGER
);

ALTER TABLE dsid_liv_ope.livraison ADD CONSTRAINT livraison_pk PRIMARY KEY ( id_livraison );

CREATE TABLE dsid_liv_ope.livreur (
    id_livreur         INTEGER NOT NULL,
    id_moyen_livraison INTEGER NOT NULL,
    nom_livreur        VARCHAR2(100 CHAR),
    prenom_livreur     VARCHAR2(100 CHAR)
);

ALTER TABLE dsid_liv_ope.livreur ADD CONSTRAINT livreur_pk PRIMARY KEY ( id_livreur );

CREATE TABLE dsid_liv_ope.menu (
    id_menu                INTEGER NOT NULL,
    code_menu              VARCHAR2(5 CHAR),
    libelle_menu           VARCHAR2(100 CHAR),
    nombre_articles        INTEGER,
    temps_theo_preparation LONG
);

ALTER TABLE dsid_liv_ope.menu ADD CONSTRAINT contenu_pk PRIMARY KEY ( id_menu );

CREATE TABLE dsid_liv_ope.moyen_livraison (
    id_moyen_livraison      INTEGER NOT NULL,
    code_moyen_livraison    VARCHAR2(20 CHAR),
    libelle_moyen_livraison VARCHAR2(50 CHAR)
);

ALTER TABLE dsid_liv_ope.moyen_livraison ADD CONSTRAINT moyen_livraison_pk PRIMARY KEY ( id_moyen_livraison );

CREATE TABLE dsid_liv_ope.moyen_paiement (
    id_moyen_paiement      INTEGER NOT NULL,
    code_moyen_paiement    VARCHAR2(5 CHAR),
    libelle_moyen_paiement VARCHAR2(100 CHAR)
);

ALTER TABLE dsid_liv_ope.moyen_paiement ADD CONSTRAINT moyen_paiement_pk PRIMARY KEY ( id_moyen_paiement );

CREATE TABLE dsid_liv_ope.preparation (
    id_preparation         INTEGER NOT NULL,
    id_commande            INTEGER NOT NULL,
    id_restaurant          INTEGER NOT NULL,
    date_debut_preparation DATE,
    date_fin_preparation   DATE
);

ALTER TABLE dsid_liv_ope.preparation ADD CONSTRAINT preparation_pk PRIMARY KEY ( id_preparation );

CREATE TABLE dsid_liv_ope.restaurant (
    id_restaurant             INTEGER NOT NULL,
    id_adresse_restaurant     INTEGER NOT NULL,
    code_restaurant           VARCHAR2(5 CHAR),
    raison_sociale_restaurant VARCHAR2(100 CHAR)
);

ALTER TABLE dsid_liv_ope.restaurant ADD CONSTRAINT restaurant_pk PRIMARY KEY ( id_restaurant );

ALTER TABLE dsid_liv_ope.adresse_normalisee_client
    ADD CONSTRAINT adresse_normalisee_client_fk FOREIGN KEY ( id_adresse_client )
        REFERENCES dsid_liv_ope.adresse_client ( id_adresse_client );

ALTER TABLE dsid_liv_ope.adresse_normalisee_restaurant
    ADD CONSTRAINT adresse_restaurant_fk FOREIGN KEY ( id_adresse_restaurant )
        REFERENCES dsid_liv_ope.adresse_restaurant ( id_adresse_restaurant );

ALTER TABLE dsid_liv_ope.client
    ADD CONSTRAINT client_adresse_client_fk FOREIGN KEY ( id_adresse_client )
        REFERENCES dsid_liv_ope.adresse_client ( id_adresse_client );

ALTER TABLE dsid_liv_ope.commande
    ADD CONSTRAINT commande_client_fk FOREIGN KEY ( id_client )
        REFERENCES dsid_liv_ope.client ( id_client );

ALTER TABLE dsid_liv_ope.commande
    ADD CONSTRAINT commande_contenu_fk FOREIGN KEY ( id_menu )
        REFERENCES dsid_liv_ope.menu ( id_menu );

ALTER TABLE dsid_liv_ope.commande
    ADD CONSTRAINT commande_moyen_paiement_fk FOREIGN KEY ( id_moyen_paiement )
        REFERENCES dsid_liv_ope.moyen_paiement ( id_moyen_paiement );

ALTER TABLE dsid_liv_ope.livraison
    ADD CONSTRAINT livraison_livreur_fk FOREIGN KEY ( id_livreur )
        REFERENCES dsid_liv_ope.livreur ( id_livreur );

ALTER TABLE dsid_liv_ope.livraison
    ADD CONSTRAINT livraison_preparation_fk FOREIGN KEY ( id_preparation )
        REFERENCES dsid_liv_ope.preparation ( id_preparation );

ALTER TABLE dsid_liv_ope.livreur
    ADD CONSTRAINT livreur_moyen_livraison_fk FOREIGN KEY ( id_moyen_livraison )
        REFERENCES dsid_liv_ope.moyen_livraison ( id_moyen_livraison );

ALTER TABLE dsid_liv_ope.preparation
    ADD CONSTRAINT preparation_commande_fk FOREIGN KEY ( id_commande )
        REFERENCES dsid_liv_ope.commande ( id_commande );

ALTER TABLE dsid_liv_ope.preparation
    ADD CONSTRAINT preparation_restaurant_fk FOREIGN KEY ( id_restaurant )
        REFERENCES dsid_liv_ope.restaurant ( id_restaurant );

ALTER TABLE dsid_liv_ope.restaurant
    ADD CONSTRAINT restaurant_adresse_restaurant FOREIGN KEY ( id_adresse_restaurant )
        REFERENCES dsid_liv_ope.adresse_restaurant ( id_adresse_restaurant );

CREATE OR REPLACE VIEW VUE_ACHAT_PREPARATION ( id_client, nom_client, prenom_client, id_adresse_norm_client, numero_voie_client, nom_voie_client, code_postal_client, nom_ville_client, id_restaurant, code_restaurant, raison_sociale_restaurant, id_adresse_norm_restaurant, numero_voie_restaurant, nom_voie_restaurant, code_postal_restaurant, nom_ville_restaurant, id_moyen_paiement, code_moyen_paiement, id_commande, date_commande, montant_total, id_preparation, date_debut_preparation, date_fin_preparation, longitude_restaurant, latitude_restaurant, longitude_client, latitude_client, numero_commande, libelle_moyen_paiement ) AS
SELECT
    dsid_liv_ope.client.id_client,
    dsid_liv_ope.client.nom_client,
    dsid_liv_ope.client.prenom_client,
    dsid_liv_ope.adresse_normalisee_client.id_adresse_norm_client,
    dsid_liv_ope.adresse_normalisee_client.numero_voie     AS "numero_voie_client",
    dsid_liv_ope.adresse_normalisee_client.nom_voie        AS "nom_voie_client",
    dsid_liv_ope.adresse_normalisee_client.code_postal     AS "code_postal_client",
    dsid_liv_ope.adresse_normalisee_client.nom_ville       AS "nom_ville_client",
    dsid_liv_ope.restaurant.id_restaurant,
    dsid_liv_ope.restaurant.code_restaurant,
    dsid_liv_ope.restaurant.raison_sociale_restaurant,
    dsid_liv_ope.adresse_normalisee_restaurant.id_adresse_norm_restaurant,
    dsid_liv_ope.adresse_normalisee_restaurant.numero_voie AS numero_voie_restaurant,
    dsid_liv_ope.adresse_normalisee_restaurant.nom_voie    AS nom_voie_restaurant,
    dsid_liv_ope.adresse_normalisee_restaurant.code_postal AS code_postal_restaurant,
    dsid_liv_ope.adresse_normalisee_restaurant.nom_ville   AS nom_ville_restaurant,
    dsid_liv_ope.moyen_paiement.id_moyen_paiement,
    dsid_liv_ope.moyen_paiement.code_moyen_paiement,
    dsid_liv_ope.commande.id_commande,
    dsid_liv_ope.commande.date_commande,
    dsid_liv_ope.commande.montant_total,
    dsid_liv_ope.preparation.id_preparation,
    dsid_liv_ope.preparation.date_debut_preparation,
    dsid_liv_ope.preparation.date_fin_preparation,
    dsid_liv_ope.adresse_normalisee_restaurant.longitude   AS "longitude_restaurant",
    dsid_liv_ope.adresse_normalisee_restaurant.latitude    AS "latitude_restaurant",
    dsid_liv_ope.adresse_normalisee_client.longitude       AS "longitude_client",
    dsid_liv_ope.adresse_normalisee_client.latitude        AS "latitude_client",
    dsid_liv_ope.commande.numero_commande,
    dsid_liv_ope.moyen_paiement.libelle_moyen_paiement
FROM
    dsid_liv_ope.client,
    dsid_liv_ope.commande,
    dsid_liv_ope.moyen_paiement,
    dsid_liv_ope.preparation,
    dsid_liv_ope.restaurant,
    dsid_liv_ope.adresse_normalisee_client,
    dsid_liv_ope.adresse_normalisee_restaurant
WHERE
        dsid_liv_ope.client.id_client = dsid_liv_ope.commande.id_client
    AND dsid_liv_ope.moyen_paiement.id_moyen_paiement = dsid_liv_ope.commande.id_moyen_paiement
    AND dsid_liv_ope.commande.id_commande = dsid_liv_ope.preparation.id_commande
    AND dsid_liv_ope.restaurant.id_restaurant = dsid_liv_ope.preparation.id_restaurant 
;

CREATE OR REPLACE FORCE EDITIONABLE VIEW "DSID_LIV_OPE"."VUE_ACHAT_PREPARATION" ("ID_CLIENT", "ID_RESTAURANT", "ID_MOYEN_PAIEMENT", "LIBELLE_MOYEN_PAIEMENT", "ID_COMMANDE", "ID_ADRESSE_CLIENT", "ID_ADRESSE_RESTAURANT", "MONTANT_TOTAL", "DATE_DEBUT_PREPARATION", "DATE_FIN_PREPARATION", "ID_MENU", "TEMPS_THEO_PREPARATION", "NOM_CLIENT", "PRENOM_CLIENT", "NUMERO_VOIE_RESTAURANT", "NOM_VOIE_RESTAURANT", "CODE_POSTALE_RESTAURANT", "NOM_VILLE_RESTAURANT", "LONGITUDE_RESTAURANT", "LATITUDE_RESTAURANT", "CODE_MOYEN_PAIEMENT", "NUMERO_VOIE_CLIENT", "NOM_VOIE_CLIENT", "CODE_POSTALE_CLIENT", "NOM_VILLE_CLIENT", "LONGITUDE_CLIENT", "LATITUDE_CLIENT", "CODE_RESTAURANT", "RAISON_SOCIALE_RESTAURANT", "NUMERO_COMMANDE", "DATE_COMMANDE", "ID_PREPARATION", "ADRESSE_RESTAURANT", "ID_ADRESSE_NORM_RESTAURANT", "ID_ADRESSE_NORM_CLIENT", "LIBELLE_MENU", "CODE_MENU", "NOMBRE_ARTICLES", "ADRESSE_CLIENT") AS 
  SELECT
    client.id_client,
    restaurant.id_restaurant,
    moyen_paiement.id_moyen_paiement,
    moyen_paiement.libelle_moyen_paiement,
    commande.id_commande,
    adresse_client.id_adresse_client,
    adresse_restaurant.id_adresse_restaurant,
    commande.montant_total,
    preparation.date_debut_preparation,
    preparation.date_fin_preparation,
    menu.id_menu,
    menu.temps_theo_preparation,
    client.nom_client,
    client.prenom_client,
    adresse_normalisee_restaurant.numero_voie  AS numero_voie_restaurant,
    adresse_normalisee_restaurant.nom_voie     AS nom_voie_restaurant,
    adresse_normalisee_restaurant.code_postal AS code_postal_restaurant,
    adresse_normalisee_restaurant.nom_ville    AS nom_ville_restaurant,
    adresse_normalisee_restaurant.longitude    AS longitude_restaurant,
    adresse_normalisee_restaurant.latitude     AS latitude_restaurant,
    moyen_paiement.code_moyen_paiement,
    adresse_normalisee_client.numero_voie      AS numero_voie_client,
    adresse_normalisee_client.nom_voie         AS nom_voie_client,
    adresse_normalisee_client.code_postal     AS code_postal_client,
    adresse_normalisee_client.nom_ville        AS nom_ville_client,
    adresse_normalisee_client.longitude        AS longitude_client,
    adresse_normalisee_client.latitude         AS latitude_client,
    restaurant.code_restaurant,
    restaurant.raison_sociale_restaurant,
    commande.numero_commande,
    commande.date_commande,
    preparation.id_preparation,
    adresse_restaurant.adresse_restaurant,
    adresse_normalisee_restaurant.id_adresse_norm_restaurant,
    adresse_normalisee_client.id_adresse_norm_client,
    menu.libelle_menu,
    menu.code_menu,
    menu.nombre_articles,
    adresse_client.adresse_client
FROM
         client
    INNER JOIN commande ON client.id_client = commande.id_client
    INNER JOIN preparation ON commande.id_commande = preparation.id_commande
    INNER JOIN restaurant ON restaurant.id_restaurant = preparation.id_restaurant
    INNER JOIN moyen_paiement ON moyen_paiement.id_moyen_paiement = commande.id_moyen_paiement
    INNER JOIN adresse_restaurant ON adresse_restaurant.id_adresse_restaurant = restaurant.id_adresse_restaurant
    INNER JOIN adresse_normalisee_restaurant ON adresse_restaurant.id_adresse_restaurant = adresse_normalisee_restaurant.id_adresse_restaurant
    INNER JOIN adresse_client ON adresse_client.id_adresse_client = client.id_adresse_client
    INNER JOIN adresse_normalisee_client ON adresse_client.id_adresse_client = adresse_normalisee_client.id_adresse_client
    INNER JOIN menu ON menu.id_menu = commande.id_menu;


CREATE OR REPLACE VIEW "DSID_LIV_OPE"."VUE_LIVRAISON" (id_livreur, nom_livreur, prenom_livreur, id_moyen_livraison, code_moyen_livraison, id_client, nom_client, prenom_client, id_adresse_norm_client, numero_voie_client, nom_voie_client, code_postal_client, nom_ville_client, id_restaurant, code_restaurant, id_adresse_norm_restaurant, numero_voie_restaurant, nom_voie_restaurant, code_postal_restaurant, nom_ville_restaurant, id_menu, id_livraison, date_debut_livraison, date_fin_livraison, nombre_article_livres, numero_livraison, raison_sociale_restaurant, longitude_restaurant, latitude_restaurant, longitude_client, latitude_client, libelle_moyen_livraison, code_menu, libelle_menu, nombre_articles, temps_theo_preparation ) AS 
  SELECT
    livreur.id_livreur,
    livreur.nom_livreur,
    livreur.prenom_livreur,
    moyen_livraison.id_moyen_livraison,
    moyen_livraison.code_moyen_livraison,
    client.id_client,
    client.nom_client,
    client.prenom_client,
    adresse_normalisee_client.id_adresse_norm_client,
    adresse_normalisee_client.numero_voie     AS numero_voie_client,
    adresse_normalisee_client.nom_voie        AS nom_voie_client,
    adresse_normalisee_client.code_postal     AS code_postal_client,
    adresse_normalisee_client.nom_ville       AS nom_ville_client,
    restaurant.id_restaurant,
    restaurant.code_restaurant,
    adresse_normalisee_restaurant.id_adresse_norm_restaurant,
    adresse_normalisee_restaurant.numero_voie AS numero_voie_restaurant,
    adresse_normalisee_restaurant.nom_voie    AS nom_voie_restaurant,
    adresse_normalisee_restaurant.code_postal AS code_postal_restaurant,
    adresse_normalisee_restaurant.nom_ville   AS nom_ville_restaurant,
    menu.id_menu,
    livraison.id_livraison,
    livraison.date_debut_livraison,
    livraison.date_fin_livraison,
    livraison.nombre_article_livres,
    livraison.numero_livraison,
    restaurant.raison_sociale_restaurant,
    adresse_normalisee_restaurant.longitude   AS "longitude_restaurant",
    adresse_normalisee_restaurant.latitude    AS "latitude_restaurant",
    adresse_normalisee_client.longitude       AS "longitude_client",
    adresse_normalisee_client.latitude        AS "latitude_client",
    moyen_livraison.libelle_moyen_livraison,
    menu.code_menu,
    menu.libelle_menu,
    menu.nombre_articles,
    menu.temps_theo_preparation
FROM
        	dsid_liv_ope.livreur

    INNER JOIN dsid_liv_ope.moyen_livraison ON dsid_liv_ope.moyen_livraison.id_moyen_livraison = dsid_liv_ope.livreur.id_moyen_livraison

    INNER JOIN dsid_liv_ope.livraison ON dsid_liv_ope.livreur.id_livreur = dsid_liv_ope.livraison.id_livreur

    INNER JOIN dsid_liv_ope.preparation ON dsid_liv_ope.preparation.id_preparation = dsid_liv_ope.livraison.id_preparation

    INNER JOIN dsid_liv_ope.commande ON dsid_liv_ope.commande.id_commande = dsid_liv_ope.preparation.id_commande

    INNER JOIN dsid_liv_ope.client ON dsid_liv_ope.client.id_client = dsid_liv_ope.commande.id_client

    INNER JOIN dsid_liv_ope.adresse_client ON dsid_liv_ope.adresse_client.id_adresse_client = dsid_liv_ope.client.id_adresse_client

    INNER JOIN dsid_liv_ope.adresse_normalisee_client ON dsid_liv_ope.adresse_client.id_adresse_client = dsid_liv_ope.adresse_normalisee_client.id_adresse_client

    INNER JOIN dsid_liv_ope.menu ON dsid_liv_ope.menu.id_menu = dsid_liv_ope.commande.id_menu

    INNER JOIN dsid_liv_ope.restaurant ON dsid_liv_ope.restaurant.id_restaurant = dsid_liv_ope.preparation.id_restaurant

    INNER JOIN dsid_liv_ope.adresse_restaurant ON dsid_liv_ope.adresse_restaurant.id_adresse_restaurant = dsid_liv_ope.restaurant.id_adresse_restaurant

    INNER JOIN dsid_liv_ope.adresse_normalisee_restaurant ON dsid_liv_ope.adresse_restaurant.id_adresse_restaurant = dsid_liv_ope.adresse_normalisee_restaurant.id_adresse_restaurant;


CREATE SEQUENCE dsid_liv_ope.adresse_client_seq START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_liv_ope.adresse_norm_client_seq START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_liv_ope.adresse_norm_restaurant_seq START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_liv_ope.adresse_restaurant_seq START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_liv_ope.client_seq START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_liv_ope.commande_seq START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_liv_ope.livraison_seq START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_liv_ope.livreur_seq START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_liv_ope.menu_seq START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_liv_ope.moyen_livraison_seq START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_liv_ope.moyen_paiement_seq START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_liv_ope.preparation_seq START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_liv_ope.restaurant_seq START WITH 1 NOCACHE ORDER;

