
directory "/home/vagrant/java" do
  action :create_if_missing
  owner "vagrant"
  group "vagrant"
end

cookbook_file "/home/vagrant/java/Dockerfile" do
  source "java7.Dockerfile"
  owner "vagrant"
  group "vagrant"
end
