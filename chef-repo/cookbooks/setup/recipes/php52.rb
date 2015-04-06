
%w{
  gcc
  libxml2
  libxml2-devel
  openssl-devel
  bzip2-devel
  gmp-devel
}.each do |pkg|
  package "#{pkg}" do
  end
end

php_pkg = "php-5.2.17"

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
    ./configure --cache-file=../config.cache --with-libdir=lib64 --with-config-file-path=/etc --with-config-file-scan-dir=/etc/php.d --disable-debug --with-pic --disable-rpath --without-pear --with-bz2 --with-exec-dir=/usr/bin --with-freetype-dir --with-png-dir --with-xpm-dir --enable-gd-native-ttf --without-gdbm --with-gettext --with-gmp --with-iconv --with-jpeg-dir --with-openssl --with-pcre-regex --with-zlib --with-layout=GNU --enable-exif --enable-ftp --enable-sockets --enable-sysvsem --enable-sysvshm --enable-sysvmsg --with-kerberos --enable-ucd-snmp-hack --enable-shmop --enable-calendar --without-sqlite --with-libxml-dir --enable-xml --with-system-tzdata
    make
    make install
  EOH
end
