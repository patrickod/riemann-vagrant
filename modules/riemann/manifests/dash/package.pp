class riemann::dash::package {
  package { [
      'riemann-dash'
    ]:
      ensure   => installed,
      require  => Package["build-essential"],
      provider => gem,
  }
}
