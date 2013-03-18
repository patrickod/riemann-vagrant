class riemann::package($version) {
  include wget

  package { [
      'leiningen',
      'clojure1.3',
    ]:
      ensure => installed,
  }

  wget::fetch { 'download_riemann':
    source      => "http://aphyr.com/riemann/riemann_${version}_all.deb",
    destination => "/usr/local/src/riemann_${version}_all.deb",
    before      => Exec['dpkg_install_riemann'],
  }

  exec { 'dpkg_install_riemann':
    command => "dpkg -i /usr/local/src/riemann_${version}_all.deb",
    cwd     => "/opt",
    creates => "/etc/init.d/riemann",
    path    => ['/sbin', '/usr/sbin', '/bin', '/usr/bin']
  }
}
