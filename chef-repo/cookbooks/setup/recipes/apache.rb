
yum_package "httpd" do
  notifies :install, "yum_package[mod_ssl]", :immediately
end

yum_package "httpd-devel" do
end

yum_package "mod_ssl" do
  notifies :create, "template[/etc/httpd/conf.d/ssl.conf]", :immediately
  notifies :restart, "service[httpd]"
end

template "/etc/httpd/conf/httpd.conf" do
  source "apache.httpd.conf.erb"
end

template "/etc/httpd/conf.d/ssl.conf" do
  action :nothing
  source "apache.ssl.conf.erb"
end

service "httpd" do
  action [ :enable, :start ]
end
