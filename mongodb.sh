    echo -e "\e[32mCopying the mongo repo file to the path\e[0m"
    cp mongo.repo /etc/yum.repos.d/mongo.repo
    echo -e "\e[32mInstalling the mongo server\e[0m"
    yum install mongodb-org -y
    ## Modify the configuration file /etc/mongod.conf
    echo -e "\e[32menabling the service\e[0m"
    systemctl enable mongod
    systemctl restart mongod