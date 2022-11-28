#!/bin/bash
mkdir dump
mv *.txt dump

aws s3 sync dump/ s3://aact - clinical trials/dump-"$(date +%d-%m)"/