# Classe principal do modulo

class chrony (
Hash     $servers              = $chrony::params::servers,
Boolean  $service_manage       = $chrony::params::service_manage,
) inherits chrony::params {
    include '::chrony::install'
    include '::chrony::config'
    include '::chrony::service'
}
