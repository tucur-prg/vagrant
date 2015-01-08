
remote_file "#{Chef::Config[:file_cache_path]}/nginx-release-centos-6-0.el6.ngx.noarch.rpm" do
    action :create
    source "http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm"
    not_if "rpm -qa | grep -q '^nginx-release'"
    notifies :install, "rpm_package[nginx-release]", :immediately
end

rpm_package "nginx-release" do
    action :nothing
    source "#{Chef::Config[:file_cache_path]}/nginx-release-centos-6-0.el6.ngx.noarch.rpm"
end

yum_package "nginx" do
end

%w{
  nginx
}.each do |pkg|
    service "#{pkg}" do
        action [ :enable, :start ]
    end
end
