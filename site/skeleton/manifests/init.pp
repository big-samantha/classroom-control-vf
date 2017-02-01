file { '/etc/skel':
  ensure  => file,
  source  => '/etc/skel/.bashrc',
 }
}
