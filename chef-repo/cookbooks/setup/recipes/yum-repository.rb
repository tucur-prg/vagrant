
yum_package "createrepo" do
end

%w{
  /var/www/html/yum/i386
  /var/www/html/yum/x86_64
  /var/www/html/yum/SRPMS
  /var/www/html/yum/rpm
  /var/www/html/yum/extra
}.each do |dir|
  directory "#{dir}" do
    recursive true
  end
end

templates "/etc/httpd/conf.d/vhost.conf" do
  source "apache.vhost.conf.erb"
  owner "root"
  group "root"
  mode 0644
  variables({
      :hostname      => "yum.vb.ns.com",
      :document_root => "/var/www/html"
  })
  notifies :restart, "service[httpd]"
end

service "httpd" do
  supports :restart => true
  action :nothing
end
