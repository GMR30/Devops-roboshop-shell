echo -e "\e[32mConfiguring the YUM repositories\e[0m"
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash
echo -e "\e[3232mConfiguring the RabbitMq repositories\e[0m"
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash
echo -e "\e[32mInstalling the rabbitMq server\e[0m"
dnf install rabbitmq-server -y
echo -e "\e[32mEnabled the services\e[0m"
systemctl enable rabbitmq-server
systemctl start rabbitmq-server
echo -e "\e[32mAdding the roboshop user\e[0m"
rabbitmqctl add_user roboshop roboshop123
echo -e "\e[32mSet the set_permissions\e[0m"
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"
