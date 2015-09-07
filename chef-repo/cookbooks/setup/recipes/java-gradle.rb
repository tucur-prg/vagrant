
execute "gvm install" do
  command <<-EOH
    su #{node[:java][:build_user]} -l -c 'curl -s get.gvmtool.net | bash'
  EOH
end

bash "gvm shell" do
  user "#{node[:java][:build_user]}"
  code <<-EOC
    source "/home/#{node[:java][:build_user]}/.gvm/bin/gvm-init.sh"
  EOC
end

execute "Groovy install" do
  command <<-EOH
    su #{node[:java][:build_user]} -l -c 'gvm install groovy'
    su #{node[:java][:build_user]} -l -c 'groovy -v'
  EOH
end

execute "Gradle install" do
  command <<-EOH
    su #{node[:java][:build_user]} -l -c 'gvm install gradle'
    su #{node[:java][:build_user]} -l -c 'gradle -v'
  EOH
end
