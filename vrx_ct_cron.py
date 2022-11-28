#!/usr/bin/python

import subprocess
import re
from bs4 import BeautifulSoup
import requests
from datetime import datetime
import wget

# postgres_data.dmp
def get_urls(soup):
    urls = []
    for a in soup.find_all('a', href=True):
        ul = a.find_all(text=re.compile("_pipe-delimited-export"))
        if ul != []:
            urls.append(a)
    print('done scarping the url......!!!!')
    return urls

def download_and_extract(urls):
    for texts in urls:
        text = str(texts)
        file = text[116:150]
        print('zip file :', file)
        date = file[:8]
        fileDate = datetime.strptime(date, '%Y%m%d').date()
        print('file date :', fileDate)
        CurrentDate = datetime.today().date()
        print('current date :',CurrentDate)
       #if fileDate == CurrentDate:
        zip_link = texts['href']
        print('Downloading %s :' %zip_link)
        slashurl = zip_link.split('/')
        wget.download(zip_link)
        print("file downloaded....!!!")
        subprocess.run(["mv", slashurl[3], "db.zip"])
        subprocess.run(["unzip", "db.zip"])
        #subprocess.run(["bash","remove_old_dump.sh"])
        print("uploading the latest dump to s3")
        subprocess.run(["bash", "vrx_ct_dump_to_s3.sh"])
        #subprocess.run(["bash", "vrx_ct_clean.sh"])
        return

r = requests.get('https://aact.ctti-clinicaltrials.org/download')
soup = BeautifulSoup(r.content, 'html.parser')
urls = get_urls(soup)
download_and_extract(urls)
