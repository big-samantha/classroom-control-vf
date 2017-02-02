

node default {
  # This is where you can declare classes for all nodes.
  # Example:
  #   class { 'my_class': }
  
#  if $::virtual != 'physical' {
if $is_virtual {
$vmname = capitalize($::virtual)
notify { "This is a ${vmname} virtual machine.": }
}

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
include skeleton
include memcached
include nginx
}


