
DROP TABLE dsid_liv_wrk.dm1_ods CASCADE;

DROP TABLE dsid_liv_wrk.dm1_rejet CASCADE;

DROP TABLE dsid_liv_wrk.dm1_staging CASCADE;

DROP SEQUENCE dsid_liv_wrk.seq_dm1_ods;

DROP SEQUENCE dsid_liv_wrk.seq_dm1_rejet;

DROP SEQUENCE dsid_liv_wrk.seq_dm1_staging;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE dsid_liv_wrk.dm1_ods (
    id_dm1_ods                 INTEGER NOT NULL,
    id_commande                INTEGER,
	numero_commande            INTEGER,
    date_commande              TIMESTAMP WITHOUT TIME ZONE,
    montant_total              REAL,
    id_client                  INTEGER,
    nom_client                 CHARACTER VARYING(100),
    prenom_client              CHARACTER VARYING(100),
    id_restaurant              INTEGER,
    code_restaurant            CHARACTER VARYING(6),
    raison_sociale_restaurant  CHARACTER VARYING(100),
    id_moyen_paiement          INTEGER,
    code_moyen_paiement        CHARACTER VARYING(6),
    libelle_moyen_paiement     CHARACTER VARYING(100),
    id_adresse_norm_client     INTEGER,
    numero_voie_client         CHARACTER VARYING(10),
    nom_voie_client            CHARACTER VARYING(100),
    code_postal_client         CHARACTER VARYING(10),
    nom_ville_client           CHARACTER VARYING(100),
    longitude_client           CHARACTER VARYING(20),
    latitude_client            CHARACTER VARYING(20),
    id_adresse_norm_restaurant INTEGER,
    numero_voie_restaurant     CHARACTER VARYING(10),
    nom_voie_restaurant        CHARACTER VARYING(100),
    code_postal_restaurant     CHARACTER VARYING(5),
    nom_ville_restaurant       CHARACTER VARYING(100),
    longitude_restaurant       CHARACTER VARYING(20),
    latitude_restaurant        CHARACTER VARYING(20),
    id_preparation             INTEGER,
    date_debut_preparation     TIMESTAMP WITHOUT TIME ZONE,
    date_fin_preparation       TIMESTAMP WITHOUT TIME ZONE,
    temps_reel                 TEXT,
    temps_theo_preparation     TEXT
);

ALTER TABLE dsid_liv_wrk.dm1_ods ADD CONSTRAINT dm1_ods_pk PRIMARY KEY ( id_dm1_ods );

CREATE TABLE dsid_liv_wrk.dm1_rejet (
    id_dm1_rejet               INTEGER NOT NULL,
    id_commande                INTEGER,
	numero_commande            INTEGER,
    date_commande              TIMESTAMP WITHOUT TIME ZONE,
    montant_total              REAL,
    id_client                  INTEGER,
    nom_client                 CHARACTER VARYING(100),
    prenom_client              CHARACTER VARYING(100),
    id_restaurant              INTEGER,
    code_restaurant            CHARACTER VARYING(6),
    raison_sociale_restaurant  CHARACTER VARYING(100),
    id_moyen_paiement          INTEGER,
    code_moyen_paiement        CHARACTER VARYING(6),
    libelle_moyen_paiement     CHARACTER VARYING(100),
    id_adresse_norm_client     INTEGER,
    numero_voie_client         CHARACTER VARYING(10),
    nom_voie_client            CHARACTER VARYING(100),
    code_postal_client         CHARACTER VARYING(10),
    nom_ville_client           CHARACTER VARYING(100),
    longitude_client           CHARACTER VARYING(20),
    latitude_client            CHARACTER VARYING(20),
    id_adresse_norm_restaurant INTEGER,
    numero_voie_restaurant     CHARACTER VARYING(10),
    nom_voie_restaurant        CHARACTER VARYING(100),
    code_postal_restaurant     CHARACTER VARYING(5),
    nom_ville_restaurant       CHARACTER VARYING(100),
    longitude_restaurant       CHARACTER VARYING(20),
    latitude_restaurant        CHARACTER VARYING(20),
    id_preparation             INTEGER,
    date_debut_preparation     TIMESTAMP WITHOUT TIME ZONE,
    date_fin_preparation       TIMESTAMP WITHOUT TIME ZONE,
    type_rejet                 CHARACTER VARYING(50),
    message_log                CHARACTER VARYING(100),
    temps_theo_preparation     TEXT
);

ALTER TABLE dsid_liv_wrk.dm1_rejet ADD CONSTRAINT dm1_rejet_pk PRIMARY KEY ( id_dm1_rejet );

CREATE TABLE dsid_liv_wrk.dm1_staging (
    id_dm1_staging             INTEGER NOT NULL,
    id_commande                INTEGER,
	numero_commande            INTEGER,
    date_commande              TIMESTAMP WITHOUT TIME ZONE,
    montant_total              REAL,
    id_client                  INTEGER,
    nom_client                 CHARACTER VARYING(100),
    prenom_client              CHARACTER VARYING(100),
    id_restaurant              INTEGER,
    code_restaurant            CHARACTER VARYING(6),
    raison_sociale_restaurant  CHARACTER VARYING(100),
    id_moyen_paiement          INTEGER,
    code_moyen_paiement        CHARACTER VARYING(6),
    libelle_moyen_paiement     CHARACTER VARYING(100),
    id_adresse_norm_client     INTEGER,
    numero_voie_client         CHARACTER VARYING(10),
    nom_voie_client            CHARACTER VARYING(100),
    code_postal_client         CHARACTER VARYING(10),
    nom_ville_client           CHARACTER VARYING(100),
    longitude_client           CHARACTER VARYING(20),
    latitude_client            CHARACTER VARYING(20),
    id_adresse_norm_restaurant INTEGER,
    numero_voie_restaurant     CHARACTER VARYING(10),
    nom_voie_restaurant        CHARACTER VARYING(100),
    code_postal_restaurant     CHARACTER VARYING(5),
    nom_ville_restaurant       CHARACTER VARYING(100),
    longitude_restaurant       CHARACTER VARYING(20),
    latitude_restaurant        CHARACTER VARYING(20),
    id_preparation             INTEGER,
    date_debut_preparation     TIMESTAMP WITHOUT TIME ZONE,
    date_fin_preparation       TIMESTAMP WITHOUT TIME ZONE,
    temps_theo_preparation     TEXT
);

ALTER TABLE dsid_liv_wrk.dm1_staging ADD CONSTRAINT dm1_staging_pk PRIMARY KEY ( id_dm1_staging );

CREATE SEQUENCE dsid_liv_wrk.seq_dm1_ods START WITH 1;

CREATE SEQUENCE dsid_liv_wrk.seq_dm1_rejet START WITH 1;

CREATE SEQUENCE dsid_liv_wrk.seq_dm1_staging START WITH 1;



-- Rapport récapitulatif d'Oracle SQL Developer Data Modeler : 
-- 
-- CREATE TABLE                             3
-- CREATE INDEX                             0
-- ALTER TABLE                              3
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
-- CREATE SEQUENCE                          3
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
