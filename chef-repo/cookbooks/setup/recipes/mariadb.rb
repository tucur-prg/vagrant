
cookbook_file "/etc/yum.repos.d/MariaDB.repo" do
    action :create_if_missing
    source "yum.repo.MariaDB.repo"
    owner "root"
    group "root"
    mode 0644
end

%w{
  MariaDB-server
  MariaDB-client
}.each do |pkg|
  yum_package "#{pkg}" do
  end
end

service "mysql" do
  action [ :enable, :start ]
end
