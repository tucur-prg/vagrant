
remote_file "#{Chef::Config[:file_cache_path]}/typesafe-activator-1.2.12.zip" do
    action :create_if_missing
    source "http://downloads.typesafe.com/typesafe-activator/1.2.12/typesafe-activator-1.2.12.zip"
end

bash "install activator" do
    not_if "ls /usr/share/activator-1.2.12"
    code <<-EOH
      cd "#{Chef::Config[:file_cache_path]}"
      unzip "#{Chef::Config[:file_cache_path]}/typesafe-activator-1.2.12.zip"
      mv "activator-1.2.12" "/usr/share/activator-1.2.12"
      chmod 755 /usr/share/activator-1.2.12/activator
      ln -s "/usr/share/activator-1.2.12/activator" "/usr/bin/activator"
    EOH
end
