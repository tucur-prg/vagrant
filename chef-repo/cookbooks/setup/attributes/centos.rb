
version = node[:platform_version].split(".")

if version[0].to_i < 7
  default[:service][:stop] = %w{
    auditd
    blk-availability
    iptables
    ip6tables
    lvm2-monitor
    mdmonitor
    netfs
    postfix
    udev-post
  }
else
  default[:service][:stop] = %w{
    firewalld
  }
end
