
remote_file "#{Chef::Config[:file_cache_path]}/#{node[:java][:jdk][:package]}" do
  action :create_if_missing
  source node[:java][:jdk][:path] + node[:java][:jdk][:package]
  headers 'Cookie' => 'oraclelicense=accept-securebackup-cookie'
end

rpm_package "install java8" do
  not_if "rpm -qa | grep -q '^jdk1.8'"
  source "#{Chef::Config[:file_cache_path]}/#{node[:java][:jdk][:package]}"
end

template "/etc/profile.d/java.sh" do
  source "etc.profile.java.sh.erb"
  owner "root"
  group "root"
  mode "0644"
  variables({
    :java_home => node[:java][:home],
  })
end
