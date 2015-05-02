
cookbook_file "/home/vagrant/.ssh/id_rsa" do
  source "id_rsa"
  owner "vagrant"
  group "vagrant"
  mode "0600"
end

cookbook_file "/home/vagrant/.ssh/id_rsa.pub" do
  source "id_rsa.pub"
  owner "vagrant"
  group "vagrant"
  mode "0644"
end
