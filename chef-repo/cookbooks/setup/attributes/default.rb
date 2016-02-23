
default[:hosts] = []

default[:curl] = {
  :package => {
    :version => 'curl-7.20.1',
  },
  :configure => {
    :options => '',
  },
}

default[:rbenv] = {
  :ruby => {
    :versions => ["2.1.2"],
    :global => "2.1.2",
  },
}

default[:fluentd] = {
  :collector => {
    :address => '127.0.0.1',
  },
}

default[:ldap] = {
  :server_addr => '127.0.0.1',
  :olc_root_dn => 'cn=Manager,dc=ns,dc=com',
  :olc_suffix => 'dc=ns,dc=com',
  :olc_people_ou => 'ou=People,dc=ns,dc=com',
  :password => '{SSHA}mkEURK9kA3hwmaqVTzAUCCOvvaSCI+eJ', # password = 0000
  :raw_password => '0000',
}

default[:php] = {
  :package => {
    :version => 'php-5.2.17',
  },
  :configure => {
    :apxs    => '',
    :options => '--cache-file=../config.cache --with-libdir=lib64 --with-config-file-path=/etc --with-config-file-scan-dir=/etc/php.d --disable-debug --with-pic --disable-rpath --without-pear --with-bz2 --with-exec-dir=/usr/bin --with-freetype-dir --with-png-dir --with-xpm-dir --enable-gd-native-ttf --without-gdbm --with-gettext --with-gmp --with-iconv --with-jpeg-dir --with-openssl --with-pcre-regex --with-zlib --with-layout=GNU --enable-exif --enable-ftp --enable-sockets --enable-sysvsem --enable-sysvshm --enable-sysvmsg --with-kerberos --enable-ucd-snmp-hack --enable-shmop --enable-calendar --without-sqlite --with-libxml-dir --enable-xml --with-system-tzdata',
  },
}

default[:java] = {
  :build_user => 'vagrant',
  :home       => '/usr/java/default/',
  :jdk => {
    :path    => 'http://download.oracle.com/otn-pub/java/jdk/8u40-b25/',
    :package => 'jdk-8u40-linux-x64.rpm',
    :version => 'jdk1.8.0_40',
  },
  :tomcat => {
    :package => 'apache-tomcat-8.0.26.tar.gz',
    :version => '8.0.26',
    :opts    => '-Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.port=10080 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false',
  },
  :maven => {
    :package => 'apache-maven-3.3.3-bin.tar.gz',
    :version => '3.3.3',
  }
}

default[:apache] = {
  :package => {
    :version => 'httpd-2.2.15',
  },
  :configure => {
    :prefix  => '--prefix=/usr/local/apache',
    :options => '--enable-so --enable-ssl --enable-mods-shared=all --with-expat=builtin --with-included-apr',
  },
}

default[:aerospile] = {
  :nodes => [],
}

default[:couchbase] = {
  :repo => 'http://packages.couchbase.com/rpm/6.2/x86_64',
  :path => 'http://packages.couchbase.com/releases/3.0.1/',
  :package => 'couchbase-server-community-3.0.1-centos6.x86_64',
  :admin => {
    :user => 'Administrator',
    :password => '000000',
  },
  :ramsize => 512,
  :index_ramsize => 256,
  :services => 'data,index,query',
  :first => '127.0.0.1',
  :node => '127.0.0.1',
}

default[:redis] = {
  :slave => {
    :masterip => '127.0.0.1',
  },
}

default[:rabbitmq] = {
  :cookie  => 'HMVQXUTOIDNGKHFROVLL',
  :path    => 'http://www.rabbitmq.com/releases/rabbitmq-server/v3.5.4/',
  :package => 'rabbitmq-server-3.5.4-1.noarch.rpm',
  :master  => 'master',
  :account => {
    :user => 'admin',
    :password => '0000',
    :tags => 'administrator',
    :permissions => {
      :path => '/',
      :settings => '.*',
      :write => '.*',
      :read => '.*',
    }
  }
}

default[:rundeck] = {
  :hostname => 'localhost',
  :port => '4440',
  :adminuser => {
    :username => 'admin',
    :password => 'password',
  }
}

default[:zabbix] = {
  :version => '2.4.6',
  :password => 'zabbix',
}

default[:zabbix_agent] = {
  :server => '127.0.0.1',
}

default[:munin] = {
  :nodes => [],
  :node => {
    :host_name => 'localhost.localdomain',
    :allow => '127\.0\.0\.1',
  },
}
