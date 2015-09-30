
execute "sdk install" do
  command <<-EOH
    su #{node[:java][:build_user]} -l -c 'curl -s api.sdkman.io | bash'
  EOH
end

bash "sdk shell" do
  user "#{node[:java][:build_user]}"
  code <<-EOC
    source "/home/#{node[:java][:build_user]}/.sdkman/bin/sdkman-init.sh"
  EOC
end

execute "Groovy install" do
  command <<-EOH
    su #{node[:java][:build_user]} -l -c 'sdk install groovy'
    su #{node[:java][:build_user]} -l -c 'groovy -v'
  EOH
end

execute "Gradle install" do
  command <<-EOH
    su #{node[:java][:build_user]} -l -c 'sdk install gradle'
    su #{node[:java][:build_user]} -l -c 'gradle -v'
  EOH
end
