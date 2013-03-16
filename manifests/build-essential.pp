class build-essential {
  package { build-essential:
    ensure => installed,
    provider => apt;
  }
}
