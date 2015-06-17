
agentNode = 'agent'

execute "install td-agent" do
  not_if "rpm -qa | grep -q '^td-agent'"
  command "curl -L http://toolbelt.treasure-data.com/sh/install-redhat.sh | sh"
end

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
  action [ :enable, :start ]
end
