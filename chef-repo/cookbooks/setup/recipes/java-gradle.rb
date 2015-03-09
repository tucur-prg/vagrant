
remote_file "#{Chef::Config[:file_cache_path]}/gradle-2.2.1-all.zip" do
    action :create_if_missing
    source "https://services.gradle.org/distributions/gradle-2.2.1-all.zip"
end

bash "install gradle" do
    not_if "ls /usr/share/gradle-2.2.1"
    code <<-EOH
      cd "#{Chef::Config[:file_cache_path]}"
      unzip "#{Chef::Config[:file_cache_path]}/gradle-2.2.1-all.zip"
      mv "gradle-2.2.1" "/usr/share/gradle-2.2.1"
      ln -s "/usr/share/gradle-2.2.1/bin/gradle" "/usr/bin/gradle"
    EOH
end
