
remote_file "#{Chef::Config[:file_cache_path]}/mysql-community-release-el6-5.noarch.rpm" do
  source "http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm"
  not_if "rpm -qa | grep -q '^mysql-community-release'"
  action :create
  notifies :install, "rpm_package[mysql-community-release]", :immediately
end

rpm_package "mysql-community-release" do
  source "#{Chef::Config[:file_cache_path]}/mysql-community-release-el6-5.noarch.rpm"
  action :nothing
end

%w{
  mysql
  mysql-devel
  mysql-server
  mysql-utilities
}.each do |pkg|
  yum_package "#{pkg}" do
    options '--enablerepo=mysql-tools-community'
  end
end

%w{
  mysqld
}.each do |pkg|
  service "#{pkg}" do
    action [ :enable, :start ]
  end
end
