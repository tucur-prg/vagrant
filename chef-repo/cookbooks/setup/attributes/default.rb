
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
