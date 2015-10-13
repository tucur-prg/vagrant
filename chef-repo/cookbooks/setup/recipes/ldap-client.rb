
%w{
  authconfig
  openldap-clients
  nss-pam-ldapd
}.each do |pkg|
  yum_package pkg do
  end
end

bash "initialize" do
  code <<-EOH
    authconfig \
        --enableldap \
        --enableldapauth \
        --ldapserver="ldap://#{node[:ldap][:server_addr]}/" \
        --ldapbasedn="#{node[:ldap][:olc_suffix]}" \
        --enablemkhomedir \
        --update
  EOH
end

template "/etc/ssh/ldap.conf" do
  source "openldap.etc.ssh.conf.erb"
  variables({
    :server_addr => node[:ldap][:server_addr],
    :olc_suffix => node[:ldap][:olc_suffix],
  })
end

template "/etc/pem_ldap.conf" do
  source "openldap.etc.ssh.conf.erb"
  variables({
    :server_addr => node[:ldap][:server_addr],
    :olc_suffix => node[:ldap][:olc_suffix],
  })
end

template "/etc/nslcd.conf" do
  source "openldap.etc.nslcd.conf.erb"
  variables({
    :server_addr => node[:ldap][:server_addr],
    :olc_suffix => node[:ldap][:olc_suffix],
  })
end

template "/etc/openldap/ldap.conf" do
  source "openldap.etc.ldap.conf.erb"
  variables({
    :server_addr => node[:ldap][:server_addr],
    :olc_suffix => node[:ldap][:olc_suffix],
  })
end

service "nslcd" do
  action [ :enable ]
end
