





File { backup => false }

# Randomize enforcement order to help understand relationships
ini_setting { 'random ordering':
  ensure  => present,
  path    => "${settings::confdir}/puppet.conf",
  section => 'agent',
  setting => 'ordering',
  value   => 'title-hash',
}

node default {
  # This is where you can declare classes for all nodes.
  # Example:
  #   class { 'my_class': }
  include role::classroom

if $::virtual != 'physical'{
$vmname = capitalize($::virtual)
notify{"This is a ${vmname} virtual machine":} 
}
  
include users
include skeleton
include memcached
include nginx
include aliases
}



