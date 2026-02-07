#/bin/bash

source ./common.sh

check_root

cp $Path/mongodb.repo /etc/yum.repos.d/mongo.repo
validate $? "mongodb repo file copy"

dnf install mongodb-org -y | &>>$log_file
validate $? "mongodb-server"

systemctl enable mongod 
validate $? "mongodb service enable and start"

systemctl status mongod | &>>$log_file
validate $? "mongodb service status check"

systemctl start mongod
validate $? "mongodb service start"

echo -e "$G MongoDB installation and setup completed successfully. $NC" | tee -a $log_file

sed -i 's/bindIp: 127.0.0.1/bindIp: 0.0.0.0/g' /etc/mongod.conf

systemctl restart mongod    
validate $? "mongodb service restart after config change"

