    #Step1
    echo -e "\e[32mInstalling ngnix server\e[0m"
    yum install nginx -y
    echo -e "\e[32mremoving existing content\e[0m"
    rm -rf /usr/share/nginx/html/*
    echo -e "\e[32mDown loadning new version\e[0m"
    curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
    echo -e "\e[32mExtracting the downloaded version\e[0m"
    cd /usr/share/nginx/html
    unzip /tmp/frontend.zip
    echo -e "\e[32mCopying the configuration file\e[0m"
    #Copy a configuration file
    systemctl enable nginx
    systemctl restart nginx


