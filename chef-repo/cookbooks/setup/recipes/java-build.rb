
# build gradle
execute "gvm install" do
  command <<-EOH
    su #{node[:java][:build_user]} -l -c 'curl -s get.gvmtool.net | bash'
  EOH
end

bash "gvm shell" do
  user "#{node[:java][:build_user]}"
  code <<-EOC
    source "/home/#{node[:java][:build_user]}/.gvm/bin/gvm-init.sh"
  EOC
end

execute "Groovy install" do
  command <<-EOH
    su #{node[:java][:build_user]} -l -c 'gvm install groovy'
    su #{node[:java][:build_user]} -l -c 'groovy -v'
  EOH
end

execute "Gradle install" do
  command <<-EOH
    su #{node[:java][:build_user]} -l -c 'gvm install gradle'
    su #{node[:java][:build_user]} -l -c 'gradle -v'
  EOH
end

# build maven
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
