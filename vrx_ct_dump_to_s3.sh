#!/bin/bash
mkdir dump
mv *.txt dump
aws s3 sync dump s3://viquity-database-import-us-east-1/dump-"$(date +%d-%m)"/
