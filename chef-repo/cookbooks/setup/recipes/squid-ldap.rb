
yum_package "squid" do
end

template "/etc/squid/squid.conf" do
  source "etc.ldap.squid.conf.erb"
  variables({
    :olc_people_ou => node[:ldap][:olc_people_ou],
    :server_addr => node[:ldap][:server_addr],
  })
end

service "squid" do
  action [ :enable, :start ]
end
