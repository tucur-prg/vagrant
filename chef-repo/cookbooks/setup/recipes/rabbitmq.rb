
remote_file "#{Chef::Config[:file_cache_path]}/#{node[:rabbitmq][:package]}" do
  action :create_if_missing
  source node[:rabbitmq][:path] + node[:rabbitmq][:package]
  notifies :install, "rpm_package[install rabbitmq]", :immediately
end

rpm_package "install rabbitmq" do
  action :nothing
  source "#{Chef::Config[:file_cache_path]}/#{node[:rabbitmq][:package]}"
end

service "rabbitmq-server" do
  action [ :enable, :start ]
end
