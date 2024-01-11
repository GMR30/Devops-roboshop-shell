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
curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip
echo -e "\e[32mchanged the dir\e[0m"
echo -e "\e[32mUnzip the file\e[0m"
unzip /tmp/cart.zip &>>/tmp/roboshop.log
pwd
echo -e "\e[32mInstalling npm server\e[0m"
npm install  &>>/tmp/roboshop.log
echo -e "\e[32mCopying the configuration file\e[0m"
cp /root/Devops-roboshop-shell/cart.service /etc/systemd/system/cart.service  &>>/tmp/roboshop.log
echo -e "\e[32mReload the Daemon\e[0m"
systemctl daemon-reload  &>>/tmp/roboshop.log
echo -e "\e[32mEnable the service\e[0m"
systemctl enable cart  &>>/tmp/roboshop.log
echo -e "\e[32mRestart the server\e[0m"
systemctl restart cart  &>>/tmp/roboshop.log

