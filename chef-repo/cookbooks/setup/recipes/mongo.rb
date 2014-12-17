
template "/etc/yum.repos.d/mongodb.repo" do
    action :create
    source "yum.repos.mongodb.repo.erb"
    owner "root"
    group "root"
    mode 0644
end

%w{
  mongodb-org
}.each do |pkg|
    yum_package "#{pkg}" do
    end
end

%w{
  mongod
}.each do |pkg|
    service "#{pkg}" do
        action [ :enable, :start ]
    end
end
