
yum_package "munin" do
  options '--enablerepo=epel'
end

template "/etc/munin/munin.conf" do
  source "munin.munin.conf.erb"
end

template "/etc/munin/conf.d/nodes.conf" do
  source "munin.nodes.conf.erb"
  variables({
    :nodes => node[:munin][:nodes]
  })
end

execute "permission" do
  command "chmod 777 /var/log/munin"
end
