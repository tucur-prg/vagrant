
execute "join cluster" do
  command <<-EOH
    rabbitmqctl stop_app
    rabbitmqctl reset
    rabbitmqctl join_cluster rabbit@#{node[:rabbitmq][:master]}
    rabbitmqctl start_app
  EOH
end
