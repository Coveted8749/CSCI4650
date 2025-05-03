# CloudCuisine Project

## AWS Setup Instructions
Setup an EC2 on AWS
During EC2 setup go to security, click on the security url with launch-wizard. Click on the Security group ID. Edit inbound rules. Add all 4 of the inbound groups from week 6 lecture. Additionally add port 8000 to the inbound rules.

Create RDS free tier. Connect it to the existing EC2 instance. Ensure whatever login credentials matches the ones in the project. Name the database cloudcuisine. I used master username of user and password 12345678 in the template. You may have to adjust dbconfig.cnf later in addition to the settings.py. Password has to have 8 characters. 
> Obviously this is unsecure. 

### 1. Setup Project
Connect to EC2 CLI
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
> Note: The free tier amazon ec2 instance will take several minutes to install.

```bash
curl https://pyenv.run | bash && \
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc && \
    echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc && \
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc && \
    source ~/.bashrc && \
    pyenv install 3.12.3 && \
    pyenv global 3.12.3
```

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
vim cloud_cuisine/settings.py
```
```bash
nano cloud_cuisine/settings.py
```

```python

ALLOWED_HOSTS = ['your_ec2_url'] #keep the '' around the url

#... and farther down
 
 DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'cloudcusine',
        'USER': 'your_rds_username',
        'PASSWORD': 'your_rds_password',
        'HOST': 'your_rds_endpoint',
        'PORT': '3306',
    }
}
```

> I am not sure if you also need to modify dbconfig.cnf. I didn't mess with it and everything still worked but in case the file is in the main folder
```
[client]
database = cloudcuisine
user = rds_username
host = rds_endpoint
password = rds_password
port = 3306
```

```bash
python manage.py migrate
```

### 7. Create a Django Superuser

```bash
python manage.py createsuperuser
```

### 8. Populate Database with Dummy Data
```bash
mysql -h cloudcuisine.cpos4e2s8woz.us-east-2.rds.amazonaws.com -P 3306 -u user -p
```
```mysql
SOURCE /home/ec2-user/CSCI4650/mysql_commands/schema.sql;
SOURCE /home/ec2-user/CSCI4650/mysql_commands/dummydatapopulation.sql;
exit;
```
### 9. Run the Project

```bash
python manage.py runserver 0.0.0.0:8000
```
Navigate to: http://'your-ec2-public-ip':8000/admin
> Note https is not supported.