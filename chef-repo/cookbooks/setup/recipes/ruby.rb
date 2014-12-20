
git "/usr/share/rbenv" do
    repository "https://github.com/sstephenson/rbenv.git"
    reference "master"
    action :checkout
end

directory "/usr/share/rbenv/plugins" do
    mode "0755"
    action :create
end

git "/usr/share/rbenv/plugins/ruby-build" do
    repository "https://github.com/sstephenson/ruby-build.git"
    reference "master"
    action :checkout
end

template "/etc/profile.d/rbenv.sh" do
    source "shell.rbenv.sh.erb"
    owner "root"
    group "root"
    mode 0644
end

# install ruby
(node.rbenv.ruby.versions).each do |ruby_version|
    execute "install ruby #{ruby_version}" do
        not_if "source /etc/profile.d/rbenv.sh; rbenv versions | grep #{ruby_version}"
        command "source /etc/profile.d/rbenv.sh; rbenv install #{ruby_version}"
        action :run
    end
end

execute "set global ruby" do
    not_if "source /etc/profile.d/rbenv.sh; rbenv global | grep '#{node.rbenv.ruby.global}'"
    command "source /etc/profile.d/rbenv.sh; rbenv global #{node.rbenv.ruby.global}; rbenv rehash"
    action :run
end
