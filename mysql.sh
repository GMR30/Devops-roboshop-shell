echo -e "\e[32mDisable the mysql module\e[0m"
dnf module disable mysql -y
echo -e "\e[32mCopied the mysql repo file\e[0m"
cp /root/Devops-roboshop-shell/mysql.repo /etc/yum.repos.d/mysql.repo
echo -e "\e[32mInstall the mysql community server\e[0m"
dnf install mysql-community-server -y
echo -e "\e[32mmysql service enabled \e[0m"
systemctl enable mysqld
echo -e "\e[32mstartthe mysql server\e[0m"
systemctl restart mysqld
echo -e "\e[32mSet_Root_Passwd the mysql community server\e[0m"
mysql_secure_installation --set-root-pass RoboShop@1
echo -e "\e[32mLogin to the mysql community server\e[0m"
mysql -uroot -pRoboShop@1