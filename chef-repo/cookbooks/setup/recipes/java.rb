
remote_file "#{Chef::Config[:file_cache_path]}/jdk-8u25-linux-x64.rpm" do
  action :create_if_missing
  source "http://download.oracle.com/otn-pub/java/jdk/8u25-b17/jdk-8u25-linux-x64.rpm"
  headers 'Cookie' => 'oraclelicense=accept-securebackup-cookie'
end

rpm_package "install java8" do
  not_if "rpm -qa | grep -q '^jdk1.8'"
  source "#{Chef::Config[:file_cache_path]}/jdk-8u25-linux-x64.rpm"
end

template "/etc/profile.d/java.sh" do
  source "etc.profile.java.sh.erb"
  owner "root"
  group "root"
  mode "0644"
end
