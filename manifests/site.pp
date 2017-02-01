

node default {
  # This is where you can declare classes for all nodes.
  # Example:
  #   class { 'my_class': }
  include role::classroom

#file { '/etc/motd':
#  ensure  => file,
#  owner   => 'root',
#  group   => 'root',
#  mode    => '0644',
#  content => "MOTD is a must\n",
#}

exec { "cowsay 'Welcome to ${::fqdn}!' > /etc/motd":
path => '/usr/bin:/usr/local/bin',
creates => '/etc/motd',
}

include users
}


