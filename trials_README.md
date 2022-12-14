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

aws key

aws secret key

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

touch trials_archive_s3.sh
nano trials_archive_s3.sh

#!/bin/bash
aws s3 sync trialsdump/ s3://viquity-database-import-us-east-1/Jobs/aact/aact_archive/trialsdump-"$(date +%d-%m-%y-%H-%M)"/

ctrl X
Y

---------------------------------
touch trials_clean.sh
nano trials_clean.sh

#!/bin/bash
rm -rf trialsdump

ctrl X
Y
---------------------------------
touch trials_cron.sh
nano trials_cron.sh

#!/bin/bash
cd /home/ubuntu/trials
python3 trials_cron.py

ctrl X
Y
---------------------------------

touch trials_dump_to_s3.sh
nano trials_dump_to_s3.sh

#!/bin/bash
aws s3 sync trialsdump/ s3://viquity-database-import-us-east-1/Jobs/aact/aact_current_dump/trialsdump/

ctrl X
Y
---------------------------------

touch trials_remove_old_dump.sh
nano trials_remove_old_dump.sh

#!/bin/bash
aws s3 rm s3://viquity-database-import-us-east-1/Jobs/aact/aact_current_dump --recursive

ctrl X
Y
```

# Delete Original bash files
```
rm archive_s3.sh  clean.sh  cron.sh  dump_to_s3.sh  remove_old_dump.sh 
```

# Change Permissions of bash Files
```
chmod +x   trials_archive_s3.sh  trials_clean.sh  trials_cron.sh  trials_dump_to_s3.sh  trials_remove_old_dump.sh     

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
02 02 * * sat  root bash /home/ubuntu/trials/trials_cron.sh
!!!CARRIAGE RETURN after line above!!!!!

ctrl x

y

enter
```
