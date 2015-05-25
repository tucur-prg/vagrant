
execute "install jenkins repo" do
  command <<-EOH
    wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
    rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
  EOH
  not_if { File.exists?("/etc/yum.repos.d/jenkins.repo") }
end

yum_package "jenkins" do
end

template "/etc/sysconfig/jenkins" do
  source "jenkins.erb"
  mode "0600"
end

service "jenkins" do
  action [ :enable, :start ]
end
