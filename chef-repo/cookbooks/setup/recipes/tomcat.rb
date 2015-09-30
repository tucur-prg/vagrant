
remote_file "#{Chef::Config[:file_cache_path]}/#{node[:java][:tomcat][:package]}" do
  action :create_if_missing
  source "http://ftp.jaist.ac.jp/pub/apache/tomcat/tomcat-8/v#{node[:java][:tomcat][:version]}/bin/#{node[:java][:tomcat][:package]}"
  notifies :run, "execute[install tomcat]", :immediately
end

execute "install tomcat" do
  action :nothing
  command <<-EOH
    tar zxf #{Chef::Config[:file_cache_path]}/#{node[:java][:tomcat][:package]} -C /opt
    chown -R nobody:nobody /opt/apache-tomcat-#{node[:java][:tomcat][:version]}/conf
    chown -R nobody:nobody /opt/apache-tomcat-#{node[:java][:tomcat][:version]}/logs
    chown -R nobody:nobody /opt/apache-tomcat-#{node[:java][:tomcat][:version]}/webapps
    chown -R nobody:nobody /opt/apache-tomcat-#{node[:java][:tomcat][:version]}/work
  EOH
end

link "/opt/tomcat" do
  only_if { File.exists?("/opt/apache-tomcat-#{node[:java][:tomcat][:version]}") }
  to "/opt/apache-tomcat-#{node[:java][:tomcat][:version]}"
end

remote_file "/opt/tomcat/lib/mysql-connector-java-5.1.36.jar" do
  source "http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.36/mysql-connector-java-5.1.36.jar"
end

template "/etc/profile.d/tomcat.sh" do
  source "etc.profile.tomcat.sh.erb"
  owner "root"
  group "root"
  mode "0644"
  variables({
    :tomcat_home => "/opt/apache-tomcat-#{node[:java][:tomcat][:version]}",
    :tomcat_opts => node[:java][:tomcat][:opts],
  })
end

template "/etc/init.d/tomcat" do
  source "etc.init.tomcat.erb"
  mode "0755"
  variables({
    :java_home => node[:java][:home],
    :tomcat_home => "/opt/apache-tomcat-#{node[:java][:tomcat][:version]}"
  })
end

service "tomcat" do
  action [ :enable, :start ]
end
