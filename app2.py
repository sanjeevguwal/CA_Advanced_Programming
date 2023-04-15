from flask import Flask, render_template,request,url_for,redirect,session
from flask_mysqldb import MySQL
from bs4 import BeautifulSoup
import requests


app = Flask('__name__')

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'webauth'


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
                return render_template('admin.html')    
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
            packageprice = bookingDetails['price']
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
    if 'username' in session:
        return render_template('faqs.html')
    else:
        return redirect(url_for('login'))



############## logout page routing the function

@app.route('/logout')
def logout():
    session.pop('loggedin',None)
    session.pop('username',None)
    return redirect(url_for('login'))


################## fetching booking data 
@app.route('/bookingconfirmation', methods=['GET','POST'])
def bookingconfirmation():
    if 'username' in session:
        if request.method == 'GET':
            # destination=None
            # bookingDetails = requestform
            #destination = request.form(['destination'])
            # datefrom = request.form['datefrom']
            # dateto = request.form['dateto']
            # num_people = request.form['num_people']
            # packageprice = request.form['packageprice']
            # response=requests.get('127.0.0.1:5000/booking')
            # soup=BeautifulSoup(response.content,'html.parser')
            # form=soup.find('form',{'id':'booking'})
            # d=form.find('input',{'id':'destination'})
            # desti = d.get('value')
            #cursor = mysql.connection.cursor()
            
            # cursor.execute("SELECT destination FROM booking WHERE destination=%s ",desti)
            #dest=cursor.fetchall()
            
            
            return render_template("bookingconfirmation.html")
        else:
            return "still not working"
    


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


if __name__ == '__main__':
    app.run(debug=True)