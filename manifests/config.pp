#Classe de configuracão

class chrony::config (
  $config               = $chrony::config,
  $config_template      = $chrony::config_template,
  $servers              = $chrony::servers,
) inherits chrony {
  file { $chrony::config_path:
    notify  => Service['chrony'],
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template($config_template),
  }
}
