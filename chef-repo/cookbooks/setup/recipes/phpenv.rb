
# phpenv + php-build
%w{
    libxml2
    libxml2-devel
    curl-devel
    libjpeg-devel
    libpng-devel
    libmcrypt-devel
    mysql-devel
    readline-devel
    libtidy-devel
    libxslt-devel
}.each do |pkg|
    yum_package "#{pkg}" do
    end
end

bash "phpenv php-build" do
    code <<-EOS
        curl https://raw.githubusercontent.com/CHH/phpenv/master/bin/phpenv-install.sh | bash
        git clone git://github.com/CHH/php-build.git ~/.phpenv/plugins/php-build
        echo 'export PATH="$HOME/.phpenv/bin:$PATH"' >> ~/.bashrc
        echo 'eval "$(phpenv init -)"' >> ~/.bashrc
    EOS
end
