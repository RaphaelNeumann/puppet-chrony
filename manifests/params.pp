# Classe com os parametros utilizados 

class chrony::params {
  $package_ensure   = 'present'
  $service_enable   = true
  $service_ensure   = 'running'
  $service_manage   = true
  $iburst           = true
  $servers = ['a.ntp.br', 'b.ntp.br', 'c.ntp.br']

  case $::osfamily {
    'RedHat' : {
      $config_path = '/etc/chrony.conf'
      $config_template = 'chrony/chrony.conf.redhat.epp'
      $package_name = 'chrony'
      $service_name = 'chronyd'
    }
    'Debian' : {
      $config_path = '/etc/chrony/chrony.conf'
      $config_template = 'chrony/chrony.conf.debian.epp'
      $package_name = 'chrony'
      $service_name = 'chrony'
    }
    default     : {
      fail("The ${module_name} module não está preparado sistemas operacionais baseados em ${::osfamily}.")
    }
  }
}