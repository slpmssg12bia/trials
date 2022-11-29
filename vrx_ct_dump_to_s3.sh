#!/bin/bash
mkdir -p vrx_ct/dump
mv *.txt vrx_ct/dump
aws s3 sync vrx_ct/dump/ s3://viquity-database-import-us-east-1/Jobs/aact/dump-"$(date +%d-%m)"/
