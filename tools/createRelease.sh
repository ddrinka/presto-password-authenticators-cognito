#!/bin/bash

token=$1
repo=$2
release_version=$3
path=$4
filename=$5

upload_url=$(curl -s -H "Authorization: token $token"  \
     -d "{\"tag_name\": \"$release_version\", \"prerelease\": \"true\"}"  \
     "https://api.github.com/repos/$repo/releases" | jq -r '.upload_url')

upload_url="${upload_url%\{*}"

echo "uploading asset to release to url : $upload_url"

curl -s -H "Authorization: token $token"  \
        -H "Content-Type: application/zip" \
        --data-binary "$path/$filename"  \
        "$upload_url?name=$filename"