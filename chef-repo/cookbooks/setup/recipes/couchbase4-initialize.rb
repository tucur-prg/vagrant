
bash "cluster-init" do
  code <<-EOH
    /opt/couchbase/bin/couchbase-cli cluster-init \
         -c #{node['couchbase']['first']}:8091 \
         -u #{node['couchbase']['admin']['user']} \
         -p #{node['couchbase']['admin']['password']} \
         --cluster-username=#{node['couchbase']['admin']['user']} \
         --cluster-password=#{node['couchbase']['admin']['password']} \
         --cluster-ramsize=#{node['couchbase']['ramsize']} \
         --cluster-index-ramsize=#{node['couchbase']['index_ramsize']} \
         --services=#{node['couchbase']['services']}
  EOH
end

bash "node-init" do
  code <<-EOH
    /opt/couchbase/bin/couchbase-cli node-init \
         -c #{node['couchbase']['first']}:8091 \
         -u #{node['couchbase']['admin']['user']} \
         -p #{node['couchbase']['admin']['password']} \
         --node-init-data-path=/opt/couchbase/var/lib/couchbase/data \
         --node-init-index-path=/opt/couchbase/var/lib/couchbase/data \
         --node-init-hostname=#{node['couchbase']['first']}
  EOH
end
