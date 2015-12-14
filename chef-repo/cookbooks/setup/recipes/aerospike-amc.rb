
include_recipe "setup::python"

%w{
  markupsafe
  paramiko
  ecdsa
  pycrypto
}.each do |pkg|
  execute "pip install #{pkg}" do
    command "pip install #{pkg}"
  end
end

package = "http://www.aerospike.com/download/amc/3.6.4/artifact/el6"

remote_file "/usr/local/src/aerospike-amc-community-3.6.4-el6.x86_64.rpm" do
  action :create_if_missing
  source package
end

rpm_package "install amc" do
  not_if "rpm -qa | grep aerospike-amc-community"
  source "/usr/local/src/aerospike-amc-community-3.6.4-el6.x86_64.rpm"
end

service "amc" do
  action [ :enable, :start ]
end
