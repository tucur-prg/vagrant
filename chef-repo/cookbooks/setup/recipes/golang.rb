
%w{
  golang
  mercurial
  glibc-devel.i686
  libgcc.i686
}.each do |pkg|
  yum_package "#{pkg}" do
  end
end

template "/etc/profile.d/golang.sh" do
  source "etc.profile.golang.sh.erb"
  owner "root"
  group "root"
  mode "0644"
end

bash "cross compile windows amd64" do
  not_if "ls `go env GOROOT`/bin/windows_amd64/"
  code <<-EOS
    cd `go env GOROOT`/src
    GOOS=windows GOARCH=amd64 ./make.bash
  EOS
end

bash "cross compile darwin amd64" do
  not_if "ls `go env GOROOT`/bin/darwin_amd64/"
  code <<-EOS
    cd `go env GOROOT`/src
    GOOS=darwin GOARCH=amd64 ./make.bash
  EOS
end
