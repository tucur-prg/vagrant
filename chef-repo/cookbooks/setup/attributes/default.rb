
default[:hosts] = []

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
  },
  :maven => {
    :package => 'apache-maven-3.3.3-bin.tar.gz',
    :version => '3.3.3',
  }
}

default[:couchbase] = {
  :repo => 'http://packages.couchbase.com/rpm/6.2/x86_64',
  :admin => {
    :user => 'Administrator',
    :password => '000000',
  },
  :ramsize => 512,
  :first => '127.0.0.1',
  :node => '127.0.0.1',
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

default[:zabbix] = {
  :version => '2.4.6',
  :password => 'zabbix',
}
