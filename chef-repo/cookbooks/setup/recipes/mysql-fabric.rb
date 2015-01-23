
## Variables
password = "fabric"

## Settings

file "/var/log/fabric.log" do
    not_if { File.exists?("/var/log/fabric.log") }
    action :touch
    owner "mysql"
    group "mysql"
    mode 0644
end

template "/etc/mysql/fabric.cfg" do
    action :create
    source "mysql.fabric.cfg.erb"
    owner "root"
    group "root"
    mode 0640

    variables({
        :password => password,
    })
end

template "/tmp/setup.sql" do
    not_if { File.exists?("/var/log/chef-fabric.lock") }

    action :create
    source "mysql.fabric.setup.sql.erb"
    owner "root"
    group "root"
    mode 0644

    variables({
        :password => password,
    })

    notifies :run, "execute[fabric-setup]", :immediately
end

execute "fabric-setup" do
    action :nothing
    command "/usr/bin/mysql -u root < /tmp/setup.sql"

    notifies :run, "execute[fabric-create-schema]", :immediately
end

execute "fabric-create-schema" do
    action :nothing
    command "/usr/bin/mysqlfabric manage setup --param=storage.user=fabric --param=storage.password=#{password}"
end

file "/etc/mysql/chef-fabric.lock" do
    action :touch
    mode 0600
end
