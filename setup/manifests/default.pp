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

class { 'logstash':
   provider => 'custom',
   jarfile  => 'puppet:///modules/logstash/logstash-1.2.1-flatjar.jar',
   installpath => '/var/lib/logstash/',
   instances => [ 'shipper', 'indexer' ],
   conffile => { 'shipper' => '/vagrant/indexer.conf', 'indexer' => '/vagrant/shipper.conf' }
}

class { 'timezone': 
  region => 'Europe',
  locality => 'London',
}

class { '::ntp':
  servers => [ '0.uk.pool.ntp.org', '1.uk.pool.ntp.org' ],
}

