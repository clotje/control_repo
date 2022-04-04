# @summary LIM RHEL8 SELinux RHEL8 Security
#
# Setting SELinux to Permissive mode permanently
#
# Variables
$selinx_config = "/etc/selinux/config"
$check_config  = check_file("$selinx_config")
#
# Eigen Ruby Functies
#    --> check_bestand.rb [in lib/puppet/parser/functions]
#
node default{

#notify{"Bestaat het bestand (ja = 1): ${check_config}": }

if $check_config == 1 {

file_line{'Setting SELinux to Permissive mode permanently':
  path   => "$selinx_config",
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
