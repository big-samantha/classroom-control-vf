define ::users (
$home :: /home/
file { "/etc/.ssh":
ensure => directory,
owner => 'jose', 'alice', 'chen',
group => 'devs',
home => 
mode => '0644',
content => epp('apache/vhost.conf.epp', { 'docroot' => $docroot,
'port' => $port,
# other parameters used in the template
}),
notify => Service['httpd'],
}
}
