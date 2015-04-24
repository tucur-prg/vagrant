
package = "couchbase-server-community_2.2.0_x86_64"

remote_file "/usr/local/src/#{package}.rpm" do
  source "http://packages.couchbase.com/releases/2.2.0/#{package}.rpm"
end

rpm_package "#{package}" do
  source "/usr/local/src/#{package}.rpm"
end

service "couchbase-server" do
  action [ :enable, :start ]
end
