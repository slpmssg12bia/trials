#!/bin/bash
mkdir dump
mv *.txt dump
aws s3 sync trialsdump/ s3://viquity-database-import-us-east-1/Jobs/aact/dump-"$(date + %d-%m-%H-%M)"/
