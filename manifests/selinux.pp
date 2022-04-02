# @summary LIM RHEL8 SELinux RHEL8 Security
#
# Setting SELinux to Permissive mode permanently 
#
#
class selinux{

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
