-- Généré par Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   à :        2024-01-17 21:01:23 CET
--   site :      Oracle Database 11g
--   type :      Oracle Database 11g



DROP TABLE dsid_liv_wrk.dm2_ods CASCADE;

DROP TABLE dsid_liv_wrk.dm2_rejet CASCADE;

DROP TABLE dsid_liv_wrk.dm2_staging CASCADE;

DROP SEQUENCE dsid_liv_wrk.dm2_ods_seq;

DROP SEQUENCE dsid_liv_wrk.dm2_rejet_seq;

DROP SEQUENCE dsid_liv_wrk.dm2_staging_seq;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE dsid_liv_wrk.dm2_ods (
    id_dm2_ods                 INTEGER NOT NULL,
    id_livreur                 INTEGER,
    nom_livreur                CHARACTER VARYING(100),
    prenom_livreur             CHARACTER VARYING(100),
    id_moyen_livraison         INTEGER,
    code_moyen_livraison       CHARACTER VARYING(20),
    libelle_moyen_livraison    CHARACTER VARYING(50),
    id_client                  INTEGER,
    nom_client1                CHARACTER VARYING(100),
    prenom_client              CHARACTER VARYING(100),
    id_adresse_norm_client     INTEGER,
    numero_voie                CHARACTER VARYING(10),
    nom_voie                   CHARACTER VARYING(100),
    code_postal                CHARACTER VARYING(5),
    nom_ville                  CHARACTER VARYING(100),
    longitude                  CHARACTER VARYING(20),
    latitude                   CHARACTER VARYING(20),
    id_restaurant              INTEGER,
    code_restaurant            CHARACTER VARYING(5),
    raison_sociale_restaurant  CHARACTER VARYING(100),
    id_adresse_norm_restaurant INTEGER,
    numero_voie_restaurant     CHARACTER VARYING(10),
    nom_voie_restaurant        CHARACTER VARYING(100),
    code_postal_restaurant     CHARACTER VARYING(5),
    nom_ville_restaurant       CHARACTER VARYING(100),
    longitude_restaurant       CHARACTER VARYING(20),
    latitude_restaurant        CHARACTER VARYING(20),
    id_menu                    INTEGER,
    code_menu                  CHARACTER VARYING(5),
    libelle_menu               CHARACTER VARYING(100),
    nombre_articles            INTEGER,
    temps_theo_preparation     TEXT,
    id_livraison               INTEGER,
    numero_livraison           INTEGER,
    date_debut_livraison       DATE,
    date_fin_livraison         DATE,
    nombre_article_livres      INTEGER,
    remuneration_livreur       REAL,
    temps_livraison            TEXT
);

ALTER TABLE dsid_liv_wrk.dm2_ods ADD CONSTRAINT dm2_ods_pk PRIMARY KEY ( id_dm2_ods );

CREATE TABLE dsid_liv_wrk.dm2_rejet (
    id_dm2_rejet               INTEGER NOT NULL,
    id_livreur                 INTEGER,
    nom_livreur                CHARACTER VARYING(100),
    prenom_livreur             CHARACTER VARYING(100),
    id_moyen_livraison         INTEGER,
    code_moyen_livraison       CHARACTER VARYING(20),
    libelle_moyen_livraison    CHARACTER VARYING(50),
    id_client                  INTEGER,
    nom_client                 CHARACTER VARYING(100),
    prenom_client              CHARACTER VARYING(100),
    id_adresse_norm_client     INTEGER,
    numero_voie                CHARACTER VARYING(10),
    nom_voie                   CHARACTER VARYING(100),
    code_postal                CHARACTER VARYING(5),
    nom_ville                  CHARACTER VARYING(100),
    longitude                  CHARACTER VARYING(20),
    latitude                   CHARACTER VARYING(20),
    id_restaurant              INTEGER,
    code_restaurant            CHARACTER VARYING(5),
    raison_sociale_restaurant  CHARACTER VARYING(100),
    id_adresse_norm_restaurant INTEGER,
    numero_voie_restaurant     CHARACTER VARYING(10),
    nom_voie_restaurant        CHARACTER VARYING(100),
    code_postal_restaurant     CHARACTER VARYING(5),
    nom_ville_restaurant       CHARACTER VARYING(100),
    longitude_restaurant       CHARACTER VARYING(20),
    latitude_restaurant        CHARACTER VARYING(20),
    id_menu                    INTEGER,
    code_menu                  CHARACTER VARYING(5),
    libelle_menu               CHARACTER VARYING(100),
    nombre_articles            INTEGER,
    temps_theo_preparation     TEXT,
    id_livraison               INTEGER,
    numero_livraison           INTEGER,
    date_debut_livraison       DATE,
    date_fin_livraison         DATE,
    nombre_article_livres      INTEGER,
    type_rejet                 CHARACTER VARYING(50),
    message_log                CHARACTER VARYING(100)
);

ALTER TABLE dsid_liv_wrk.dm2_rejet ADD CONSTRAINT dm2_rejet_pk PRIMARY KEY ( id_dm2_rejet );

CREATE TABLE dsid_liv_wrk.dm2_staging (
    id_dm2_staging             INTEGER NOT NULL,
    id_livreur                 INTEGER,
    nom_livreur                CHARACTER VARYING(100),
    prenom_livreur             CHARACTER VARYING(100),
    id_moyen_livraison         INTEGER,
    code_moyen_livraison       CHARACTER VARYING(20),
    libelle_moyen_livraison    CHARACTER VARYING(50),
    id_client                  INTEGER,
    nom_client                 CHARACTER VARYING(100),
    prenom_client              CHARACTER VARYING(100),
    id_adresse_norm_client     INTEGER,
    numero_voie                CHARACTER VARYING(10),
    nom_voie                   CHARACTER VARYING(100),
    code_postal                CHARACTER VARYING(5),
    nom_ville                  CHARACTER VARYING(100),
    longitude                  CHARACTER VARYING(20),
    latitude                   CHARACTER VARYING(20),
    id_restaurant              INTEGER,
    code_restaurant            CHARACTER VARYING(5),
    raison_sociale_restaurant  CHARACTER VARYING(100),
    id_adresse_norm_restaurant INTEGER,
    numero_voie_restaurant     CHARACTER VARYING(10),
    nom_voie_restaurant        CHARACTER VARYING(100),
    code_postal_restaurant     CHARACTER VARYING(5),
    nom_ville_restaurant       CHARACTER VARYING(100),
    longitude_restaurant       CHARACTER VARYING(20),
    latitude_restaurant        CHARACTER VARYING(20),
    id_menu                    INTEGER,
    code_menu                  CHARACTER VARYING(5),
    libelle_menu               CHARACTER VARYING(100),
    nombre_articles            INTEGER,
    temps_theo_preparation     TEXT,
    id_livraison               INTEGER,
    numero_livraison           INTEGER,
    date_debut_livraison       DATE,
    date_fin_livraison         DATE,
    nombre_article_livres      INTEGER
);

ALTER TABLE dsid_liv_wrk.dm2_staging ADD CONSTRAINT dm2_staging_pk PRIMARY KEY ( id_dm2_staging );

CREATE SEQUENCE dsid_liv_wrk.dm2_ods_seq START WITH 1;

CREATE SEQUENCE dsid_liv_wrk.dm2_rejet_seq START WITH 1;

CREATE SEQUENCE dsid_liv_wrk.dm2_staging_seq START WITH 1;



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
