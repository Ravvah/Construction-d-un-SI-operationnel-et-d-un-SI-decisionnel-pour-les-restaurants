-- Généré par Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   à :        2024-01-20 14:26:23 CET
--   site :      Oracle Database 11g
--   type :      Oracle Database 11g



DROP TABLE dsid_liv_dm2.dim_adresse_norm_client_d CASCADE;

DROP TABLE dsid_liv_dm2.dim_adresse_norm_restaurant_d CASCADE;

DROP TABLE dsid_liv_dm2.dim_client_d CASCADE;

DROP TABLE dsid_liv_dm2.dim_date_fin_livraison_d CASCADE;

DROP TABLE dsid_liv_dm2.dim_livreur_d CASCADE;

DROP TABLE dsid_liv_dm2.dim_menu_d CASCADE;

DROP TABLE dsid_liv_dm2.dim_moyen_livraison_d CASCADE;

DROP TABLE dsid_liv_dm2.dim_restaurant_d CASCADE;

DROP TABLE dsid_liv_dm2.fait_livraison_f CASCADE;

DROP SEQUENCE dsid_liv_dm2.dim_adresse_client_seq;

DROP SEQUENCE dsid_liv_dm2.dim_adresse_restaurant_seq;

DROP SEQUENCE dsid_liv_dm2.dim_client_seq;

DROP SEQUENCE dsid_liv_dm2.dim_date_fin_livr_seq;

DROP SEQUENCE dsid_liv_dm2.dim_livreur_seq;

DROP SEQUENCE dsid_liv_dm2.dim_menu_seq;

DROP SEQUENCE dsid_liv_dm2.dim_moyen_paiement_seq;

DROP SEQUENCE dsid_liv_dm2.dim_restaurant_seq;

DROP SEQUENCE dsid_liv_dm2.dm2_fait_seq;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE dsid_liv_dm2.dim_adresse_norm_client_d (
    id_adresse_norm_client     INTEGER NOT NULL,
    id_adresse_norm_client_src INTEGER,
    numero_voie_client         CHARACTER VARYING(10),
    nom_voie_client            CHARACTER VARYING(100),
    code_postal_client         CHARACTER VARYING(5),
    nom_ville_client           CHARACTER VARYING(100),
    longitude_client           CHARACTER VARYING(20),
    latitude_client            CHARACTER VARYING(20),
    date_debut                 TIMESTAMP WITHOUT TIME ZONE,
    date_fin                   TIMESTAMP WITHOUT TIME ZONE
);

ALTER TABLE dsid_liv_dm2.dim_adresse_norm_client_d ADD CONSTRAINT dim_adresse_norm_client_pk PRIMARY KEY ( id_adresse_norm_client );

CREATE TABLE dsid_liv_dm2.dim_adresse_norm_restaurant_d (
    id_adresse_norm_restaurant     INTEGER NOT NULL,
    id_adresse_norm_restaurant_src INTEGER,
    numero_voie_restaurant         CHARACTER VARYING(10),
    nom_voie_restaurant            CHARACTER VARYING(100),
    code_postal_restaurant         CHARACTER VARYING(5),
    nom_ville_restaurant           CHARACTER VARYING(100),
    longitude_restaurant           CHARACTER VARYING(20),
    latitude_restaurant            CHARACTER VARYING(20),
    date_debut                     TIMESTAMP WITHOUT TIME ZONE,
    date_fin                       TIMESTAMP WITHOUT TIME ZONE
);

ALTER TABLE dsid_liv_dm2.dim_adresse_norm_restaurant_d ADD CONSTRAINT dim_adresse_norm_restaurant_pk PRIMARY KEY ( id_adresse_norm_restaurant
);

CREATE TABLE dsid_liv_dm2.dim_client_d (
    id_client     INTEGER NOT NULL,
    id_client_src INTEGER,
    nom_client    CHARACTER VARYING(100),
    prenom_client CHARACTER VARYING(100),
    date_debut    TIMESTAMP WITHOUT TIME ZONE,
    date_fin      TIMESTAMP WITHOUT TIME ZONE
);

