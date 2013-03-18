node default {
  exec { "apt-update":
    command => "/usr/bin/apt-get update"
  }
  Exec["apt-update"] -> Package <| |>

  package { 'build-essential':
    ensure => installed
  }
}

node 'riemann.patrickod.dev' inherits default {
  class { 'riemann': version => '0.2.0' }

  include riemann::dash::sample
  class { 'riemann::dash': config_file => '/etc/riemann-dash.rb' }

  include riemann::tools

  notify { "finished":
    withpath => false,
    name     => "Your Riemann instance is now avialable at $::ipaddress_eth1",
    require  => Class["riemann", "riemann::tools", "riemann::dash"]
  }
}
