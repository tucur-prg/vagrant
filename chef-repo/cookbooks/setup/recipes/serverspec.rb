
%w{
  serverspec
  rake
}.each do |pkg|
  gem_package "#{pkg}" do
  end
end
