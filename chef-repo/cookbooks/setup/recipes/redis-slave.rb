
template "/etc/redis.conf" do
  source "redis.slave.conf.erb"
  variables({
    :masterip => node[:redis][:slave][:masterip],
  })
end

service "redis" do
  action [ :restart ]
end
