
%w{
  openldap-servers
  openldap-clients
}.each do |pkg|
  yum_package pkg do
  end
end

bash "initialize" do
  not_if "test -f /var/lib/ldap/DB_CONFIG"
  code "rm -fr /var/lib/ldap/*"
end

template "/var/lib/ldap/DB_CONFIG" do
  source "openldap.DB_CONFIG.erb"
  owner "ldap"
  group "ldap"
end

template "/etc/openldap/slapd.conf" do
  source "openldap.slapd.conf.erb"
  variables({
    :olc_root_dn => node[:ldap][:olc_root_dn],
    :olc_suffix => node[:ldap][:olc_suffix],
    :password => node[:ldap][:password],
  })
end

bash "initialize slapd" do
  # slaptest が exit 0 で recipe の実行が止まってしまうので || を使い失敗時にコマンドを継続し別の正常コマンドを chef に認識させている
  code <<-EOH
    rm -fr /etc/openldap/slapd.d/*
    sudo -u ldap slaptest -f /etc/openldap/slapd.conf -F /etc/openldap/slapd.d || echo ERR_SKIP
  EOH
end

directory "/var/log/ldap" do
end

service "rsyslog" do
  supports :restart => true
end

template "/etc/rsyslog.d/ldap.conf" do
  source "openldap.rsyslog.ldap.conf.erb"
  notifies :restart, 'service[rsyslog]'
end

service "slapd" do
  action [ :enable, :start ]
end
