
remote_file "#{Chef::Config[:file_cache_path]}/zabbix-release-2.4-1.el6.noarch.rpm" do
    source "http://repo.zabbix.com/zabbix/2.4/rhel/6/x86_64/zabbix-release-2.4-1.el6.noarch.rpm"
    not_if "rpm -qa | grep -q '^zabbix-release'"
    action :create
    notifies :install, "rpm_package[zabbix-release]", :immediately
end

rpm_package "zabbix-release" do
    source "#{Chef::Config[:file_cache_path]}/zabbix-release-2.4-1.el6.noarch.rpm"
    action :nothing
end

%w{
    zabbix-agent
}.each do |pkg|
    yum_package "#{pkg}" do
      options '--enablerepo=zabbix'
    end
end

%w{
    zabbix-agent
}.each do |pkg|
    service "#{pkg}" do
        action [ :enable, :start ]
    end
end
