#!/bin/bash
mkdir dump
mv *.txt dump
aws s3 sync dump/ s3://viquity-database-import-us-east-1/Jobs/aact/dump-"$(date + %d-%m-%H-%M)"/




#must be manually created in unbuntu
#touch trials_dump_to_s3.sh
#nano trials_dump_to_s3.sh
#enter code above
#ctrl X
#Y
#chmod +x trials_dump_to_s3.sh
