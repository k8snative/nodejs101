
### nodejs101

A barebones Node.js app using [Express 4](http://expressjs.com/).

## Running Locally


```sh
git clone git@github.com:k8snative/nodejs101.git # or clone your own fork
cd nodejs101
npm install
npm start
```

Your app should now be running on [localhost:5000](http://localhost:5000/).

### Conceptual Diagram.
![GitHub Logo](https://github.com/k8snative/nodejs101/blob/develop/Nodejs101-jenkins-slave.png)

### Creating and configuring an EC2 instance

Use following in user data while creating EC2 instance

#!/bin/bash
apt update
apt install -y curl
apt install default-jre -y

Once instance has been created use following to install nvm, nodejs and pm2

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.bashrc
nvm install node
npm install pm2@latest -g