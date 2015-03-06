
# Yum Repo JPackage
remote_file "#{Chef::Config[:file_cache_path]}/jpackage-release-6-3.jpp6.noarch.rpm" do
    action :create
    source "http://mirrors.dotsrc.org/jpackage/6.0/generic/free/RPMS/jpackage-release-6-3.jpp6.noarch.rpm"
    not_if "rpm -qa | grep -q '^jpackage-release'"
    notifies :install, "rpm_package[jpackage-release]", :immediately
end

rpm_package "jpackage-release" do
    action :nothing
    source "#{Chef::Config[:file_cache_path]}/jpackage-release-6-3.jpp6.noarch.rpm"
end

%w{
    java-1.7.0-openjdk
    java-1.7.0-openjdk-devel
}.each do |pkg|
    yum_package "#{pkg}" do
        options "--nogpgcheck"
    end
end