ALTER TABLE dsid_liv_dm2.dim_client_d ADD CONSTRAINT dim_client_d_pk PRIMARY KEY ( id_client );

CREATE TABLE dsid_liv_dm2.dim_date_fin_livraison_d (
    id_date_fin_livraison     INTEGER NOT NULL,
    id_date_fin_livraison_src INTEGER,
    date_fin_livraison        TIMESTAMP WITHOUT TIME ZONE,
    jour                      CHARACTER VARYING(5),
    mois                      CHARACTER VARYING(10),
    annee                     CHARACTER VARYING(10),
    heure                     CHARACTER VARYING(10),
    minute                    CHARACTER VARYING(10)
);

ALTER TABLE dsid_liv_dm2.dim_date_fin_livraison_d ADD CONSTRAINT date_fin_livraison_pk PRIMARY KEY ( id_date_fin_livraison );

CREATE TABLE dsid_liv_dm2.dim_livreur_d (
    id_livreur     INTEGER NOT NULL,
    id_livreur_src INTEGER,
    nom_livreur    CHARACTER VARYING(100),
    prenom_livreur CHARACTER VARYING(100) NOT NULL,
    date_debut     TIMESTAMP WITHOUT TIME ZONE,
    date_fin       TIMESTAMP WITHOUT TIME ZONE
);

ALTER TABLE dsid_liv_dm2.dim_livreur_d ADD CONSTRAINT dim_livreur_d_pk PRIMARY KEY ( id_livreur );

CREATE TABLE dsid_liv_dm2.dim_menu_d (
    id_menu                INTEGER NOT NULL,
    id_menu_src            INTEGER,
    code_menu              CHARACTER VARYING(5),
    libelle_menu           CHARACTER VARYING(100),
    nombre_articles        INTEGER,
    temps_theo_preparation TEXT,
    date_debut             TIMESTAMP WITHOUT TIME ZONE,
    date_fin               TIMESTAMP WITHOUT TIME ZONE
);

ALTER TABLE dsid_liv_dm2.dim_menu_d ADD CONSTRAINT dim_menu_d_pk PRIMARY KEY ( id_menu );

CREATE TABLE dsid_liv_dm2.dim_moyen_livraison_d (
    id_moyen_livraison      INTEGER NOT NULL,
    id_moyen_livraison_src  INTEGER,
    code_moyen_livraison    CHARACTER VARYING(20),
    libelle_moyen_livraison CHARACTER VARYING(50)
);

ALTER TABLE dsid_liv_dm2.dim_moyen_livraison_d ADD CONSTRAINT dim_moyen_livraison_d_pk PRIMARY KEY ( id_moyen_livraison );

CREATE TABLE dsid_liv_dm2.dim_restaurant_d (
    id_restaurant     INTEGER NOT NULL,
    id_restaurant_src INTEGER,
    code_restaurant   CHARACTER VARYING(5),
	raison_sociale_restauranr CHARACTER VARYING (200),
    ancien_libelle    CHARACTER VARYING(100),
    date_effective    TIMESTAMP WITHOUT TIME ZONE,
    libelle_actuel    CHARACTER VARYING(100)
);

COMMENT ON COLUMN dsid_liv_dm2.dim_restaurant_d.ancien_libelle IS
    'LIBELLE';

COMMENT ON COLUMN dsid_liv_dm2.dim_restaurant_d.libelle_actuel IS
    'LIBELLE correspond a la raison_sociale du restaurant';

ALTER TABLE dsid_liv_dm2.dim_restaurant_d ADD CONSTRAINT dim_restaurant_d_pk PRIMARY KEY ( id_restaurant );

