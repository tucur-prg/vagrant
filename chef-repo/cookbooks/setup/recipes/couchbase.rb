
template '/etc/yum.repos.d/couchbase.repo' do
  source 'yum.repo.couchbase.repo.erb'
end

remote_file "/usr/local/src/#{node[:couchbase][:package]}.rpm" do
  source "#{node[:couchbase][:path]}#{node[:couchbase][:package]}.rpm"
end

rpm_package "#{node[:couchbase][:package]}" do
  source "/usr/local/src/#{node[:couchbase][:package]}.rpm"
end

service "couchbase-server" do
  action [ :enable, :start ]
end

# 起動が終わるまで待機する
execute "sleep" do
  command "sleep 30s"
end
