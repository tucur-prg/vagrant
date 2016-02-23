
%w{
  gcc
  openssl-devel
}.each do |pkg|
  package "#{pkg}" do
  end
end

package = node[:curl][:package][:version]

remote_file "/usr/local/src/#{package}.tar.gz" do
  action :create_if_missing
  source "https://curl.haxx.se/download/#{package}.tar.gz"
  notifies :run, "execute[#{package} install]"
end

execute "#{package} install" do
  action :nothing
  cwd "/usr/local/src"
  command <<-EOH
  tar zxvf #{package}.tar.gz
  cd #{package}
  ./configure #{node[:curl][:configure][:options]}
  make
  make install
  EOH
end
