echo -e "\e[32mInstall golang\e[0m"
dnf install golang -y
echo -e "\e[32mUseradd roboshop\e[0m"
useradd roboshop
echo -e "\e[32mRemove the conentent in /app and recreate \e[0m"
rm -rf /app
mkdir /app
echo -e "\e[32mto download the Dispatch\e[0m"
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip
cd /app
echo -e "\e[32mTo unzip the dispatch file\e[0m"
unzip /tmp/dispatch.zip
cd /app
echo -e "\e[32mInitiate the dispatch\e[0m"
go mod init dispatch
go get
go build
echo -e "\e[32mCopying the service file\e[0m"
cp /root/Devops-roboshop-shell/dispatch.service /etc/systemd/system/dispatch.service
echo -e "\e[32menable the services\e[0m"
systemctl daemon-reload
systemctl enable dispatch
systemctl restart dispatch
