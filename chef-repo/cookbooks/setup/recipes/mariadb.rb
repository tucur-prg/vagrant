
execute "rpg-gpg-key" do
  command "rpm --import https://yum.mariadb.org/RPM-GPG-KEY-MariaDB"
end

cookbook_file "/etc/yum.repos.d/MariaDB.repo" do
    action :create_if_missing
    source "yum.repo.MariaDB.repo"
    owner "root"
    group "root"
    mode 0644
end

%w{
  MariaDB-server
  MariaDB-client
}.each do |pkg|
  yum_package "#{pkg}" do
  end
end

template "/etc/my.cnf.d/server.cnf" do
  source "mariadb.server.cnf.erb"
end

template "/etc/my.cnf.d/handlersocket.cnf" do
  source "mariadb.handlersocket.cnf.erb"
  notifies :restart, "service[mysql]"
end

service "mysql" do
  supports :restart => true
  action [ :enable, :start ]
end
