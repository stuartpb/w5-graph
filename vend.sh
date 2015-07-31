#!/usr/bin/env bash

vendor () {
  cp "./node_modules/$1" "./vendor/${1##*/}"
}

npm install
mkdir ./vendor
vendor sigma/build/sigma.min.js
vendor sigma/build/plugins/sigma.layout.forceAtlas2.min.js
vendor whatwg-fetch/fetch.js
