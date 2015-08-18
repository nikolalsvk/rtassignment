#!/bin/bash

aws elasticbeanstalk delete-application-version --application-name rtassignment --version-label `git rev-parse --short HEAD` --delete-source-bundle
aws elasticbeanstalk create-application-version --application-name rtassignment --version-label `git rev-parse --short HEAD` --source-bundle S3Bucket="elasticbeanstalk-us-west-2-057267302678",S3Key="rtassignment/b9edd40.zip"
aws elasticbeanstalk update-environment --environment-name rtassignment-env --version-label `git rev-parse --short HEAD`

echo "Status"
echo `aws elasticbeanstalk describe-environments --environment-names rtassignment-env | grep '"Status"' | cut -d: -f2 | sed -e 's/^[^"]*"//' -e 's/".*$//' -e 's/\r\n*//'`
while [[ `aws elasticbeanstalk describe-environments --environment-names rtassignment-env | grep '"Status"' | cut -d: -f2  | sed -e 's/^[^"]*"//' -e 's/".*$//'` = "Updating" ]]; do sleep 2; print "."; done

echo "VersionLabel"
echo `aws elasticbeanstalk describe-environments | grep VersionLabel | cut -d: -f2 | sed -e 's/^[^"]*"//' -e 's/".*$//'`
[[ `aws elasticbeanstalk describe-environments | grep VersionLabel | cut -d: -f2 | sed -e 's/^[^"]*"//' -e 's/".*$//'` = `git rev-parse --short HEAD` ]]

sleep 2;
a="0";
while [[ `aws elasticbeanstalk describe-environments --environment-names rtassignment-env | grep HealthStatus | cut -d: -f2  | sed -e 's/^[^"]*"//' -e 's/".*$//'` = "Warning" && $a -le 5 ]]; do sleep 2; a=$[$a+1]; print "."; done

echo "HealthStatus"
echo `aws elasticbeanstalk describe-environments --environment-names rtassignment-env | grep HealthStatus | cut -d: -f2 | sed -e 's/^[^"]*"//' -e 's/".*$//'`
[[ `aws elasticbeanstalk describe-environments --environment-names rtassignment-env | grep HealthStatus | cut -d: -f2 | sed -e 's/^[^"]*"//' -e 's/".*$//'` = "Ok" ]]
aws elasticbeanstalk describe-environments --environment-names rtassignment-env