CREATE TABLE dsid_liv_dm2.fait_livraison_f (
    id_livraison               INTEGER NOT NULL,
    id_livreur                 INTEGER NOT NULL,
    id_restaurant              INTEGER NOT NULL,
    id_moyen_livraison         INTEGER NOT NULL,
    id_date_fin_livraison      INTEGER NOT NULL,
    id_adresse_norm_client     INTEGER NOT NULL,
    id_adresse_norm_restaurant INTEGER NOT NULL,
    id_client                  INTEGER NOT NULL,
    id_menu                    INTEGER NOT NULL,
    numero_livraison           INTEGER,
    nombre_articles_livres     INTEGER,
    temps_livraison            CHARACTER VARYING(50),
    remuneration_livreur       REAL
);

ALTER TABLE dsid_liv_dm2.fait_livraison_f ADD CONSTRAINT fait_livraison_f_pk PRIMARY KEY ( id_livraison );

ALTER TABLE dsid_liv_dm2.fait_livraison_f
    ADD CONSTRAINT adresse_norm_client_d_fk FOREIGN KEY ( id_adresse_norm_client )
        REFERENCES dsid_liv_dm2.dim_adresse_norm_client_d ( id_adresse_norm_client );

ALTER TABLE dsid_liv_dm2.fait_livraison_f
    ADD CONSTRAINT adresse_norm_restaurant_d_fk FOREIGN KEY ( id_adresse_norm_restaurant )
        REFERENCES dsid_liv_dm2.dim_adresse_norm_restaurant_d ( id_adresse_norm_restaurant );

ALTER TABLE dsid_liv_dm2.fait_livraison_f
    ADD CONSTRAINT client_d_fk FOREIGN KEY ( id_client )
        REFERENCES dsid_liv_dm2.dim_client_d ( id_client );

ALTER TABLE dsid_liv_dm2.fait_livraison_f
    ADD CONSTRAINT date_fin_livraison_d_fk FOREIGN KEY ( id_date_fin_livraison )
        REFERENCES dsid_liv_dm2.dim_date_fin_livraison_d ( id_date_fin_livraison );

ALTER TABLE dsid_liv_dm2.fait_livraison_f
    ADD CONSTRAINT livreur_d_fk FOREIGN KEY ( id_livreur )
        REFERENCES dsid_liv_dm2.dim_livreur_d ( id_livreur );

ALTER TABLE dsid_liv_dm2.fait_livraison_f
    ADD CONSTRAINT menu_d_fk FOREIGN KEY ( id_menu )
        REFERENCES dsid_liv_dm2.dim_menu_d ( id_menu );

ALTER TABLE dsid_liv_dm2.fait_livraison_f
    ADD CONSTRAINT moyen_livraison_d__fk FOREIGN KEY ( id_moyen_livraison )
        REFERENCES dsid_liv_dm2.dim_moyen_livraison_d ( id_moyen_livraison );

ALTER TABLE dsid_liv_dm2.fait_livraison_f
    ADD CONSTRAINT restaurant_d_fk FOREIGN KEY ( id_restaurant )
        REFERENCES dsid_liv_dm2.dim_restaurant_d ( id_restaurant );

CREATE SEQUENCE dsid_liv_dm2.dim_adresse_client_seq START WITH 1;

CREATE SEQUENCE dsid_liv_dm2.dim_adresse_restaurant_seq START WITH 1;

CREATE SEQUENCE dsid_liv_dm2.dim_client_seq START WITH 1;

CREATE SEQUENCE dsid_liv_dm2.dim_date_fin_livr_seq START WITH 1;

CREATE SEQUENCE dsid_liv_dm2.dim_livreur_seq START WITH 1;

CREATE SEQUENCE dsid_liv_dm2.dim_menu_seq START WITH 1;

CREATE SEQUENCE dsid_liv_dm2.dim_moyen_paiement_seq START WITH 1;

CREATE SEQUENCE dsid_liv_dm2.dim_restaurant_seq START WITH 1;

CREATE SEQUENCE dsid_liv_dm2.dm2_fait_seq START WITH 1;



-- Rapport récapitulatif d'Oracle SQL Developer Data Modeler : 
-- 
-- CREATE TABLE                             9
-- CREATE INDEX                             0
-- ALTER TABLE                             17
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          9
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
