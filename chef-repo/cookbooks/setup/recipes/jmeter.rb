
package = "apache-jmeter-2.13"

remote_file "/usr/local/src/#{package}.tgz" do
  source "http://ftp.meisei-u.ac.jp/mirror/apache/dist//jmeter/binaries/#{package}.tgz"
  mode "0777"
end

execute "jmeter install" do
  cwd "/usr/local/src"
  command <<-EOH
    tar zxvf #{package}.tgz
    mv #{package} /opt/jmeter
  EOH
end
