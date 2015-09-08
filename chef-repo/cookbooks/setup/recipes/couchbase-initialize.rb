
bash "cluster-init" do
  code <<-EOH
    /opt/couchbase/bin/couchbase-cli cluster-init -c #{node['couchbase']['first']}:8091 \
         --user=#{node['couchbase']['admin']['user']} \
         --password=#{node['couchbase']['admin']['password']} \
         --cluster-init-username=#{node['couchbase']['admin']['user']} \
         --cluster-init-password=#{node['couchbase']['admin']['password']} \
         --cluster-init-ramsize=#{node['couchbase']['ramsize']}
  EOH
end

bash "node-init" do
  code <<-EOH
    /opt/couchbase/bin/couchbase-cli node-init -c #{node['couchbase']['first']}:8091 \
         --user=#{node['couchbase']['admin']['user']} \
         --password=#{node['couchbase']['admin']['password']} \
         --node-init-data-path=/opt/couchbase/var/lib/couchbase/data \
         --node-init-index-path=/opt/couchbase/var/lib/couchbase/data \
         --node-init-hostname=#{node['couchbase']['first']}
  EOH
end
