
package = "vault_0.3.1_linux_amd64.zip"

remote_file "/usr/local/src/#{package}" do
  action :create_if_missing
  source "https://releases.hashicorp.com/vault/0.3.1/#{package}"
  notifies :run, "execute[install vault]", :immediately
end

execute "install vault" do
  action :nothing
  cwd "/usr/local/src"
  command <<-EOH
    mkdir -p /opt/vault/bin
    unzip #{package} -d /opt/vault/bin
  EOH
end

directory "/etc/vault.d" do
end

template "/etc/vault.d/server.hcl" do
  source "vault.server.hcl.erb"
end

template "/etc/profile.d/tomcat.sh" do
  source "etc.profile.vault.sh.erb"
end

template "/etc/init.d/vault" do
  source "etc.init.vault.erb"
  mode "0755"
end

service "vault" do
  action [ :enable, :start ]
end
