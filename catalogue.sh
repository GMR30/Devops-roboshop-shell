echo -e "\e[32mDisable the nodejs module\e[0m"
dnf module disable nodejs -y
echo -e "\e[32mEnable the nodejs module\e[0m"
dnf module enable nodejs:18 -y
echo -e "\e[32mInstalling nodejs server\e[0m"
dnf install nodejs -y
echo -e "\e[32mAdd user roboshop\e[0m"
useradd roboshop
echo -e "\e[32mDownload the application\e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
echo -e "\e[32mchanged the dir\e[0m"
cd /app
echo -e "\e[32mUnzip the file\e[0m"
unzip /tmp/catalogue.zip
echo -e "\e[32mInstalling npm server\e[0m"
npm install
echo -e "\e[32mCopying the configuration file\e[0m"
cp catalogue.service /etc/systemd/system/catalogue.service
echo -e "\e[32mReload the Daemon\e[0m"
systemctl daemon-reload
echo -e "\e[32mEnable the service\e[0m"
systemctl enable catalogue
echo -e "\e[32mRestart the server\e[0m"
systemctl restart catalogue
echo -e "\e[32mCopying the repo file\e[0m"
cp mongodb.repo /etc/yum.repos.d/mongodb.repo
echo -e "\e[32mInstalling mongodb-org-shell\e[0m"
dnf install mongodb-org-shell -y
echo -e "\e[32mChanged the schema\e[0m"
mongo --host mongodb-dev.gmracademy.in.net </app/schema/catalogue.js

