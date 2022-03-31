# @summary LIM RHEL8 SELinux RHEL8 Security
#
# Setting SELinux to Permissive mode permanently 
# Set setenforce to 0 -> no reboot needed ....
#
$selinux_config = '/etc/selinux/config'

class security::selinux{

file_line{'Setting SELinux to Permissive mode permanently on the client':
  onlyif => '/bin/test -e /etc/selinux/config',
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
