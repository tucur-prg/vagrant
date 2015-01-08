
template "/root/.bashrc" do
    action :create
    source "root.bashrc.erb"
    owner "root"
    group "root"
    mode 0644

    variables({
      :namespace => node.setup.namespace,
      :os_name   => node.setup.os_name,
    })
end

template "/home/vagrant/.bashrc" do
    action :create
    source "default.bashrc.erb"
    owner "vagrant"
    group "vagrant"
    mode 0644

    variables({
      :namespace => node.setup.namespace,
      :os_name   => node.setup.os_name,
    })
end

