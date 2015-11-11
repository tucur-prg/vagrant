
bash "server-add" do
  code <<-EOH
    /opt/couchbase/bin/couchbase-cli server-add \
         -c #{node['couchbase']['first']}:8091 \
         -u #{node['couchbase']['admin']['user']} \
         -p #{node['couchbase']['admin']['password']} \
         --server-add=#{node['couchbase']['node']} \
         --server-add-username=#{node['couchbase']['admin']['user']} \
         --server-add-password=#{node['couchbase']['admin']['password']} \
         --services=#{node['couchbase']['services']}
  EOH
end

bash "rebalance" do
  code <<-EOH
    /opt/couchbase/bin/couchbase-cli rebalance \
         -c #{node['couchbase']['first']}:8091 \
         -u #{node['couchbase']['admin']['user']} \
         -p #{node['couchbase']['admin']['password']}
  EOH
end
