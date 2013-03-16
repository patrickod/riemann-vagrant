node default {
  exec { "apt-update":
    command => "/usr/bin/apt-get update"
  }
  Exec["apt-update"] -> Package <| |>

  package { 'build-essential':
    ensure => installed
  }

  class { 'riemann': version => '0.1.5' }

  include riemann::dash::sample
  class { 'riemann::dash': config_file => '/etc/riemann-dash.rb' }

  include riemann::tools
}
