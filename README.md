
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



# CloudCuisine Project

## AWS Setup Instructions
Setup an EC2 and MySQL RDS on AWS
Connect to EC2 CLI
Ensure you can access the public IP from the browser when you set it up

### 1. Clone Our Git Repository

```bash
sudo yum update -y
sudo yum install git -y
git clone https://github.com/Coveted8749/CSCI4650.git
cd CSCI4650
```

### 2. Install Database Packages

```bash
sudo yum install -y pkg-config
sudo dnf install mariadb105
sudo dnf install mariadb-connector-c-devel

```

### 3. Install Build Dependencies to Add Python

```bash
sudo dnf install -y git tar gcc \
    zlib-devel bzip2-devel readline-devel \
    sqlite sqlite-devel openssl-devel \
    tk-devel libffi-devel xz-devel
```

### 4. Install Python 3.12.3 with pyenv

> Note: We cannot use the standard yum python package because it is not compatible with the version of django we are using.

```bash
curl https://pyenv.run | bash && \
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc && \
    echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc && \
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc && \
    source ~/.bashrc && \
    pyenv install 3.12.3 && \
    pyenv global 3.12.3
```

> Note: The free tier amazon ec2 instance will take several minutes to install.

### 5. Run Virtual Environment Similar to Before 
```bash
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
pip install python-dotenv
```
### 6. Add RDS Credentials and Migrate:

Use text editor of choice:
```bash
vim cloud_cuisine/settings
nano cloud_cuisine/settings
```

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'cloud',
        'USER': 'your_rds_username',
        'PASSWORD': 'your_rds_password',
        'HOST': 'your_rds_endpoint',
        'PORT': '3306',
    }
}

#... and farther down

ALLOWED_HOSTS = ['your_ec2_url', 'localhost', '127.0.0.1']

```

```bash
python manage.py migrate
```

### 7. Create a Django Superuser

```bash
python manage.py createsuperuser
```

### 8. Enter Dummy Data
```bash
mysql -h cloudcuisine.cpos4e2s8woz.us-east-2.rds.amazonaws.com -P 3306 -u user -p
```
```mysql
SOURCE /home/ec2-user/CSCI4650/mysql_commands/schema.sql;
SOURCE /home/ec2-user/CSCI4650/mysql_commands/dummydatapopulation.sql;
exit;
```
### 9. Run the Server

```bash
python manage.py runserver
```
> Navigate to: http://<your-ec2-public-ip>:8000/admin