
group "developer" do
    action :create
    gid 1000
end

user "developer" do
    action :create
    supports :manage_home => true
    home "/home/developer"
    shell "/bin/bash"
    password '$1$NzL9T83G$W/Yibjn8bhn2ihZlBATrz0'
    uid 1000
    gid "developer"
end

execute "/home/developer permission" do
    command "chmod 0755 /home/developer"
end

git "/home/developer/web-dt" do
    repository "https://github.com/tucur-prg/web-dt.git"
    user "developer"
    group "developer"
end

execute "permission web-dt tmp" do
    command "chmod 0777 /home/developer/web-dt/idt/.tmp"
end

template "/etc/httpd/conf.d/vhost.conf" do
    source "apache.vhost.conf.erb"
    owner "root"
    group "root"
    mode 0644
    variables({
        :hostname      => "develop.vb.ns.com",
        :document_root => "/home/developer/web-dt"
    })
end
