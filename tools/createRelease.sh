#!/bin/bash

token=$1
repo=$2
git_tag=$3
release_version=$4
text=$5
path=$6
filename=$7

upload_url=$(curl -s -H "Authorization: token $token"  \
     -d '{"tag_name": "$git_tag", "name": "$release_version", "body": "$text"}'  \
     "https://api.github.com/repos/$repo/releases" | jq -r '.upload_url')

upload_url="${upload_url%\{*}"

echo "uploading asset to release to url : $upload_url"

curl -s -H "Authorization: token $token"  \
        -H "Content-Type: application/zip" \
        --data-binary "$path/$filename"  \
        "$upload_url?name=$filename&label=$filename"