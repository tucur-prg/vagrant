
cookbook_file "/etc/yum.repos.d/typesafe.repo" do
  action :create_if_missing
  source "yum.repo.typesafe.repo"
  owner "root"
  group "root"
  mode "0644"
end

%w{
  java-1.7.0-openjdk
  typesafe-stack
}.each do |pkg|
  yum_package "#{pkg}" do
  end
end
