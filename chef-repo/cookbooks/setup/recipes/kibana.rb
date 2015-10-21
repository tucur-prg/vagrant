
package = "kibana-4.0.1-linux-x64.tar.gz"

remote_file "/usr/local/src/#{package}" do
  action :create_if_missing
  source "https://download.elastic.co/kibana/kibana/#{package}"
  notifies :run, "bash[kibana]"
end

bash "kibana" do
  action :nothing
  code "tar zxf /usr/local/src/#{package} -C /opt"
end
