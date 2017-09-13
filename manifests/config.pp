#Classe de configuracão

class chrony::config (
  $config               = $chrony::config,
  $config_template      = $chrony::config_template,
  $servers              = $chrony::servers,
  $iburst               = $chrony::iburst,
) inherits chrony {

  $_template_hash = {
    servers => $servers,
    iburst  => $iburst
  }
  file { $chrony::config_path:
    notify  => Service['chrony'],
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => epp($config_template, $_template_hash),
  }
}
