#!/bin/bash

#aws elasticbeanstalk delete-application-version --application-name rtassignment --version-label `git rev-parse --short HEAD` --delete-source-bundle
#aws elasticbeanstalk create-application-version --application-name rtassignment --version-label `git rev-parse --short HEAD` --source-bundle S3Bucket="elasticbeanstalk-us-west-2-057267302678",S3Key="rtassignment/b9edd40.zip"
#aws elasticbeanstalk update-environment --environment-name rtassignment-env --version-label `git rev-parse --short HEAD`


echo "Status: `aws elasticbeanstalk describe-environments --environment-names rtassignment-env | grep '"Status"' | cut -d: -f2  | sed -e 's/^[^"]*"//' -e 's/".*$//'`"
while [[ `aws elasticbeanstalk describe-environments --environment-names rtassignment-env | grep '"Status"' | cut -d: -f2  | sed -e 's/^[^"]*"//' -e 's/".*$//'` = "Updating" ]]; do sleep 2; printf "."; done
[[ `aws elasticbeanstalk describe-environments --environment-names rtassignment-env | grep VersionLabel | cut -d: -f2 | sed -e 's/^[^"]*"//' -e 's/".*$//'` = `git rev-parse --short HEAD` ]]
sleep 3;
a="0";
while [[ `aws elasticbeanstalk describe-environments --environment-names rtassignment-env | grep HealthStatus | cut -d: -f2  | sed -e 's/^[^"]*"//' -e 's/".*$//'` = "Warning" && $a -le 5 ]]; do sleep 2; a=$[$a+1]; printf "."; done
echo "HealthStatus: `aws elasticbeanstalk describe-environments --environment-names rtassignment-env | grep HealthStatus | cut -d: -f2 | sed -e 's/^[^"]*"//' -e 's/".*$//'`"
if [[ `aws elasticbeanstalk describe-environments --environment-names rtassignment-env | grep HealthStatus | cut -d: -f2 | sed -e 's/^[^"]*"//' -e 's/".*$//'` = "Ok" || `aws elasticbeanstalk describe-environments --environment-names rtassignment-env | grep HealthStatus | cut -d: -f2 | sed -e 's/^[^"]*"//' -e 's/".*$//'` = "Info" ]]; then echo "True"; else echo "False"; fi
aws elasticbeanstalk describe-environments --environment-names rtassignment-env
