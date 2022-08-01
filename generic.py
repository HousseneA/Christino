from flask import Flask,redirect,url_for,render_template,request,jsonify,session
from flask_mysqldb import MySQL
from flask_session import Session
from werkzeug.utils import secure_filename
import jwt
import datetime
import hashlib
import psycopg2
from flask_login import login_required, current_user
app=Flask(__name__)

conn = psycopg2.connect(
        host="localhost",
        database="projet",
        user= "root",
        password="")

""" page d'accueil"""
@app.route('/',methods=['GET'])

def home():
    cur = conn.cursor()
    cur.execute("select * from admin")
    donner = cur.fetchall()
    cur.close()
    ty = "ie je suis la"
    return render_template("index.html",titre=ty,donner=donner)


""" registre c'est la ou on creer les admin """

@app.route('/registre',methods=['POST'])
def registre():
    nom = request.form["nom"]
    email = request.form["email"]
    password = request.form["password"]
    pwd = hashlib.md5(password.encode())
    confirmation = request.form["password2"]
    cur1 = conn.cursor()
    cur1.execute("select * from admin")
    donner = cur1.fetchall()
    n = len(donner)
    """ on boucle le email pour verifier les email deja enregistrer  """
    for i in range(n):
        if (email == donner[i][2]):
            return "email deja connecter"
    cur1.close()
    if len(password) < 8:
        return "trop petit"
    elif password != confirmation:
        return "mot de pass incorrect"
    else:
        cur = conn.cursor()
        cur.execute("insert into admin(nom,email,password) values(%s,%s,%s)", (nom, email, pwd))
        conn.commit()
        cur.close()

        session["email"] = email
        """ ajoute du token dans la base de donner """
        token = jwt.encode({"nom": donner[i][1], "exp": datetime.datetime.utcnow() + datetime.timedelta(minutes=30)},
                           app.config["SECRET_KEY"])

        cur2 = conn.cursor()
        cur2.execute("insert into token(token) values(%s)", [token])
        conn.commit()

        cur2.close()
        return redirect(url_for("home"))


@app.route('/sup/<string:id>',methods=['GET'])
def sup(id):

    cur = conn.cursor()
    cur.execute("delete from admin where id=%s",str(id))
    conn.commit()
    cur.close()
    ty = "ie je suis la"
    return redirect(url_for("home"))

""" page d'authentificationn"""

@app.route('/authentification',methods=['GET'])
def login():
    return render_template("authentification.html")

""" controle l'authentification"""

@app.route('/controle',methods=['POST'])
def authcontrole():
   email = request.form["email"]
   password= request.form["password"]

   cur = conn.cursor()
   cur.execute("select * from admin")
   donner = cur.fetchall()
   n= len(donner)
   for i in range(n):
       if(email==donner[i][2] and password==donner[i][3]):
           """ ajout du token dans l'authentification"""
           token = jwt.encode({"nom": donner[i][2], "exp": datetime.datetime.utcnow() + datetime.timedelta(minutes=30)},
                              app.config["SECRET_KEY"])
           session["email"]=email
           cur2 = conn.cursor()
           cur2.execute("insert into token(token) values(%s)", [token])
           conn.commit()
           cur2.close()
           return redirect(url_for("home"))
       elif(email==donner[i][2] and password!=donner[i][3]):
           return "error 404 "

   cur.close()
@app.route('/deconnection',methods=['GET'])
def dec():
    session["email"] = None
    return redirect(url_for("login"))
if __name__ == '__main__':
    app.run(port=5000,debug=True)



