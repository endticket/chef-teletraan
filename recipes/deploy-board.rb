
directory '/opt/deploy-board' do
  owner 'teletraan'
  group 'teletraan'
  mode '0755'
  action :create
end

remote_file '/opt/deploy-board/tarball.tar.gz' do
  owner 'teletraan'
  group 'teletraan'
  mode '0644'
  source 'https://github.com/pinterest/teletraan/releases/download/'+node[:teletraan][:release_version]+'/deploy-board-'+node[:teletraan][:deploy_board_version]+'.tar.gz'
  notifies :run, 'execute[decompress_board]', :immediately
  notifies :run, 'execute[deps]'
  notifies :create, 'cookbook_file[upstart_board]'
end

execute 'decompress_board' do
  command 'tar zxf tarball.tar.gz'
  cwd '/opt/deploy-board/'
  action :nothing
end

execute 'deps' do
  command 'pip install -r requirements.txt'
  cwd '/opt/deploy-board/deploy-board'
  action :nothing
end

cookbook_file 'upstart_board' do
  path '/etc/init/board.conf'
  source 'upstart/deploy_board.conf'
  owner 'teletraan'
  group 'teletraan'
  mode '0644'
  action :nothing
end
