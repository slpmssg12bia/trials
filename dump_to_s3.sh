#!/bin/bash
mkdir trialsdump
mv *.txt trialsdump
aws s3 sync trialsdump/ s3://viquity-database-import-us-east-1/Jobs/aact/aact_current_dump/trialsdump-"$(date + %d-%m-%H-%M)"/
