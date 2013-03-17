class riemann::package($version) {
  include wget

  package { [
      'leiningen',
      'clojure1.3',
    ]:
      ensure => installed,
  }

  wget::fetch { 'download_riemann':
    source      => "http://aphyr.com/riemann/riemann-$version.tar.deb",
    destination => "/usr/local/src/riemann-$version.tar.deb",
    before      => Exec['dpkg_install_riemann'],
  }

  exec { 'dpkg_install_riemann':
    command => "dpkg -i /usr/local/src/riemann-$version.deb",
    cwd     => "/opt",
    creates => "/etc/init.d/riemann",
    path    => ['/bin', '/usr/bin'],
  }

  # exec { 'untar_riemann':
  #   command => "tar xvfj /usr/local/src/riemann-$version.tar.bz2",
  #   cwd     => '/opt',
  #   creates => "/opt/riemann-$version",
  #   path    => ['/bin',],
  #   before  => File['/opt/riemann'],
  # }

  # file { '/opt/riemann':
  #   ensure => link,
  #   target => "/opt/riemann-$version",
  #   notify => Service['riemann'],
  # }

}
