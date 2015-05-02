
cookbook_file "/usr/local/src/aerospike-server-community-3.5.3-el6.tgz" do
  action :create_if_missing
  source "aerospike-server-community-3.5.3-el6.tgz"
  mode "0777"
end

bash "install aerospike" do
  not_if "rpm -qa | grep -q '^aerospike-server-community'"
  code <<-EOH
    cd /usr/local/src/
    tar xzf aerospike-server-community-3.5.3-el6.tgz
    cd aerospike-server-community-3.5.3-el6
    ./asinstall
  EOH
end

%w{
  aerospike
}.each do |pkg|
  service "#{pkg}" do
    action [ :enable, :start ]
  end
end
