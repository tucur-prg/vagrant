
agentNode = 'agent'

template "/etc/td-agent/td-agent.conf" do
  only_if { node[:hostname] == agentNode }
  source "fluentd.agent.td-agent.conf.erb"
  variables({
    :collector_addr => node['fluentd']['collector']['address']
  })
end

template "/etc/td-agent/td-agent.conf" do
  not_if { node[:hostname] == agentNode }
  source "fluentd.collector.td-agent.conf.erb"
end

service "td-agent" do
  supports :restart
  action [ :restart ]
end
