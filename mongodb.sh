    echo -e "\e[32mcpying the repofile to yum repos\e[0m"
    cp /home/centos/Devops-githubrepos/Devops-roboshop-shell/mongodb.repo /etc/yum.repos.d/mongo.repo
    yum install mongodb-org -y
    systemctl enable mongod
    systemctl restart mongod