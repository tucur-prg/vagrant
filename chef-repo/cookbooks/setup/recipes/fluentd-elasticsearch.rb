
include_recipe "setup::fluentd"

yum_package "libcurl-devel" do
end

bash "plugin install" do
  code "td-agent-gem install fluent-plugin-elasticsearch"
end
