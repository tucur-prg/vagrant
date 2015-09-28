
repo_package = "http://repo.rundeck.org/latest.rpm"

execute "rundeck repo install" do
  not_if "rpm -qa | grep -q '^rundeck-repo'"
  command "rpm -Uvh #{repo_package}"
end

yum_package "rundeck" do
  options "--enablerepo=rundeck-release-bintray"
end

template "/etc/rundeck/framework.properties" do
  source "rundeck.framework.properties.erb"
  variables({
    :hostname => node[:rundeck][:hostname],
    :port => node[:rundeck][:port],
    :username => node[:rundeck][:adminuser][:username],
    :password => node[:rundeck][:adminuser][:password],
  })
end

template "/etc/rundeck/rundeck-config.properties" do
  source "rundeck.rundeck-config.properties.erb"
  variables({
    :hostname => node[:rundeck][:hostname],
    :port => node[:rundeck][:port],
  })
end

service "rundeckd" do
  action [ :enable, :start ]
end
