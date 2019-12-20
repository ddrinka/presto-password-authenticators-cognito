#!/bin/bash

token=$1
repo=$2
commit_id=$3
release_version=$4
path=$5
filename=$6

upload_url=$(curl -s -H "Authorization: token $token"  \
     -d "{\"tag_name\": \"$release_version-$commit_id\", \"prerelease\": true}"  \
     "https://api.github.com/repos/$repo/releases" | jq -r '.upload_url')

upload_url="${upload_url%\{*}"

curl -s -H "Authorization: token $token"  \
        -H "Content-Type: application/zip" \
        --data-binary "@$path/$filename"  \
        "$upload_url?name=$filename"