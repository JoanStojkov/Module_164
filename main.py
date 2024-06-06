from flask import Flask, render_template, request, redirect, url_for
import pymysql.cursors

app = Flask(__name__)

# Configuration de la base de données
connection = pymysql.connect(host='localhost',
                             user='root',
                             password='',
                             database='module_164',
                             cursorclass=pymysql.cursors.DictCursor)

# Page de login
@app.route('/', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        # Vérification de l'utilisateur root (sans mot de passe)
        if request.form['username'] == 'root':
            # Redirection vers la page principale avec les boutons
            return redirect(url_for('tables'))
    return render_template('login.html')

# Page principale avec les boutons
@app.route('/tables')
def tables():
    # Liste des tables disponibles dans la base de données
    tables = ['t_adresse', 't_clients', 't_clients_adresse', 't_clients_commande', 't_commande', 't_commande_habits', 't_habits']
    return render_template('tables.html', tables=tables)

# Route pour afficher les données d'une table spécifique et ajouter/détruire des données
@app.route('/table/<table>', methods=['GET', 'POST'])
def table_data(table):
    with connection.cursor() as cursor:
        if request.method == 'POST':
            if 'add' in request.form:
                # Récupérer les noms des colonnes sauf l'ID (AUTO_INCREMENT)
                cursor.execute(f"SHOW COLUMNS FROM {table}")
                columns = [column['Field'] for column in cursor.fetchall() if column['Extra'] != 'auto_increment']

                # Construire la requête INSERT
                placeholders = ', '.join(['%s'] * len(columns))
                columns_formatted = ', '.join(columns)
                sql = f"INSERT INTO {table} ({columns_formatted}) VALUES ({placeholders})"

                # Récupérer les valeurs du formulaire
                values = [request.form[column] for column in columns]
                cursor.execute(sql, values)
                connection.commit()

            elif 'edit' in request.form:
                return redirect(url_for('edit_data', table=table, id=request.form['edit']))

        # Récupérer les colonnes de la table
        cursor.execute(f"SHOW COLUMNS FROM {table}")
        columns = [column['Field'] for column in cursor.fetchall()]

        # Récupérer les données de la table
        cursor.execute(f"SELECT * FROM {table}")
        data = cursor.fetchall()

    return render_template('table_data.html', table=table, columns=columns, data=data)

# Route pour supprimer une ligne d'une table
@app.route('/delete/<table>/<int:id>', methods=['POST'])
def delete_data(table, id):
    with connection.cursor() as cursor:
        try:
            # Supprimer les entrées correspondantes dans les tables relationnelles si nécessaire
            if table == 't_clients':
                cursor.execute("DELETE FROM t_clients_adresse WHERE fk_clients = %s", (id,))
                cursor.execute("DELETE FROM t_clients_commande WHERE fk_clients = %s", (id,))
            elif table == 't_commande':
                cursor.execute("DELETE FROM t_clients_commande WHERE fk_commande = %s", (id,))
                cursor.execute("DELETE FROM t_commande_habits WHERE fk_commande = %s", (id,))
            elif table == 't_habits':
                cursor.execute("DELETE FROM t_commande_habits WHERE fk_habits = %s", (id,))

            # Supprimer la ligne de la table spécifiée
            cursor.execute(f"DELETE FROM {table} WHERE {get_primary_key(table)} = %s", (id,))
            connection.commit()
            message = "La donnée a été supprimée avec succès."
        except Exception as e:
            message = f"Erreur lors de la suppression: {str(e)}"

    return redirect(url_for('table_data', table=table, message=message))



# Route pour afficher le formulaire de modification des données
@app.route('/edit/<table>/<int:id>', methods=['GET', 'POST'])
def edit_data(table, id):
    with connection.cursor() as cursor:
        if request.method == 'POST':
            # Récupérer les noms des colonnes sauf l'ID (AUTO_INCREMENT)
            cursor.execute(f"SHOW COLUMNS FROM {table}")
            columns = [column['Field'] for column in cursor.fetchall() if column['Extra'] != 'auto_increment']

            # Construire la requête UPDATE
            update_values = ', '.join([f"{column} = %s" for column in columns])
            sql = f"UPDATE {table} SET {update_values} WHERE {get_primary_key(table)} = %s"

            # Récupérer les nouvelles valeurs du formulaire
            new_values = [request.form[column] for column in columns]
            new_values.append(id)  # Ajouter l'ID de la ligne à modifier
            cursor.execute(sql, new_values)
            connection.commit()

            return redirect(url_for('table_data', table=table))

        # Récupérer les colonnes de la table
        cursor.execute(f"SHOW COLUMNS FROM {table}")
        columns = [column['Field'] for column in cursor.fetchall()]

        # Récupérer les données de la ligne à modifier
        cursor.execute(f"SELECT * FROM {table} WHERE {get_primary_key(table)} = %s", (id,))
        data = cursor.fetchone()

    return render_template('edit_data.html', table=table, columns=columns, data=data)

def get_primary_key(table):
    with connection.cursor() as cursor:
        cursor.execute(f"SHOW KEYS FROM {table} WHERE Key_name = 'PRIMARY'")
        return cursor.fetchone()['Column_name']

if __name__ == '__main__':
    app.run(debug=True)
