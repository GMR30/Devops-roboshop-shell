echo -e "\e[32mCopying the repo file\e[0m"
cp /root/Devops-roboshop-shell/mongodb.repo /etc/yum.repos.d/mongodb.repo
echo -e "\e[32mInstalling Mongodb server\e[0m"
yum install mongodb-org -y  &>>/tmp/roboshop.log
echo -e "\e[32mEdit the listen address\e[0m"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
systemctl enable mongod
echo -e "\e[32mRestart the service\e[0m"
systemctl restart mongod  &>>/tmp/roboshop.log
