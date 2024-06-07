# Guide d'installation et de configuration

## Étape 1 : Installation des fichiers fournis sur GitHub
1. Installez les fichiers fournis et placez-les dans un emplacement facilement accessible.

## Étape 2 : Installation d'un serveur MySQL
1. Téléchargez et installez Laragon (version complète) depuis ce lien : [Laragon Download](https://laragon.org/download/).

## Étape 3 : Création et configuration d'une nouvelle base de données
1. Après l'installation de Laragon, ouvrez Laragon.
2. Cliquez sur le bouton **Start All** dans le tableau de bord de Laragon pour démarrer le serveur MySQL.
3. Cliquez ensuite sur le bouton **Database** pour ouvrir une session.
4. Une fois dans HeidiSQL, allez dans **Fichier -> Exécuter un fichier SQL...**. Naviguez jusqu'au dump téléchargé préalablement et exécutez-le.
5. Vérifiez que la base de données a bien été configurée.

## Étape 4 : Installation de Python
1. Téléchargez et installez Python depuis ce lien : [Python Downloads](https://www.python.org/downloads/).

## Étape 5 : Installation de PyCharm (Community Edition)
1. Téléchargez et installez PyCharm Community Edition depuis ce lien : [PyCharm Download](https://www.jetbrains.com/pycharm/download/?section=windows).

## Étape 6 : Importation du projet dans PyCharm
1. Ouvrez PyCharm.
2. Cliquez sur **File -> Open**, puis ouvrez le fichier **projet**.

## Étape 7 : Installation des modules nécessaires utilisés dans le code main.py
Le projet est organisé de la manière suivante :

    Projet
    ├── Database // Contient tous les fichiers annexes : MCD, MLD, dictionnaire de données, etc.
    ├── static // Contient le CSS et les images, GIF, fichiers MP3 utilisés dans le code
    │   ├── css.css
    │   ├── gif.gif
    │   └── sound.mp3
    ├── Templates // Contient les fichiers HTML pour les différentes pages du projet
    │   ├── edit_data.html
    │   ├── login.html
    │   ├── table_data.html
    │   └── tables.html
    ├── venv // Contient l'environnement virtuel Python avec les requêtes SQL nécessaires pour faire fonctionner le CRUD en utilisant Flask
    │   └── library root
    └── main.py

1. Ouvrez le fichier main.py.
2. En plaçant votre curseur sur les modules utilisés dans le code, vous aurez la possibilité de les installer.
3. Exemple de modules à installer :
    ```python
    import flask
    import pymysql.cursors
    ```

## Étape 8 : Exécution du fichier main.py
1. Ouvrez le fichier main.py.
2. Utilisez la combinaison de touches **Shift + F10** pour exécuter le fichier.
3. Dans le terminal, cliquez sur l'adresse suivante : [http://127.0.0.1:5000](http://127.0.0.1:5000).
4. Connectez-vous avec l'utilisateur root.
