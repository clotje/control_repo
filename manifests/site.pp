node default {

file { '/etc/selinux/config':
  ensure => present,
}~>

file_line{'Setting SELinux to Permissive mode permanently':
  path   => '/etc/selinux/config',
  line   => 'SELINUX=permissive',
  match  => "^SELINUX=.*$",
  notify => Exec['noreboot'],
}

exec{'noreboot':
  path        => "/bin:/sbin:/usr/bin:/usr/sbin:",
  command     => 'setenforce 0',
  refreshonly => true,
}
}
