
Create a virtual environment: python3 -m venv venv
source venv/bin/activate
Install requirements: pip install -r requirements.txt
pip install python-dotenv
Apply migrations: python manage.py migrate
dummy data. Login to mysql and run:
SOURCE /home/ec2-user/CSCI4650/mysql_commands/schema.sql;
SOURCE /home/ec2-user/CSCI4650/mysql_commands/dummydatapopulation.sql;
Create django super user: python manage.py createsuperuser

Run: python manage.py runserver

Visit http://127.0.0.1:8000/admin to log into the admin panel, or check the API at:
http://127.0.0.1:8000/api/restaurants/


