#!/bin/bash


aws elasticbeanstalk delete-application-version --application-name rtassignment --version-label `git rev-parse --short HEAD` --delete-source-bundle
aws elasticbeanstalk create-application-version --application-name rtassignment --version-label `git rev-parse --short HEAD` --source-bundle S3Bucket="elasticbeanstalk-us-west-2-057267302678",S3Key="rtassignment/b9edd40.zip"
aws elasticbeanstalk update-environment --environment-name rtassignment-env --version-label `git rev-parse --short HEAD`


echo "`aws elasticbeanstalk describe-environments --environment-names rtassignment-env | grep HealthStatus | cut -d: -f2 | sed -e 's/^[^"]*"//' -e 's/".*$//' -e 's/\r\n*//'`"
# wait for the health to turn some colour other than grey
while [[ `aws elasticbeanstalk describe-environments --environment-names rtassignment-env | grep HealthStatus cut -d: -f2  | sed -e 's/^[^"]*"//' -e 's/".*$//'` = "Ok" ]]; do sleep 2; done

while [[ `aws elasticbeanstalk describe-environments --environment-names rtassignment-env | grep HealthStatus | cut -d: -f2 | sed -e 's/^[^"]*"//' -e 's/".*$//'` = "Info" ]]; do sleep 2; done

# check the version label
[[ `aws elasticbeanstalk describe-environments | grep VersionLabel | cut -d: -f2 | sed -e 's/^[^"]*"//' -e 's/".*$//'` = `git rev-parse --short HEAD` ]]

# check the health status
[[ `aws elasticbeanstalk describe-environments --environment-names rtassignment-env | grep HealthStatus | cut -d: -f2 | sed -e 's/^[^"]*"//' -e 's/".*$//'` = "Green" ]]
