#!/bin/bash
mkdir viquity-database-import-us-east-1/Jobs/aact/dump
mv *.txt dump
aws s3 sync viquity-database-import-us-east-1/Jobs/aact/dump/ s3://viquity-database-import-us-east-1/Jobs/aact/dump-"$(date +%d-%m)"/

