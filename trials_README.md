# Create Environment 
Ubuntu, t2micro, generate key (or select existing), select default security group, configure storage: 20, 
modify IAM role > select AmazonS3fullaccess, user must have SSH security access, connect with putty, log into server as user: ubuntu

# Update Environment 

```
sudo apt update 

sudo apt install unzip

sudo apt install python3-pip -y
```
# Install AWS CLI 
```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

unzip awscliv2.zip

sudo ./aws/install
```

# Configure AWS CLI
```
aws configure

AKIA6CZ442HWM64HSD7R

tnrbtyMG2j+iYOiXP2BiBwpwWCvfe77FDuQndsBM

us-east-1

json
```

# Clone Git Repository
```
git clone https://github.com/slpmssg12bia/trials.git
```
# cd into the repository
```
cd trials
```
# Recreate bash Files
```
touch trials_clean.sh
nano trials_clean.sh

#!/bin/bash
rm -rf dump
rm db.zip

ctrl X
Y
---------------------------------
touch trials_dump_to_s3.sh
nano trials_dump_to_s3.sh

#!/bin/bash
mkdir dump
mv *.txt dump
aws s3 sync dump/ s3://viquity-database-import-us-east-1/Jobs/aact/dump-"$(date +%d-%m-%y-%H-%M)"/

ctrl X
Y
------------------------
touch trials_cron.sh
nano trials_cron.sh

#!/bin/bash
cd /home/ubuntu/trials
python3 /home/ubuntu/trials/trials_cron.py

ctrl X
Y
```
# Delete Original bash files
```
rm clean.sh  dump_to_s3.sh  cron.sh
```

# Change Permissions of bash Files
```
chmod +x   trials_clean.sh  trials_dump_to_s3.sh  trials_cron.sh
```

# install pip dependencies
```
pip install -r trials_requirements.txt 
```
# install Cron jobs for Parsing
```
pwd

sudo apt-get install cron
```
# Open Cron Tab
```
sudo su

pip install -r trials_requirements.txt 

nano /etc/crontab
```
# Create Cron Job ~ https://crontab.guru/examples.html
```
0 0 1 * *  root bash /home/ubuntu/trials/trials_cron.sh
!!!CARRIAGE RETURN after line above!!!!!

ctrl x

y

enter
```
