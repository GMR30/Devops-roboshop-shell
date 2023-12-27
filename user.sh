echo -e "\e[32mDisable the nodejs module\e[0m"
dnf module disable nodejs -y   &>>/tmp/roboshop.log
echo -e "\e[32mEnable the nodejs module\e[0m"
dnf module enable nodejs:18 -y  &>>/tmp/roboshop.log
echo -e "\e[32mInstalling nodejs server\e[0m"
dnf install nodejs -y  &>>/tmp/roboshop.log
echo -e "\e[32mAdd user roboshop\e[0m"
useradd roboshop
rm -rf /app
mkdir /app
cd /app
echo -e "\e[32mDownload the application\e[0m"
curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip
echo -e "\e[32mchanged the dir\e[0m"
echo -e "\e[32mUnzip the file\e[0m"
unzip /tmp/user.zip &>>/tmp/roboshop.log
pwd
echo -e "\e[32mInstalling npm server\e[0m"
npm install  &>>/tmp/roboshop.log
echo -e "\e[32mCopying the configuration file\e[0m"
cp /root/Devops-roboshop-shell/user.service /etc/systemd/system/user.service  &>>/tmp/roboshop.log
echo -e "\e[32mReload the Daemon\e[0m"
systemctl daemon-reload  &>>/tmp/roboshop.log
echo -e "\e[32mEnable the service\e[0m"
systemctl enable user  &>>/tmp/roboshop.log
echo -e "\e[32mRestart the server\e[0m"
systemctl restart user  &>>/tmp/roboshop.log
echo -e "\e[32mCopying the repo file\e[0m"
cp /root/Devops-roboshop-shell/mongodb.repo /etc/yum.repos.d/mongodb.repo &>>/tmp/roboshop.log
echo -e "\e[32mInstalling mongodb-org-shell\e[0m"
dnf install mongodb-org-shell -y  &>>/tmp/roboshop.log
echo -e "\e[32mChanged the schema\e[0m"
mongo --host mongodb-dev.gmracademy.in.net </app/schema/user.js  &>>/tmp/roboshop.log

