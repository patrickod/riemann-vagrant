class riemann::dash::sample {
  file { '/etc/riemann-dash.rb':
    ensure  => present,
    content  => template("riemann/riemann-dash.rb.erb"),
    notify  => Service['riemann-dash'],
  }

  file { '/usr/share/riemann-dash':
    ensure  => directory,
    recurse => true,
    source  => 'puppet:///modules/riemann/riemann-dash',
    notify  => Service['riemann-dash'],
  }
}
