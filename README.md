
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


### Registsred EC2 instance as Jenkins slave node  

### Configure deployment_script.sh  
1st add your machine's id_rsa.pub to ec2 instance.
You can find your public key using command  
 cat ~/.ssh/id_rsa.pub   

Then copy jenkins public private keys to EC2 instance  
cd to jenkins folder  
scp id_rsa root@ec2-instance-ip:/root/.ssh/  
scp id_rsa.pub root@ec2-instance-ip:/root/.ssh/  

Go to your EC2 instance and create following directory  
mkdir -p /var/www/application-nodejs/  

Go to your machine and copy deployment script from your machine to ec2 instance  
cd scripts/  
scp deployment_script.sh root@ec2-instance-ip:/var/www/application-nodejs/  

in the script you have to replace  
/home/farrukh/application-nodejs/deployment-develop/  
with  
/var/www/application-nodejs/deployment-uat/

for this on EC2 intsnace use vim editor to open deployment_script.sh
and use following command  

:%s#/home/farrukh/application-nodejs/deployment-develop/#/var/www/application-nodejs/deployment-uat/#g  

Then you have to set the uat branch  
git -C $PATH_TO_NODEJS101 checkout develop &&  
git -C $PATH_TO_NODEJS101 pull origin develop     

replace with  

git -C $PATH_TO_NODEJS101 checkout uat &&  
git -C $PATH_TO_NODEJS101 pull origin uat  

Now you have to change path for nvm accordingly  
export PATH="/root/.nvm/versions/node/<<node-version-as-per-your-system>>/bin/:$PATH"  

Finally change pm2 process name if needed, as in our example it is node101Dev and we are working and deploying uat branch, so
node101Uat.

Once set you are ready to deploy it using Jenkins pipeline.




