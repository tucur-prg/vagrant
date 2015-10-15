
directory "/etc/openldap/ldif" do
end

template "/etc/openldap/ldif/base.ldif" do
  source "openldap.base.ldif.erb"
  variables({
    :olc_root_dn => node[:ldap][:olc_root_dn],
    :olc_suffix => node[:ldap][:olc_suffix],
    :olc_people_ou => node[:ldap][:olc_people_ou],
  })
  notifies :run, "bash[ldapadd base]"
end

bash "ldapadd base" do
  action :nothing
  code "ldapadd -x -D \"#{node[:ldap][:olc_root_dn]}\" -f /etc/openldap/ldif/base.ldif -w #{node[:ldap][:raw_password]}"
end

template "/etc/openldap/ldif/group.ldif" do
  source "openldap.group.ldif.erb"
  variables({
    :olc_suffix => node[:ldap][:olc_suffix],
  })
  notifies :run, "bash[ldapadd group]"
end

bash "ldapadd group" do
  action :nothing
  code "ldapadd -x -D \"#{node[:ldap][:olc_root_dn]}\" -f /etc/openldap/ldif/group.ldif -w #{node[:ldap][:raw_password]}"
end

template "/etc/openldap/ldif/user.ldif" do
  source "openldap.user.ldif.erb"
  variables({
    :olc_people_ou => node[:ldap][:olc_people_ou],
    :password => node[:ldap][:password],
  })
  notifies :run, "bash[ldapadd user]"
end

bash "ldapadd user" do
  action :nothing
  code "ldapadd -x -D \"#{node[:ldap][:olc_root_dn]}\" -f /etc/openldap/ldif/user.ldif -w #{node[:ldap][:raw_password]}"
end
