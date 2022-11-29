#!/bin/bash
mkdir "$(date +"%d-%m-%Y")-dump"
mv *.txt "$(date +"%d-%m-%Y")-dump"
aws s3 cp   s3://viquity-database-import-us-east-1/Jobs/aact/"$(date +"%d-%m-%Y")-dump"/
