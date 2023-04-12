from flask import Flask, render_template,request,url_for,redirect,session
from flask_mysqldb import MySQL



app = Flask('__name__')

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'flaskapp'


mysql = MySQL(app)


app.secret_key = "advancedprogramming"



@app.route('/register', methods=['GET','POST'])
def register():
    if request.method == 'POST':
        #fetch data
        userDetails = request.form
        username = userDetails['username']
        password = userDetails['password']
        email = userDetails['email']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO users(username,password,email) VALUES(%s,%s,%s)", (username,password,email))
        mysql.connection.commit()
        cur.close()
        return redirect(url_for('login'))
    return render_template('register.html')
    
    
#################### routing login form
# @app.route('/login')
# def login():
#     return render_template('login.html')

################## login form routing and checking the session
@app.route('/', methods = ['GET','POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        if username != 'admin' and password != 'password':
            cursor = mysql.connection.cursor()
            cursor.execute("SELECT * FROM users WHERE username=%s AND password=%s", (username, password))
            user = cursor.fetchone()
            session['loggedin']=True
            session['username']=user[1]
            return redirect(url_for('package'))
        
        elif username == 'admin' and password == 'password':
                return render_template('admin.html')    
        else:
            return render_template('False.html')
    return render_template('login.html')




###################### routing to booking page
@app.route('/booking', methods=['GET','POST'])
def booking():
    if 'username' in session:
        return render_template('booking.html')
    else:
        return redirect(url_for('login')) 



###################### routing to package page
@app.route('/package', methods=['GET','POST'])
def package():
    if 'username' in session:
        return render_template('package.html')
    else:
        return redirect(url_for('login')) 



##################### routing feedback form
@app.route('/feedback', methods=['GET','POST'])
def feedback():
    if 'username' in session:
        return render_template('feedback.html')
    else:
        return redirect(url_for('login'))



############## logout page routing the function

@app.route('/logout')
def logout():
    session.pop('loggedin',None)
    session.pop('username',None)
    return redirect(url_for('login'))








if __name__ == '__main__':
    app.run(debug=True)