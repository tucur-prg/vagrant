

execute "install td-agent" do
  not_if "rpm -qa | grep -q '^td-agent'"
  command "curl -L http://toolbelt.treasure-data.com/sh/install-redhat-td-agent2.sh | sh"
end

service "td-agent" do
  action [ :enable, :start ]
end
