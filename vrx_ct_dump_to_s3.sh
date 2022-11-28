#!/bin/bash
mkdir dump
mv *.txt dump

aws s3 sync dump/ s3://aact/dump-"$(date +%d-%m)"/
