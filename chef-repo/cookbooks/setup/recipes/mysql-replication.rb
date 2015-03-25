
masterNode = "master"

service "mysqld" do
  supports :restart => true
end

execute "add replication user" do
  only_if { node[:hostname] == masterNode }
  command %(mysql -u root -e 'GRANT REPLICATION SLAVE ON *.* TO `replica`@`10.10.20.0/255.255.255.0` IDENTIFIED BY "replica"')
end

template "/etc/my.cnf" do
  action :create
  source "my.cnf.replication.erb"

  owner "root"
  group "root"
  mode 0644

  variables({
    :masterNode => masterNode,
    :serverId => node[:mysql][:serverId]
  })
  notifies :restart, "service[mysqld]", :immediately
end

execute "slave replication" do
  not_if { node[:hostname] == masterNode }
  command %(mysql -u root -e 'CHANGE MASTER TO MASTER_HOST="10.10.20.12", MASTER_USER="replica", MASTER_PASSWORD="replica", MASTER_LOG_FILE="", MASTER_LOG_POS=4')
end

execute "replication start" do
  not_if { node[:hostname] == masterNode }
  command %(mysql -u root -e 'START SLAVE')
end
