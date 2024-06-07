-- Afficher les colonnes d'une table
SHOW COLUMNS FROM t_adresse;

-- Sélectionner toutes les données d'une table
SELECT * FROM t_clients;

-- Sélectionner les données par clé primaire
SELECT * FROM t_commande WHERE ID_commande = 10;

-- Afficher les clés primaires d'une table
SHOW KEYS FROM t_habits WHERE Key_name = 'PRIMARY';

-- Ajouter des données
INSERT INTO t_adresse (Rue, NPA, NO_Rue, Ville) VALUES ('Avenue des Fleurs', 1234, 5, 'Paris');

-- Mettre à jour des données
UPDATE t_clients SET Nom = 'Smith', Prenom = 'John' WHERE ID_clients = 15;

-- Supprimer des données
DELETE FROM t_habits WHERE ID_habits = 8;

-- Supprimer des entrées dans les tables relationnelles
DELETE FROM t_clients_adresse WHERE fk_clients = 20;
