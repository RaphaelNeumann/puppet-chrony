class chrony::params {
  $package_ensure   = 'present'
  $service_enable   = true
  $service_ensure   = 'running'
  $service_manage   = true
  $servers = {
     '0.pool.ntp.org' => ['iburst'],
     '1.pool.ntp.org' => ['iburst'],
     '2.pool.ntp.org' => ['iburst'],
  }


  case $::osfamily {
    'RedHat' : {
      $config_path = '/etc/chrony.conf'
      $config_template = 'chrony/chrony.conf.redhat.erb'
      $config_keys = '/etc/chrony.keys'
      $config_keys_template = 'chrony/chrony.keys.redhat.erb'
      $config_keys_owner = 0
      $config_keys_group = chrony
      $config_keys_mode  = '0640'
      $package_name = 'chrony'
      $service_name = 'chronyd'
    }
    'Debian' : {
      $config_path = '/etc/chrony/chrony.conf'
      $config_template = 'chrony/chrony.conf.debian.erb'
      $config_keys = '/etc/chrony/chrony.keys'
      $config_keys_template = 'chrony/chrony.keys.debian.erb'
      $config_keys_owner = 0
      $config_keys_group = chrony
      $config_keys_mode  = '0644'
      $package_name = 'chrony'
      $service_name = 'chrony'
    }
    default     : {
      fail("The ${module_name} module não está preparado sistemas operacionais baseados em ${::osfamily}.")
    }
  }