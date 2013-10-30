exec { "apt-get-update":
    command => "/usr/bin/apt-get update",
}

package {'curl':
        provider => apt,
        ensure => latest,
        require => Exec['apt-get-update']
}

class {'elasticsearch':
  version => '0.90.5',
  require => Exec['apt-get-update'],
}

class { 'redis':
  version => '2.6.16',
}

class { 'kibana3':
}
