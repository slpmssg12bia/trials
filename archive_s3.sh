#!/bin/bash
aws s3 sync trialsdump/ s3://viquity-database-import-us-east-1/Jobs/aact/aact_archive/trialsdump-"$(date +%d-%m-%y-%H-%M)"/
