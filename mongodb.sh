    echo -e "\e[32mcpying the repofile to yum repos\e[0m"
    cp /root/Devops-roboshop-shell/mongo.repo /etc/yum.repos.d/mongo.repo
    yum install mongodb-org -y
    systemctl enable mongod
    systemctl restart mongod