
yum_package "httpd" do
    notifies :install, "yum_package[mod_ssl]", :immediately
end

yum_package "mod_ssl" do
    notifies :restart, "service[httpd]"
end

%w{
  httpd
}.each do |pkg|
    service "#{pkg}" do
        action [ :enable, :start ]
    end
end

