#!/bin/bash
set -x
version=`cat package.json | grep version | awk '{$1=$1};1' | cut -b 13-17`
body="{
\"request\": {
\"branch\" : \"develop\",
\"message\" : \"Building and uploading $version\",
 \"config\": {
   \"env\": {
     \"LEANPLUM_SDK_VERSION\": \"$version\"
   }
  }
}}'"

curl -s -X POST \
   -H "Content-Type: application/json" \
   -H "Accept: application/json" \
   -H "Travis-API-Version: 3" \
   -H "Authorization: token $TRAVIS_TOKEN" \
   -d "$body" \
   https://api.travis-ci.org/repo/Leanplum%2FRondo-ReactNative/requests