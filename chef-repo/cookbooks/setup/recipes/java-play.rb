
remote_file "#{Chef::Config[:file_cache_path]}/typesafe-activator-1.2.12.zip" do
  action :create_if_missing
  source "http://downloads.typesafe.com/typesafe-activator/1.2.12/typesafe-activator-1.2.12.zip"
end

bash "install activator" do
  not_if "which activator"
  code <<-EOH
    cd "/usr/share/"
    unzip "#{Chef::Config[:file_cache_path]}/typesafe-activator-1.2.12.zip"
    chmod 755 /usr/share/activator-1.2.12/activator
    ln -s "/usr/share/activator-1.2.12/activator" "/usr/bin/activator"
  EOH
end

=begin
template "/etc/profile.d/play.sh" do
  source "etc.profile.play.sh.erb"
  owner "root"
  group "root"
  mode "0644"
end
=end
