# Cron jobs For Data Parsing 

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
Check the Buckets
```
aws s3 ls

```

# Clone your Repo
```
git clone https://github.com/slpmssg12bia/trials.git


```
# cd into the repository
```
cd trials

```
# change permission of .sh files - or recreate files
```
chmod +x  trials_dump_to_s3.sh  trials_clean.sh  trials_cron.sh
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

nano /etc/crontab

1
```
# Create Cron Job
```
0 0 1 * *  root bash /home/ubuntu/nppes/nppes_cron.sh

ctrl x

y

enter
```