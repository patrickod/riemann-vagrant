class riemann::service($config_file) {
  file { '/etc/init.d/riemann':
    ensure => exists,
  }

  service {'riemann':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    provider   => init,
    require    => [
      File['/etc/init.d/riemann'],
      Class['riemann::package'],
    ],
  }
  File['/etc/init.d/riemann'] ~> Service['riemann']
}
