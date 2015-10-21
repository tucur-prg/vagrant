
include_recipe "setup::java"

version = "elasticsearch-1.7.3"

remote_file "#{Chef::Config[:file_cache_path]}/#{version}.noarch.rpm" do
  action :create_if_missing
  source "https://download.elastic.co/elasticsearch/elasticsearch/#{version}.noarch.rpm"
  not_if "rpm -qa | grep -q '^elasticsearch'"
  notifies :install, "rpm_package[elasticsearch]", :immediately
end

rpm_package "elasticsearch" do
  action :nothing
  source "#{Chef::Config[:file_cache_path]}/#{version}.noarch.rpm"
end

service "elasticsearch" do
  action [ :enable, :start ]
end
