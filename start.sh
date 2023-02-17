#!/bin/bash
. ~/.nvm/nvm.sh
nvm use v18
npm install

BuildMaster() {
  npm run build
}

BuildTesting() {
  npm run build-testing
}

BuildStaging() {
  npm run build-staging
}

if [ "$1" = "build_staging" ];
then
  BuildStaging;
elif [ "$1" = "build_testing" ];
then
  BuildTesting;
else
  BuildMaster;
fi

if [ -f .env ]; then
  export $(echo $(cat .env | sed 's/#.*//g'| xargs) | envsubst)
fi

./node_modules/.bin/pm2 startOrReload ./pm2.config.js