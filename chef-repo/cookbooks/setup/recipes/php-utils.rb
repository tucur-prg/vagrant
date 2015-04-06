
# composer
remote_file '/usr/local/bin/composer' do
  source 'https://getcomposer.org/composer.phar'
  mode 0755
end

# psysh
remote_file '/usr/local/bin/psysh' do
  source 'http://psysh.org/psysh'
  mode 0755
end
