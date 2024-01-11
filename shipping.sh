echo -e "\e[32mInsatll the Maven\e[0m"
dnf install maven -y
echo -e "\e[32mRoboshop useradd\e[0m"
useradd roboshop
echo -e "\e[32mCreating app folder\e[0m"
mkdir /app
echo -e "\e[32mDownload the shipping file \e[0m"
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip
echo -e "\e[32mchanging the dir\e[0m"
cd /app
echo -e "\e[32munzip the shipping file\e[0m"
unzip /tmp/shipping.zip
echo -e "\e[32mCleaning the package\e[0m"
mvn clean package
echo -e "\e[32mMoving the jar file\e[0m"
mv target/shipping-1.0.jar shipping.jar
echo -e "\e[32mCopying the shipping service\e[0m"
cp /root/Devops-roboshop-shell/shipping.service   /etc/systemd/system/shipping.service

echo -e "\e[32mInstall the mysql\e[0m"
dnf install mysql -y
echo -e "\e[32mgetting the passwd from shipping \e[0m"
mysql -h mysql-dev.gmracademy.in.net -uroot -pRoboShop@1 < /app/schema/shipping.sql
echo -e "\e[32mstating the services\e[0m"
systemctl daemon-reload
systemctl enable shipping
systemctl restart shipping
