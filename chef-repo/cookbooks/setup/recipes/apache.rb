
yum_package "httpd" do
    notifies :install, "yum_package[mod_ssl]", :immediately
end

yum_package "mod_ssl" do
    notifies :create, "template[/etc/httpd/conf.d/ssl.conf]", :immediately
    notifies :restart, "service[httpd]"
end

template "/etc/httpd/conf/httpd.conf" do
    source "apache.httpd.conf.erb"
    owner "root"
    group "root"
    mode 0644
end

template "/etc/httpd/conf.d/ssl.conf" do
    action :nothing
    source "apache.ssl.conf.erb"
    owner "root"
    group "root"
    mode 0644
end

%w{
  httpd
}.each do |pkg|
    service "#{pkg}" do
        action [ :enable, :start ]
    end
end
