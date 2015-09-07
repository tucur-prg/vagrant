
remote_file "#{Chef::Config[:file_cache_path]}/#{node[:java][:maven][:package]}" do
  source "http://ftp.jaist.ac.jp/pub/apache/maven/maven-3/#{node[:java][:maven][:version]}/binaries/#{node[:java][:maven][:package]}"
  notifies :run, "execute[install maven]", :immediately
end

execute "install maven" do
  action :nothing
  command "tar zxf #{Chef::Config[:file_cache_path]}/#{node[:java][:maven][:package]} -C /opt"
end

template "/etc/profile.d/mvn.sh" do
  source "etc.profile.mvn.sh.erb"
  variables({
    :maven_home => "/opt/apache-maven-#{node[:java][:maven][:version]}"
  })
end
