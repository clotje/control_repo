# @summary LIM RHEL8 SELinux RHEL8 Security
#
# Setting SELinux to Permissive mode permanently 
#
$selinx_config = "/etc/selinux/config"
$check_config  = file_exists('$selinx_config')
#
node default{

if $check_config == 1 {

file_line{'Setting SELinux to Permissive mode permanently':
  path   => '$selinx_config',
  line   => 'SELINUX=permissive',
  match  => "^SELINUX=.*$",
  notify => Exec['noreboot'],
}
}

exec{'noreboot':
  path        => "/bin:/sbin:/usr/bin:/usr/sbin:",
  command     => 'setenforce 0',
  refreshonly => true,
    
}
}
