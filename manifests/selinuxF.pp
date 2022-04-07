# @summary LIM RHEL8 SELinux RHEL8 Security
#
# Setting SELinux to Enforced mode permanently
#
class security::selinux{
file_line { 'Force SELinux to "enforcing" mode permanently':
  path   => '/etc/selinux/config',
  line   => 'SELINUX=enforcing',
  match  => '^SELINUX=.*$',
  }

exec { 'noreboot':
  onlyif      => 'test `getenforce | grep -c Enforcing` -eq 0',
  path        => '/bin:/sbin:/usr/bin:/usr/sbin:',
  command     => 'setenforce 1',
  }
 }
