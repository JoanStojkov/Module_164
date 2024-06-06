# Guide d'installation et de configuration

## Étape 1: Installer un serveur MySQL
1. Téléchargez et installez Laragon (Full version) depuis ce lien : [Laragon Download](https://laragon.org/download/).

## Étape 2: Créer et configurer une nouvelle base de données
1. Après l'installation de Laragon, ouvrez Laragon.
2. Cliquez sur le bouton **MySQL** dans le tableau de bord de Laragon pour démarrer le serveur MySQL.
3. Utilisez l'interface phpMyAdmin incluse dans Laragon pour créer une nouvelle base de données. Vous pouvez accéder à phpMyAdmin en cliquant sur **Menu** -> **Database** -> **phpMyAdmin**.

## Étape 3: Installer Python
1. Téléchargez et installez Python depuis ce lien : [Python Downloads](https://www.python.org/downloads/).

## Étape 4: Installer PyCharm (Community Edition)
1. Téléchargez et installez PyCharm Community Edition depuis ce lien : [PyCharm Download](https://www.jetbrains.com/pycharm/download/?section=windows).

## Étape 5: Créer un nouveau projet dans PyCharm
1. Ouvrez PyCharm.
2. Cliquez sur **Create New Project**.
3. Changez le répertoire pour ce nouveau projet en créant un nouveau répertoire “vide” sur votre disque local.
4. Sélectionnez ce répertoire pour votre nouveau projet PyCharm.

En suivant ces étapes, vous aurez un environnement de développement complet pour commencer à travailler sur votre projet avec Python, MySQL, et PyCharm.

## Étape 6: Créer une structure pour les répértoire
    Projet
    ├── Database // Contien tout les fichier en annexe mcd, mld, dictionnaire de donnée, etc..
    ├── static // contien le css et les image, gif, fichier mp3 que je vais utiliser dans mon code 
    │   ├── css.css
    │   ├── gif.gif
    │   └── sound.mp3
    ├── Templates // Contien mes fichier html pour les ifférente page de mon projet
    │   ├── edit_data.html
    │   ├── login.html
    │   ├── table_data.html
    │   └── tables.html
    ├── venv // Contien le fichier Python principal avec les requêtes SQL néecaisaire pour faire fonctionner mon crud en utilisatn flask 
    │   └── library root
    └── main.py

## Etape 7: Installer les modules nécessaire utiliser dans le code main.py
En placant votre curseur sur les modules utiliser dans le code vous aurez la posibilité de les installées 
1. import flask 
2. import pymysql.cursors