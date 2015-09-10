
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

yum_package "zabbix-java-gateway" do
  options '--enablerepo=zabbix'
end

template "/etc/zabbix/zabbix_server.conf.d/java_gateway.conf" do
  action :create
  source "zabbix.zabbix_server.java_gateway.conf.erb"
  owner "root"
  group "root"
  mode "0640"
end

service "zabbix-java-gateway" do
  action [ :enable, :start ]
end
