
package = "couchbase-server-community-3.0.1-centos6.x86_64"

template '/etc/yum.repos.d/couchbase.repo' do
  source 'yum.repo.couchbase.repo.erb'
end

remote_file "/usr/local/src/#{package}.rpm" do
  source "http://packages.couchbase.com/releases/3.0.1/#{package}.rpm"
end

rpm_package "#{package}" do
  source "/usr/local/src/#{package}.rpm"
end

service "couchbase-server" do
  action [ :enable, :start ]
end

# 起動が終わるまで待機する
execute "sleep" do
  command "sleep 30s"
end
