
yum_package "munin-node" do
  options '--enablerepo=epel'
end

template "/etc/munin/munin-node.conf" do
  source "munin.munin-node.conf.erb"
  variables({
    :host_name => node[:munin][:node][:host_name],
    :allow => node[:munin][:node][:allow],
  })
end

service "munin-node" do
  action [ :enable, :start ]
end
