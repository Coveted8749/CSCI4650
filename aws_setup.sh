#!/bin/bash
sudo yum update -y
sudo yum install python3 python3-pip -y
sudo yum install mysql -y
sudo yum install git -y
git clone https://github.com/Coveted8749/CSCI4650.git
cd CSCI4650
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
pip install python-dotenv
pip install django mysqlclient

#Open settings.py 
echo "Update 'DATABASES' to change the following:
 DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'cloud',
        'USER': 'your_rds_username',
        'PASSWORD': 'your_rds_password',
        'HOST': 'your_rds_endpoint',
        'PORT': '3306',
    }
 }"

python manage.py migrate
python manage.py createsuperuser


python manage.py runserver 0.0.0.0:8000


