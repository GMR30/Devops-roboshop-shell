echo -e "\e[32mInstall the repository\e[0m"
dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y  &>>/tmp/roboshop.log
echo -e "\e[32mEnable the redis module\e[0m"
dnf module enable redis:remi-6.2 -y  &>>/tmp/roboshop.log
echo -e "\e[32mInstalling the redis\e[0m"
dnf install redis -y  &>>/tmp/roboshop.log
echo -e "\e[32mEdit the redis listen address\e[0m"
sed -i  's/127.0.0.1/0.0.0.0/' /etc/redis.conf /etc/redis/redis.conf  &>>/tmp/roboshop.log
echo -e "\e[32menable the redis\e[0m"
systemctl enable redis  &>>/tmp/roboshop.log
echo -e "\e[32mRestart the redis service\e[0m"
systemctl restart redis  &>>/tmp/roboshop.log