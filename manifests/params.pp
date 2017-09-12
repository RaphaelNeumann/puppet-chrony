# Classe com os parametros utilizados 

class chrony::params {
  $package_ensure   = 'present'
  $service_enable   = true
  $service_ensure   = 'running'
  $service_manage   = true
  $servers = {
    'a.ntp.br' => ['iburst'],
    'b.ntp.br' => ['iburst'],
    'c.ntp.br' => ['iburst'],
  }

  case $::osfamily {
    'RedHat' : {
      $config_path = '/etc/chrony.conf'
      $config_template = 'chrony/chrony.conf.redhat.erb'
      $package_name = 'chrony'
      $service_name = 'chronyd'
    }
    'Debian' : {
      $config_path = '/etc/chrony/chrony.conf'
      $config_template = 'chrony/chrony.conf.debian.erb'
      $package_name = 'chrony'
      $service_name = 'chrony'
    }
    default     : {
      fail("The ${module_name} module não está preparado sistemas operacionais baseados em ${::osfamily}.")
    }
  }
}