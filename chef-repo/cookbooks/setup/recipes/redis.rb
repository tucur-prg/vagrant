
remote_file "#{Chef::Config[:file_cache_path]}/remi-release-6.rpm" do
  action :create_if_missing
  source "http://rpms.famillecollet.com/enterprise/remi-release-6.rpm"
  not_if "rpm -qa | grep -q '^remi-release'"
  notifies :install, "rpm_package[remi-release]", :immediately
end

rpm_package "remi-release" do
  action :nothing
  source "#{Chef::Config[:file_cache_path]}/remi-release-6.rpm"
end

# epel の場合 2.4.10 の為 sentinel が使えなかった
yum_package "redis" do
  options "--enablerepo=remi"
end

template "/etc/redis.conf" do
  source "redis.redis.conf.erb"
end

service "redis" do
  action [ :enable, :start ]
end
