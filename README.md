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


AWS Setup:
#clone our git code
sudo yum update -y
sudo yum install git -y
git clone https://github.com/Coveted8749/CSCI4650.git
cd CSCI4650
#add our db packages
sudo yum install -y pkg-config
sudo dnf install mariadb105
#need to add a higher version of the standard amazon linux python for django to work
sudo dnf install -y git tar gcc \
                   zlib-devel bzip2-devel readline-devel \
                   sqlite sqlite-devel openssl-devel \
                   tk-devel libffi-devel xz-devel
curl https://pyenv.run | bash && \
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc && \
    echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc && \
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc && \
    source ~/.bashrc && \
    pyenv install 3.12.3 && \
    pyenv global 3.12.3
#wait 6 minutes


# CloudCuisine Project

## Setup Instructions

### 1. MySQL Setup

Run the following commands to set up the MySQL user, database, and privileges:

```bash
sudo mysql -u root
CREATE USER 'user'@'localhost' IDENTIFIED BY '123456';
CREATE DATABASE cloudcuisine;
GRANT ALL PRIVILEGES ON cloudcuisine.* TO 'user'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

### 2. Create a Virtual Environment

Create and activate a virtual environment:

```bash
python3 -m venv venv
source venv/bin/activate
```

### 3. Install Requirements

Install required packages:

```bash
pip install -r requirements.txt
pip install python-dotenv
```

### 4. Apply Migrations

```bash
python manage.py migrate
```

### 5. Create a Django Superuser

```bash
python manage.py createsuperuser
```

### 6. Run the Server

```bash
python manage.py runserver
```

Access the application:

- Admin Panel: http://127.0.0.1:8000/admin
- API: http://127.0.0.1:8000/api/restaurants/

---

## AWS Setup

### 1. Clone the Repository

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
```

### 3. Install Build Dependencies

```bash
sudo dnf install -y git tar gcc \
    zlib-devel bzip2-devel readline-devel \
    sqlite sqlite-devel openssl-devel \
    tk-devel libffi-devel xz-devel
```

### 4. Install Python 3.12.3 with pyenv

```bash
curl https://pyenv.run | bash && \
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc && \
    echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc && \
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc && \
    source ~/.bashrc && \
    pyenv install 3.12.3 && \
    pyenv global 3.12.3
```

> Note: The above process may take up to 6 minutes.
