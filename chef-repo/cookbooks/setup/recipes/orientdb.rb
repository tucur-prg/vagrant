
pkg = "orientdb-community-2.0.6"
file = "#{pkg}.tar.gz"

group "orientdb" do
  gid 2001
end

user "orientdb" do
  comment "orientdb management user"
  uid 2001
  group "orientdb"
  # password = orientdb
  password "$1$ZqnqOcUQ$EuuUln7KefjYw1P3lr.96/"
  supports :manage_home => true
  action [ :create, :manage ]
end

template "/home/orientdb/.bash_profile" do
  source "user.orientdb.bash_profile.erb"
  variables({
    :orientdbPath => "/opt/orientdb/bin"
  })
end

remote_file "/usr/local/src/#{file}" do
  source "http://www.orientechnologies.com/download.php?email=unknown@unknown.com&file=#{file}&os=linux"
end

execute "orientdb install" do
  cwd "/usr/local/src"
  command <<-EOH
    tar zxvf #{file} -C /opt/
    ln -s /opt/#{pkg} /opt/orientdb
  EOH
end

execute "orientdb permission" do
  command <<-EOH
    chmod 640 /opt/orientdb/config/orientdb-server-config.xml
    chown -R orientdb.orientdb /opt/orientdb*
    chmod g+x /opt/orientdb/bin/*.sh
  EOH
end

template "/opt/orientdb/bin/orientdb.sh" do
  source "opt.orientdb.sh.erb"
  mode "0755"
  variables({
    :orientdbDir => '/opt/orientdb',
    :orientdbUser => 'orientdb'
  })
end

template "/opt/orientdb/config/orientdb-server-config.xml" do
  source "opt.orientdb-server-config.xml.erb"
  mode "0640"
  variables({
    :password => '0000',
  })
end
