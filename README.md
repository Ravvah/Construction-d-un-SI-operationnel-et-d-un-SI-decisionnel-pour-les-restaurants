# Construction d'un SI opérationnel et d'un SI décisionnel pour les restaurants

## Introduction
Ce projet vise à développer un Système d'Information (SI) opérationnel et un SI décisionnel pour les restaurants.

## Étapes de création du SI opérationnel
1. **Analyse des besoins** : Identification des besoins spécifiques des restaurants en termes de gestion des opérations quotidiennes.
2. **Collecte de données** : Utilisation de diverses sources de données pour simuler un cas réel crédible, y compris des fichiers CSV, des tables Google BigQuery, des scripts SQL sur PostgreSQL, des fichiers JSON, des fichiers XML et des fichiers Excel.
3. **Modélisation des données** : Création d'un modèle de données relationnel sur PostgreSQL pour stocker les informations nécessaires.
4. **Intégration des données** : Utilisation de Talend pour alimenter le modèle de données opérationnel présent sur PostgreSQL.

## Création du SI décisionnel
1. **Approche Ralph Kimball** : Mise en place d'un data warehouse en utilisant l'approche Ralph Kimball avec des tables de staging, ODS (Operational Data Store) et de rejet.
2. **Schéma en étoile** : Conception du schéma en étoile sur une base Oracle pour structurer les données de manière optimale pour l'analyse.
3. **Datamarts** : Division de l'alimentation du SI décisionnel en deux datamarts en fonction des besoins de visualisation et de reporting.
4. **Accès aux données** : Mise en place de vues par datamart pour permettre l'accès aux données, car l'accès direct au SI opérationnel n'est pas possible.

## But du projet
Ce projet s'est concentré sur la partie en amont du reporting, c'est-à-dire la construction de pipelines ETL pouvant servir pour du reporting BI.
