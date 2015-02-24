
%w{
  device-mapper-event-libs
}.each do |pkg|
    yum_package "#{pkg}" do
        action :upgrade
    end
end

%w{
  docker-io
}.each do |pkg|
    yum_package "#{pkg}" do
    end
end

%w{
  docker
}.each do |pkg|
    service "#{pkg}" do
        action [ :enable, :start ]
    end
end
