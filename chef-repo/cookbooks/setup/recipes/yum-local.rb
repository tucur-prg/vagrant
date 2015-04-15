
cookbook_file "/etc/yum.repos.d/local.repo" do
  action :create_if_missing
  source "yum.repo.local.repo"
  owner "root"
  group "root"
  mode "0644"
end
