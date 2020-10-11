from flask import (Flask, render_template, make_response, url_for, request,
                   redirect, flash, session, send_from_directory, jsonify)
from werkzeug.utils import secure_filename
import random
import cs304dbi as dbi
import sqlHelper

app = Flask(__name__)

app.secret_key = 'Foldertennis00'

app.secret_key = ''.join([ random.choice(('ABCDEFGHIJKLMNOPQRSTUVXYZ' +
                                          'abcdefghijklmnopqrstuvxyz' +
                                          '0123456789'))
                           for i in range(20) ])

# This gets us better error messages for certain common request errors
app.config['TRAP_BAD_REQUEST_ERRORS'] = True

@app.route('/')
def index():
    conn = dbi.connect()
    curs = dbi.cursor(conn)
    internships = sqlHelper.getInternships(conn)
    return render_template('main.html', internships = internships)

@app.route('/upload/', methods=['GET','POST'])
def upload():
    uid = session['uid']
    # These forms go to the upload route
    if request.method == 'GET':
        return render_template('upload.html')

    else:
        if 'uid' in session:
            compName = request.form['compName']
            link = request.form['link']
            role = request.form['role']
            seasonList = request.form.getlist('season')
            season= ','.join([str(elem) for elem in seasonList])
            year = request.form['year']
            experienceList = request.form.getlist('experience')
            experience = ','.join([str(elem) for elem in experienceList])

            # Insert to database
            if sqlHelper.companyExists(compName) == 0:
                sqlHelper.insertCompany(compName)
            sqlHelper.insertApplication(link,compName,role,season,year,experience)
            flash('Internship at ' + compName + ' was uploaded successfully')
            return render_template('upload.html')
        
        #User must login before uploading 
        else:
            flash('You must be logged in to upload information.')
            return redirect(url_for('index'))

@app.route('/search', methods=['GET','POST'])
def search():
    conn = dbi.connect()
    if request.method =='GET':
        return render_template('search.html')
    else:
        role = request.form['role']
        appsList = sqlHelper.getByRole(conn, role)
        return render_template('searchResults.html', internships = appsList)

@app.route('/login', methods = ['GET','POST'])
def login():
    conn = dbi.connect()
    if request.method == "POST":
        username = request.form['username']
        password = request.form['password']
        user_exists = sqlHelper.validateLogin(conn, username, password)
        if user_exists:
            session['uid'] = request.form.get('uid')
            return redirect(url_for('search'))
        else:
            flash('''Login failed. Invalid username or password.''')
            return render_template('main.html')
    else:
        return render_template('login.html')
        
@app.route('/register', methods = ['GET','POST'])
def register():
    conn = dbi.connect()
    error = None
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        email = request.form['email']
        school = request.form['school']

        #Validate username, pw, email entries
        if not username:
            error = 'Username is required.'
            flash(error)
        elif not password:
            error = 'Password is required.'
            flash(error)
        elif not email:
            error = 'Email is required.'
            flash(error)
        else:
            is_username_unique = sqlHelper.is_username_unique(conn,username)
            
            #Check for username uniqueness, register if it is unique
            if is_username_unique == True:
                try:
                    sqlHelper.register(conn, username, password, email, school)
                    return redirect(url_for('search'))
                except:
                    error = '''This user is already registered.'''
                    flash(error)
                    return render_template('register.html')
            else:
                error = '''This username is already taken. 
                Please pick a new username'''
                flash(error)
                return render_template('register.html')            
    
    else:
        return render_template('register.html')

@app.route("/logout")
def logout():
    uid = session['uid']
    session.pop('user', None)
    return redirect(url_for('index'))

@app.before_first_request
def init_db():
    dbi.cache_cnf()
    dbi.use('techship_db')

if __name__ == '__main__':
    import sys, os
    if len(sys.argv) > 1:
        # arg, if any, is the desired port number
        port = int(sys.argv[1])
        assert(port>1024)
    else:
        port = os.getuid()
    app.debug = True
    app.run('0.0.0.0',port)
