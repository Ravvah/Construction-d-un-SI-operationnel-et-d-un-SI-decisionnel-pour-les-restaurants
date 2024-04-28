-- Généré par Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   à :        2024-01-21 15:31:26 CET
--   site :      Oracle Database 11g
--   type :      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE
DROP TABLE dsid_liv_dm1.dim_adresse_norm_client_d CASCADE;
DROP TABLE dsid_liv_dm1.dim_adresse_norm_restaurant_d CASCADE ;
DROP TABLE dsid_liv_dm1.dim_client_d CASCADE;
DROP TABLE dsid_liv_dm1.dim_date_commande_d CASCADE;
DROP TABLE dsid_liv_dm1.dim_restaurant_d CASCADE;
DROP TABLE dsid_liv_dm1.dim_date_fin_preparation_d CASCADE;
DROP TABLE dsid_liv_dm1.dim_moyen_paiement_d CASCADE;
DROP TABLE dsid_liv_dm1.fait_commande_f CASCADE;

DROP SEQUENCE dsid_liv_dm1.seq_adresse_norm_client;

DROP SEQUENCE dsid_liv_dm1.seq_adresse_norm_restaurant;

DROP SEQUENCE dsid_liv_dm1.seq_client;

DROP SEQUENCE dsid_liv_dm1.seq_date_commande;

DROP SEQUENCE dsid_liv_dm1.seq_date_fin_preparation;

DROP SEQUENCE dsid_liv_dm1.seq_moyen_paiement;

DROP SEQUENCE dsid_liv_dm1.seq_restaurant;

DROP SEQUENCE dsid_liv_dm1.seq_id_commande;

DROP SEQUENCE dsid_liv_dm1.fait_id_client_seq;





CREATE TABLE dsid_liv_dm1.dim_adresse_norm_client_d (
    id_adresse_norm_client     INTEGER NOT NULL,
    id_adresse_norm_client_src INTEGER,
    numero_voie_client         CHARACTER VARYING(10),
    nom_voie_client            CHARACTER VARYING(100),
    code_postal_client         CHARACTER VARYING(10),
    nom_ville_client           CHARACTER VARYING(100),
    longitude                  CHARACTER VARYING(20),
    latitude                   CHARACTER VARYING(20),
    scd_start                  TIMESTAMP WITHOUT TIME ZONE,
    scd_end                    TIMESTAMP WITHOUT TIME ZONE
);

ALTER TABLE dsid_liv_dm1.dim_adresse_norm_client_d ADD CONSTRAINT dim_adresse_norm_client_pk PRIMARY KEY ( id_adresse_norm_client );

CREATE TABLE dsid_liv_dm1.dim_adresse_norm_restaurant_d (
    id_adresse_norm_restaurant     INTEGER NOT NULL,
    id_adresse_norm_restaurant_src INTEGER,
    numero_voie_restaurant         CHARACTER VARYING(10),
    nom_voie_restaurant            CHARACTER VARYING(100),
    code_postal_restaurant         CHARACTER VARYING(100),
    nom_ville_restaurant           CHARACTER VARYING(100),
    longitude_restaurant           CHARACTER VARYING(20),
    latitude_restaurant            CHARACTER VARYING(20),
    scd_start                      TIMESTAMP WITHOUT TIME ZONE,
    scd_end                        TIMESTAMP WITHOUT TIME ZONE
);

ALTER TABLE dsid_liv_dm1.dim_adresse_norm_restaurant_d ADD CONSTRAINT dim_adresse_norm_restaurant_pk PRIMARY KEY ( id_adresse_norm_restaurant
);

CREATE TABLE dsid_liv_dm1.dim_client_d (
    id_client     INTEGER NOT NULL,
    id_client_src INTEGER,
    nom_client    CHARACTER VARYING(100),
    prenom_client CHARACTER VARYING(100),
    scd_start     TIMESTAMP WITHOUT TIME ZONE,
    scd_end       TIMESTAMP WITHOUT TIME ZONE
);

ALTER TABLE dsid_liv_dm1.dim_client_d ADD CONSTRAINT dim_client_d_pk PRIMARY KEY ( id_client );

CREATE TABLE dsid_liv_dm1.dim_date_commande_d (
    id_date_commande     INTEGER NOT NULL,
    date_commande        TIMESTAMP WITHOUT TIME ZONE,
    jour                 CHARACTER VARYING(100),
    mois                 CHARACTER VARYING(100),
    annee                CHARACTER VARYING(100),
    heure                CHARACTER VARYING(100),
    minute               CHARACTER VARYING(100)
);

ALTER TABLE dsid_liv_dm1.dim_date_commande_d ADD CONSTRAINT dim_date_commande_d_pk PRIMARY KEY ( id_date_commande );

CREATE TABLE dsid_liv_dm1.dim_date_fin_preparation_d (
    id_date_fin_preparation     INTEGER NOT NULL,
    date_fin_preparation        TIMESTAMP WITHOUT TIME ZONE,
    jour                        CHARACTER VARYING(100),
    mois                        CHARACTER VARYING(100),
    annee                       CHARACTER VARYING(100),
    heure                       CHARACTER VARYING(100),
    minute                      CHARACTER VARYING(100)
);

