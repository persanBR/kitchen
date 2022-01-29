bash 'install_something' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
    env > /tmp/teste.file
  EOH
end