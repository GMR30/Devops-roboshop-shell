
    echo -e "\e[32mcpying the repofile to yum repos\e[0m"
    cp mongodb.repo  /etc/yum.repos.d/mongodb.repo
    cat /etc/yum.repos.d/mongodb-org-4.repo
    dnf install mongodb-org -y
    systemctl enable mongod
    systemctl restart mongod