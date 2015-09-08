
bash "server-add" do
  code <<-EOH
    /opt/couchbase/bin/couchbase-cli server-add -c #{node['couchbase']['first']}:8091 \
         --user=#{node['couchbase']['admin']['user']} \
         --password=#{node['couchbase']['admin']['password']} \
         --server-add=#{node['couchbase']['node']}
  EOH
end

bash "rebalance" do
  code <<-EOH
    /opt/couchbase/bin/couchbase-cli rebalance -c #{node['couchbase']['first']}:8091 \
         --user=#{node['couchbase']['admin']['user']} \
         --password=#{node['couchbase']['admin']['password']}
  EOH
end
