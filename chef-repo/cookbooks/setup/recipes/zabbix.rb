
## Include
include_recipe "setup::mysql"

## Settings
remote_file "#{Chef::Config[:file_cache_path]}/zabbix-release-2.4-1.el6.noarch.rpm" do
  action :create_if_missing
  source "http://repo.zabbix.com/zabbix/2.4/rhel/6/x86_64/zabbix-release-2.4-1.el6.noarch.rpm"
  not_if "rpm -qa | grep -q '^zabbix-release'"
  notifies :install, "rpm_package[zabbix-release]", :immediately
end

rpm_package "zabbix-release" do
  source "#{Chef::Config[:file_cache_path]}/zabbix-release-2.4-1.el6.noarch.rpm"
  action :nothing
end

%w{
  zabbix-server-mysql
  zabbix-web-mysql
  zabbix-web-japanese
  zabbix-get
}.each do |pkg|
  yum_package "#{pkg}" do
    options '--enablerepo=zabbix'
  end
end

template "/etc/zabbix/zabbix_server.conf" do
  action :create
  source "zabbix.zabbix_server.conf.erb"
  owner "root"
  group "root"
  mode "0640"

  variables({
    :password => node['zabbix']['password'],
  })
end

template "/etc/zabbix/web/zabbix.conf.php" do
  action :create
  source "zabbix.web.zabbix.conf.php.erb"
  owner "apache"
  group "apache"
  mode "0640"
end

directory "/etc/zabbix/zabbix_server.conf.d" do
end

template "/usr/share/doc/zabbix-server-mysql-#{node['zabbix']['version']}/create/setup.sql" do
  action :create_if_missing
  source "zabbix.setup.sql.erb"
  owner "root"
  group "root"
  mode "0644"

  variables({
    :password => node['zabbix']['password'],
  })

  notifies :run, "execute[zabbix-setup]", :immediately
end

## PHP Settings

template "/etc/php.d/php-settings.ini" do
  source "php.php-settings.ini.erb"
  owner "root"
  group "root"
  mode "0644"
end

## Apache Settings

template "/etc/httpd/conf/httpd.conf" do
  source "apache.httpd.conf.erb"
  owner "root"
  group "root"
  mode "0644"
end

## MySQL Setup

execute "zabbix-setup" do
  action :nothing
  command "/usr/bin/mysql -u root < /usr/share/doc/zabbix-server-mysql-#{node['zabbix']['version']}/create/setup.sql"

  notifies :run, "execute[zabbix-create-schema]", :immediately
  notifies :run, "execute[zabbix-insert-images]", :immediately
  notifies :run, "execute[zabbix-insert-data]", :immediately
end

execute "zabbix-create-schema" do
  action :nothing
  command "/usr/bin/mysql -u root zabbix < /usr/share/doc/zabbix-server-mysql-#{node['zabbix']['version']}/create/schema.sql"
end

execute "zabbix-insert-images" do
  action :nothing
  command "/usr/bin/mysql -u root zabbix < /usr/share/doc/zabbix-server-mysql-#{node['zabbix']['version']}/create/images.sql"
end

execute "zabbix-insert-data" do
  action :nothing
  command "/usr/bin/mysql -u root zabbix < /usr/share/doc/zabbix-server-mysql-#{node['zabbix']['version']}/create/data.sql"
end

## Service

%w{
  zabbix-server
  httpd
}.each do |pkg|
  service "#{pkg}" do
    action [ :enable, :start ]
  end
end
