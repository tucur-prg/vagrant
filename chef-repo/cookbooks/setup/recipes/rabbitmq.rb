
remote_file "#{Chef::Config[:file_cache_path]}/#{node[:rabbitmq][:package]}" do
  action :create_if_missing
  source node[:rabbitmq][:path] + node[:rabbitmq][:package]
  notifies :install, "rpm_package[install rabbitmq]", :immediately
end

rpm_package "install rabbitmq" do
  action :nothing
  source "#{Chef::Config[:file_cache_path]}/#{node[:rabbitmq][:package]}"
end

execute ".erlang.rabbit" do
  command <<-EOH
    chmod 600 /var/lib/rabbitmq/.erlang.cookie
    echo -n #{node[:rabbitmq][:cookie]} > /var/lib/rabbitmq/.erlang.cookie
    chmod 400 /var/lib/rabbitmq/.erlang.cookie
    chown rabbitmq:rabbitmq /var/lib/rabbitmq/.erlang.cookie
  EOH
end

service "rabbitmq-server" do
  action [ :enable, :start ]
end

execute "rabbitmq_management" do
  only_if { node[:hostname] == node[:rabbitmq][:master] }
  command "rabbitmq-plugins enable rabbitmq_management"
end

execute "add account" do
  only_if { node[:hostname] == node[:rabbitmq][:master] }
  command <<-EOH
    rabbitmqctl add_user #{node[:rabbitmq][:account][:user]} #{node[:rabbitmq][:account][:password]}
    rabbitmqctl set_user_tags #{node[:rabbitmq][:account][:user]} #{node[:rabbitmq][:account][:tags]}
    rabbitmqctl set_permissions #{node[:rabbitmq][:account][:user]} -p #{node[:rabbitmq][:account][:permissions][:path]} "#{node[:rabbitmq][:account][:permissions][:settings]}" "#{node[:rabbitmq][:account][:permissions][:write]}" "#{node[:rabbitmq][:account][:permissions][:read]}"
  EOH
end

execute "rabbitmq_management_agent" do
  not_if { node[:hostname] == node[:rabbitmq][:master] }
  command "rabbitmq-plugins enable rabbitmq_management_agent"
end
