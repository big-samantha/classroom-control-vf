
File { backup => false }

ini_setting { 'random ordering':
  ensure  => present,
  path    => "${settings::confdir}/puppet.conf",
  section => 'agent',
  setting => 'ordering',
  value   => 'title-hash',
}



node default {
  include role::classroom
  include users
  include skeleton

  $motd_command = "/usr/local/bin/cowsay 'Welcome to ${::fqdn}!' > /etc/motd"
  $motd_check = "/bin/grep -F 'Welcome to ${::fqdn}' /etc/motd"
  
  
  exec { 'set motd':
    command => $motd_command,
    unless => $motd_check,
  }
}
