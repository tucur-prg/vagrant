
package = "couchbase-server-community_2.2.0_x86_64"

template '/etc/yum.repos.d/couchbase.repo' do
  source 'yum.repo.couchbase.repo.erb'
end

remote_file "/usr/local/src/#{package}.rpm" do
  source "http://packages.couchbase.com/releases/2.2.0/#{package}.rpm"
end

rpm_package "#{package}" do
  source "/usr/local/src/#{package}.rpm"
end

service "couchbase-server" do
  only_if { node[:hostname] == "cluster" }
  action [ :enable, :start ]
end
