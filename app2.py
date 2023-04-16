from flask import Flask, render_template,request,url_for,redirect,session
from flask_mysqldb import MySQL
import pymysql

app = Flask('__name__')

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'traveldb'


mysql = MySQL(app)


app.secret_key = "dockerboojumsweetdish"




######################## index page
@app.route('/', methods=['GET','POST'])
def index():
    return render_template('index.html')





################# register page
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
    
    


################## login form routing and checking the session
@app.route('/login', methods = ['GET','POST'])
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
            return redirect(url_for('admin'))    
        else:
            return render_template('False.html')
    return render_template('login.html')


############## routing booking page
@app.route('/booking', methods=['GET','POST'])
def booking():    
    if 'username' in session:
        if request.method == 'GET':
            return render_template('booking.html')
        
        if request.method == 'POST':
            bookingDetails = request.form
            destination = bookingDetails['destination']
            datefrom = bookingDetails['datefrom']
            dateto = bookingDetails['dateto']
            num_people = bookingDetails['num_people']
            packageprice = bookingDetails['packageprice']
            cursor = mysql.connection.cursor()
            cursor.execute("INSERT INTO booking(destination,datefrom,dateto,num_people,packageprice) VALUES(%s,%s,%s,%s,%s)", (destination,datefrom,dateto,num_people,packageprice))
            mysql.connection.commit()
        return redirect(url_for('bookingconfirmation'))
    
    


###################### routing to package page
@app.route('/package', methods=['GET','POST'])
def package():
    if 'username' in session:
        return render_template('package.html')
    else:
        return redirect(url_for('login')) 



##################### routing faq form
@app.route('/feedback', methods=['GET','POST'])
def feedback():
    return render_template('feedback.html')






################## fetching booking data 
@app.route('/bookingconfirmation', methods=['GET','POST'])
def bookingconfirmation():
    if 'username' in session:
        if request.method == 'GET':
            return render_template("bookingconfirmation.html")
    


################## routing the complaint file
@app.route('/complaint', methods=['GET','POST'])
def complaint():
    if request.method == 'GET':
        return render_template('complaint.html')
        
    if request.method == 'POST':
            complaintDetails = request.form
            name = complaintDetails['name']
            email = complaintDetails['email']
            complainttype = complaintDetails['complainttype']
            complaint = complaintDetails['complaint']
            cursor = mysql.connection.cursor()
            cursor.execute("INSERT INTO complaint(name,email,complainttype,complaint) VALUES(%s,%s,%s,%s)", (name,email,complainttype,complaint))
            mysql.connection.commit()
            return redirect(url_for('complaintconfirm'))


############## complaint confirm routing 
@app.route('/complaintconfirm', methods=['GET','POST'])
def complaintconfirm():
    return render_template('complaintconfirmation.html')






############## logout page routing the function

@app.route('/logout')
def logout():
    session.pop('loggedin',None)
    session.pop('username',None)
    return redirect(url_for('index'))




################# aboutus routing
@app.route('/aboutus', methods=['GET','POST'])
def aboutus():
    return render_template('aboutus.html') 


############################ admin processsing ###################################################################################

@app.route('/admin', methods=['GET','POST'])
def admin():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        if username == 'admin' and password == 'password':
            cursor = mysql.connection.cursor()
            cursor.execute("SELECT * FROM users WHERE username=%s AND password=%s", (username, password))
            admin = cursor.fetchone()
            session['loggedin']=True
            session['username']=admin[1]
    return render_template('admin.html')



################### admin page
# Connect to the database
connection = pymysql.connect(
    host='localhost',
    user='root',
    password='',
    db='traveldb',
    cursorclass=pymysql.cursors.DictCursor
)

@app.route('/adminusers', methods=['GET','POST'])
def adminusers():
    # if 'username' in session:
        with connection.cursor() as cursor:
            cursor.execute("SELECT * FROM users")
            users = cursor.fetchall()
        return render_template('users.html', users=users)
    
    
    
#################################    
@app.route('/adminbook')
def adminbook():
    try:
        # Fetch user data from the database
        with connection.cursor() as cursor:
            cursor.execute("SELECT * FROM booking")
            booking = cursor.fetchall()
        # Render the template and pass in the user data
        return render_template('bookingregister.html', booking=booking)
    
    except Exception as e:
        # Handle any errors that occur
        print(e)
        return "An error occurred: {}".format(e)



#############################################
@app.route('/admincomplaint')
def admincomplaint():
    try:
        # Fetch user data from the database
        with connection.cursor() as cursor:
            cursor.execute("SELECT * FROM complaint")
            complaint = cursor.fetchall()
        
        # Render the template and pass in the user data
        return render_template('complaintregister.html', complaint=complaint)
    
    except Exception as e:
        # Handle any errors that occur
        print(e)
        return "An error occurred: {}".format(e)


if __name__ == '__main__':
    app.run(debug=True, port=3000)