ALTER TABLE dsid_liv_dm1.dim_date_fin_preparation_d ADD CONSTRAINT date_fin_preparation_pk PRIMARY KEY ( id_date_fin_preparation );

CREATE TABLE dsid_liv_dm1.dim_moyen_paiement_d (
    id_moyen_paiement      INTEGER NOT NULL,
    id_moyen_paiement_src  INTEGER,
    code_moyen_paiement    CHARACTER VARYING(6),
    libelle_moyen_paiement CHARACTER VARYING(100)
);

ALTER TABLE dsid_liv_dm1.dim_moyen_paiement_d ADD CONSTRAINT dim_moyen_paiement_d_pk PRIMARY KEY ( id_moyen_paiement );

CREATE TABLE dsid_liv_dm1.dim_restaurant_d (
    id_restaurant      INTEGER NOT NULL,
    id_restaurant_src  INTEGER,
    code_restaurant CHARACTER VARYING(6),  
    raison_sociale_restaurant CHARACTER VARYING(100), 
    scd_start TIMESTAMP WITHOUT TIME ZONE,
    scd_end TIMESTAMP WITHOUT TIME ZONE
);

ALTER TABLE dsid_liv_dm1.dim_restaurant_d ADD CONSTRAINT dim_restaurant_d_pk PRIMARY KEY ( id_restaurant );

CREATE TABLE dsid_liv_dm1.fait_commande_f (
    id_commande                INTEGER NOT NULL,
    id_client                  INTEGER NOT NULL,
    id_restaurant              INTEGER NOT NULL,
    id_moyen_paiement          INTEGER NOT NULL,
    id_date_fin_preparation    INTEGER NOT NULL,
    id_adresse_norm_client     INTEGER NOT NULL,
    id_adresse_norm_restaurant INTEGER NOT NULL,
    id_date_commande           INTEGER NOT NULL,
	numero_commande			   INTEGER,
    montant_total              REAL,
    temps_theo_preparation     BIGINT,
    temps_reel                 BIGINT
);

ALTER TABLE dsid_liv_dm1.fait_commande_f ADD CONSTRAINT fait_commande_f_pk PRIMARY KEY ( id_commande );

ALTER TABLE dsid_liv_dm1.fait_commande_f
    ADD CONSTRAINT adresse_norm_restaurant_fk FOREIGN KEY ( id_adresse_norm_restaurant )
        REFERENCES dsid_liv_dm1.dim_adresse_norm_restaurant_d ( id_adresse_norm_restaurant );

ALTER TABLE dsid_liv_dm1.fait_commande_f
    ADD CONSTRAINT dim_adresse_norm_client_d_fk FOREIGN KEY ( id_adresse_norm_client )
        REFERENCES dsid_liv_dm1.dim_adresse_norm_client_d ( id_adresse_norm_client );

ALTER TABLE dsid_liv_dm1.fait_commande_f
    ADD CONSTRAINT dim_client_d_fk FOREIGN KEY ( id_client )
        REFERENCES dsid_liv_dm1.dim_client_d ( id_client );

ALTER TABLE dsid_liv_dm1.fait_commande_f
    ADD CONSTRAINT dim_date_commande_d_fk FOREIGN KEY ( id_date_commande )
        REFERENCES dsid_liv_dm1.dim_date_commande_d ( id_date_commande );

ALTER TABLE dsid_liv_dm1.fait_commande_f
    ADD CONSTRAINT dim_date_fin_preparation_d_fk FOREIGN KEY ( id_date_fin_preparation )
        REFERENCES dsid_liv_dm1.dim_date_fin_preparation_d ( id_date_fin_preparation );

ALTER TABLE dsid_liv_dm1.fait_commande_f
    ADD CONSTRAINT dim_moyen_paiement_d__fk FOREIGN KEY ( id_moyen_paiement )
        REFERENCES dsid_liv_dm1.dim_moyen_paiement_d ( id_moyen_paiement );

ALTER TABLE dsid_liv_dm1.fait_commande_f
    ADD CONSTRAINT dim_restaurant_d_fk FOREIGN KEY ( id_restaurant )
        REFERENCES dsid_liv_dm1.dim_restaurant_d ( id_restaurant );

CREATE SEQUENCE dsid_liv_dm1.seq_adresse_norm_client START WITH 1 ;

CREATE SEQUENCE dsid_liv_dm1.seq_adresse_norm_restaurant START WITH 1 ;

CREATE SEQUENCE dsid_liv_dm1.seq_client START WITH 1 ;

CREATE SEQUENCE dsid_liv_dm1.seq_date_commande START WITH 1 ;

CREATE SEQUENCE dsid_liv_dm1.seq_date_fin_preparation START WITH 1 ;

CREATE SEQUENCE dsid_liv_dm1.seq_moyen_paiement START WITH 1 ;

CREATE SEQUENCE dsid_liv_dm1.seq_restaurant START WITH 1 ;

CREATE SEQUENCE dsid_liv_dm1.seq_id_commande START WITH 1 ;

CREATE SEQUENCE dsid_liv_dm1.fait_id_client_seq START WITH 1 ;



-- Rapport récapitulatif d'Oracle SQL Developer Data Modeler : 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             0
-- ALTER TABLE                             15
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
-- CREATE SEQUENCE                         13
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
