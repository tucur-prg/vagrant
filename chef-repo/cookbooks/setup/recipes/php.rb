
# PHP Version 5.5.x
yum_package "php" do
    options '--enablerepo=remi,remi-php55'
    notifies :create, "template[/etc/php.d/php-settings.ini]", :immediately
end

%w{
  php-devel
  php-mbstring
  php-pdo
  php-mysql
  php-xml
  php-pecl-xdebug
  php-phpunit-DbUnit
}.each do |pkg|
    yum_package "#{pkg}" do
        options '--enablerepo=remi,remi-php55'
    end
end

template "/etc/php.d/php-settings.ini" do
    source "php.php-settings.ini.erb"
    owner "root"
    group "root"
    mode 0644
    action :nothing
end

# composer
remote_file '/usr/local/bin/composer' do
  source 'https://getcomposer.org/composer.phar'
  mode 0755
end

# psysh
remote_file '/usr/local/bin/psysh' do
  source 'http://psysh.org/psysh'
  mode 0755
end

