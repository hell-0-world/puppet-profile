class profile::base(
  $ntp_service = [
    '0.ubuntu.pool.ntp.org',
    '1.ubuntu.pool.ntp.org',
  ]
) {
  include ::ssh
  class { '::ntp': 
    servers => $ntp_servers,
  }
  
  if $facts['os']['family'] == 'RedHat' {
    include ::profile::selinux
  }
}
