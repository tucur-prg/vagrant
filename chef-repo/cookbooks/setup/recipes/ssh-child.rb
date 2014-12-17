
cookbook_file "/home/vagrant/id_rsa.pub" do
    source "id_rsa.pub"
    owner "vagrant"
    group "vagrant"
end

bash "add authorized_keys" do
    code <<-EOC
        cat /home/vagrant/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
        rm /home/vagrant/id_rsa.pub
    EOC
end
