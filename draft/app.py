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
    return render_template('main.html',title='Hello')

@app.route('/upload/', methods=['GET','POST'])
def upload():
    # these forms go to the upload route
    if request.method == 'GET':
        return render_template('upload.html')

    else:
        compName = request.form['compName']
        link = request.form['link']
        role = request.form['role']
        seasonList = request.form.getlist('season')
        season= ','.join([str(elem) for elem in seasonList])
        # print ("TEST: here is season list")
        # print (seasonList)
        # print ("TEST: here is season ")
        # print (season)
        year = request.form['year']
        experienceList = request.form.getlist('experience')
        experience = ','.join([str(elem) for elem in experienceList])
        # insert to database:
        sqlHelper.insertCompany(compName)
        sqlHelper.insertApplication(link,compName,role,season,year,experience)
        return render_template('upload.html')


        


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
