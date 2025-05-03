You can also just run these queries into a running mysql cli: 
    sudo mysql -u root
    CREATE USER 'user'@'localhost' IDENTIFIED BY '123456';
    CREATE DATABASE cloudcuisine;
    GRANT ALL PRIVILEGES ON cloudcuisine.* TO 'user'@'localhost';
    FLUSH PRIVILEGES;
    EXIT;


Create a virtual environment: python3 -m venv venv
source venv/bin/activate

Install requirements: pip install -r requirements.txt
pip install python-dotenv


Apply migrations: python manage.py migrate

Create django super user: python manage.py createsuperuser



Run: python manage.py runserver

Visit http://127.0.0.1:8000/admin to log into the admin panel, or check the API at:
http://127.0.0.1:8000/api/restaurants/

Created bash script for ec2:

git clone https://github.com/Coveted8749/CSCI4650.git
cd CSCI4650
chmod +x aws_setup.sh

