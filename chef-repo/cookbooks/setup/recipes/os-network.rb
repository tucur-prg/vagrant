
cookbook_file "/etc/sysconfig/network-script/ifcfg-eth0" do
  source "network-script.ifcfg-eth0"
  owner "root"
  group "root"
  mode "0644"
end

service "network" do
  action [ :restart ]
end
