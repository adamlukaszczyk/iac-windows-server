node 'default' {
  package { "git" :
        ensure => "2.8.3",
        provider => 'chocolatey'
  }
  package { "dotnet4.5" :
        ensure => "latest",
        provider => 'chocolatey'
  }
}