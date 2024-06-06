-- Lecture des colonnes et des données
SHOW COLUMNS FROM <table>;
SELECT * FROM <table>;
SELECT * FROM <table> WHERE <primary_key> = %s;
SHOW KEYS FROM <table> WHERE Key_name = 'PRIMARY';

-- Ajout de données
INSERT INTO <table> (<columns>) VALUES (<placeholders>);

-- Mise à jour des données
UPDATE <table> SET <column1> = %s, <column2> = %s, ... WHERE <primary_key> = %s;

-- Suppression de données
DELETE FROM <table> WHERE <primary_key> = %s;

-- Suppression des entrées dans les tables relationnelles
DELETE FROM t_clients_adresse WHERE fk_clients = %s;
DELETE FROM t_clients_commande WHERE fk_clients = %s;

DELETE FROM t_clients_commande WHERE fk_commande = %s;
DELETE FROM t_commande_habits WHERE fk_commande = %s;

DELETE FROM t_commande_habits WHERE fk_habits = %s;
