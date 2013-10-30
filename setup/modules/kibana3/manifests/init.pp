class kibana3 () {

	include apache

	$kibana_pkg = 'kibana3.tar.gz'

	file {'/tmp/kibana3.tar.gz':
		source => "puppet:///modules/kibana3/kibana-3.0.0milestone4.tar.gz",
	}

	file {'/var/www/kibana' :
		ensure => directory,
      		mode   => 644,
	}

	exec { 'unpack-kibana':
    		command => "tar --strip-components 1 -xzf ${kibana_pkg} -C /var/www/kibana/",
    		cwd     => '/tmp',
    		path    => '/bin:/usr/bin',
    		require => [File["/tmp/${kibana_pkg}"],File["/var/www/kibana"]],

  	}
}
