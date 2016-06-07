node 'default' {
  package { "git" :
        ensure => "2.8.3",
        provider => 'chocolatey'
  }
  package { "dotnet4.5" :
        ensure => "installed",
        provider => 'chocolatey'
  }
  package { "nodejs" :
        ensure => "6.2.1",
        provider => 'chocolatey'
  }
  package { "visualstudio2013ultimate" :
        ensure => "installed",
        provider => 'chocolatey'
  }
  package { "sql-server-management-studio" :
        ensure => "latest",
        install_options => ['-pre'],
        provider => 'chocolatey'
  }  
}