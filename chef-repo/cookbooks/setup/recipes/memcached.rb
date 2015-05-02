
yum_package "memcached" do
end

%w{
    memcached
}.each do |pkg|
  service "#{pkg}" do
    action [ :enable, :start ]
  end
end
