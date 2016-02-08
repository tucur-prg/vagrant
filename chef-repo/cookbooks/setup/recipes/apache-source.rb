
%w{
  gcc
  openssl-devel
}.each do |pkg|
  package "#{pkg}" do
  end
end

package = node[:apache][:package][:version]

remote_file "/usr/local/src/#{package}.tar.gz" do
  action :create_if_missing
  source "http://archive.apache.org/dist/httpd/#{package}.tar.gz"
  notifies :run, "execute[#{package} install]"
end

execute "#{package} install" do
  action :nothing
  cwd "/usr/local/src"
  command <<-EOH
  tar zxvf #{package}.tar.gz
  cd #{package}
  ./configure #{node[:apache][:configure][:prefix]} #{node[:apache][:configure][:options]}
  make
  make install
  EOH
end
