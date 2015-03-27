
service "mysql" do
  supports :restart => true
  if node[:hostname] == "mariadb1"
    start_command "service mysql start --wsrep_cluster_address=gcomm://"
    restart_command "service mysql restart --wsrep_cluster_address=gcomm://"
  end
end

%w{
  galera
  MariaDB-Galera-server
}.each do |pkg|
  yum_package "#{pkg}" do
  end
end

template "/etc/my.cnf.d/galera.cnf" do
  source "mariadb.galera.cnf.erb"
  variables({
    :clusterAddress => node[:mariadb][:clusterAddress],
    :nodeAddress => node[:mariadb][:nodeAddress]
  })
  notifies :restart, "service[mysql]"
end
