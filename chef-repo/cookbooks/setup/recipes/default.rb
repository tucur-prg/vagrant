
### Software Install #############################

%w{
  epel-release
  wget
  openssl-devel
  sysstat
  bind-utils
  telnet
  gcc
  gcc-c++
  gdb
  yum-priorities
  git
  unzip
}.each do |pkg|
  yum_package "#{pkg}" do
  end
end

### Security Setup ###############################

template "/etc/selinux/config" do
  action :create
  source "selinux.config.erb"
  owner "root"
  group "root"
  mode "0644"
end

execute "selinux" do
  action :run
  command "setenforce 0"
end

### Service Setup ################################

node[:service][:stop].each do |pkg|
  service "#{pkg}" do
    action [ :disable, :stop ]
  end
end

### Initialize ###################################

template "/etc/bashrc" do
  action :create
  source "etc.bashrc.erb"
  owner "root"
  group "root"
  mode "0644"

  variables({
    :namespace => node.setup.namespace,
    :os_name   => node.setup.os_name,
  })
end
