
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

default[:couchbase][:repo] = 'http://packages.couchbase.com/rpm/6.2/x86_64'
