#!/bin/bash
# Setting the absolute path to repository
PATH_TO_ROOT_DIR=/home/farrukh/application-nodejs/deployment-develop/
PATH_TO_NODEJS101=/home/farrukh/application-nodejs/deployment-develop/nodejs101
PATH_TO_CRONLOGS=/home/farrukh/application-nodejs/deployment-develop/nodejs101-deployment.log
PATH_TO_GITKEY=git@github.com:k8snative/nodejs101.git
WORKDIR=/home/farrukh/application-nodejs/deployment-develop/nodejs101_dev/
ADMIN_FE_DIR=nodejs101_dev/

cd $PATH_TO_ROOT_DIR
git clone $PATH_TO_GITKEY


# Resetting the files ownership
# GIT Security Policy for safe repository ownership
git config --global --add safe.directory $PATH_TO_NODEJS101

# Output for writing logs
# 1. Cleaning any changes made by system user
# 2. Checking out to `qa` branch
# 3. Pulling `develop` branch
# 4. Pushing the code

output=$(
  # BEGIN: Frontend
  git -C $PATH_TO_NODEJS101 clean -df &&
  git -C $PATH_TO_NODEJS101 checkout main &&
  git -C $PATH_TO_NODEJS101 fetch &&
  git -C $PATH_TO_NODEJS101 checkout develop &&
  git -C $PATH_TO_NODEJS101 pull origin develop
)
echo "$output"
echo [`date`]: $output >> $PATH_TO_CRONLOGS
#cp .env $PATH_TO_NODEJS101

#rm -rf $WORKDIR

#mv $PATH_TO_NODEJS101 $WORKDIR

cd $PATH_TO_NODEJS101

#sed -i 's/3002/3004/' package.json


export PATH="/home/farrukh/.nvm/versions/node/v18.16.0/bin/:$PATH"


npm install 


rm -rf $WORKDIR
mv $PATH_TO_NODEJS101 $WORKDIR

cd $WORKDIR

if pm2 describe node101Dev > /dev/null 2>&1; then
    echo "Process 'node101dDev' already exists. just restarting it"
    pm2 restart node101Dev
  else pm2 start npm --name "node101Dev" -- start
fi
