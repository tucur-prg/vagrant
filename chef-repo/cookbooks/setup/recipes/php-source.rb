
%w{
  gcc
  libxml2
  libxml2-devel
  openssl-devel
  bzip2-devel
  gmp-devel
  autoconf
  automake
  re2c
}.each do |pkg|
  package "#{pkg}" do
  end
end

php_pkg = node[:php][:package][:version]

remote_file "/usr/local/src/#{php_pkg}.tar.gz" do
  action :create_if_missing
  source "http://museum.php.net/php5/#{php_pkg}.tar.gz"
  notifies :run, "execute[#{php_pkg} install]"
end

execute "#{php_pkg} install" do
  action :nothing
  cwd "/usr/local/src"
  command <<-EOH
    tar zxvf #{php_pkg}.tar.gz
    cd #{php_pkg}
    ./configure #{node[:php][:configure][:apxs]} #{node[:php][:configure][:options]}
    make
    make install
  EOH
  notifies :run, "execute[pear install]"
  notifies :create, "template[/etc/httpd/conf.d/php.conf]"
end

execute "pear install" do
  action :nothing
  cwd "/usr/local/src/#{php_pkg}/pear"
  command "/usr/local/bin/php install-pear-nozlib.phar > /tmp/pear.install.log"
end

directory "/etc/php.d" do
end

directory "/etc/httpd/conf.d" do
  recursive true
end

template "/etc/httpd/conf.d/php.conf" do
  action :nothing
  source "apache.php.conf.erb"
end

template "/etc/profile.d/path.sh" do
  source "etc.profile.path.sh.erb"
  variables({
    :path => '/usr/local/bin'
  })
end
