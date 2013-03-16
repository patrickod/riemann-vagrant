class riemann(
  $version='0.1.5',
  $config_file='/etc/riemann.config'
  ){

    include riemann::params
    class { 'riemann::package': version    => $version }

    class { 'riemann::config':
      riemann_server => $riemann::params::riemann_server_ip
    }

    class { 'riemann::service': config_file => $config_file }
}
