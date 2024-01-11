echo -e "\e[32mInstall python36\e[0m"
dnf install python36 gcc python3-devel -y
echo -e "\e[32mAdding roboshop user\e[0m"
useradd roboshop
echo -e "\e[32mcreating app folder\e[0m"
rm -rf /app
mkdir /app
echo -e "\e[32mDownloadning payment zip file\e[0m"
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip
echo -e "\e[32mChaning the dir\e[0m"
cd /app
echo -e "\e[32mUnzip the file\e[0m"
unzip /tmp/payment.zip
cd /app
echo -e "\e[32mInstalling the pip3\e[0m"
pip3.6 install -r requirements.txt
echo -e "\e[32mCopying the service file\e[0m"
cp /root/Devops-roboshop-shell/payment.service  /etc/systemd/system/payment.service
echo -e "\e[32mTo reload the service\e[0m"
systemctl daemon-reload
systemctl enable payment
systemctl restart payment
