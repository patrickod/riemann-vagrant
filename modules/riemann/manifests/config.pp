class riemann::config($riemann_server='localhost', $riemann_port='5555') {
  file { '/etc/riemann.config':
    ensure => present,
    content => template('riemann/riemann.config.erb'),
    notify => Service['riemann']
  }

  file { '/etc/puppet/riemann.yaml':
    ensure  => present,
    content => template('riemann/puppet/riemann.yaml.erb')
  }
}
