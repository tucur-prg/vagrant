
yum_package "redis" do
end

%w{
  redis
}.each do |pkg|
  service "#{pkg}" do
    action [ :enable, :start ]
  end
end
