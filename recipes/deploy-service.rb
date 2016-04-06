


directory '/opt/deploy-service' do
  owner 'teletraan'
  group 'teletraan'
  mode '0755'
  action :create
end

remote_file '/opt/deploy-service/tarball.tar.gz' do
  owner 'teletraan'
  group 'teletraan'
  mode '0644'
  source 'https://github.com/pinterest/teletraan/releases/download/'+node[:teletraan][:release_version]+'/teletraan-service-'+node[:teletraan][:deploy_service_version]+'.tar.gz'
  notifies :run, 'execute[decompress_service]', :immediately
  notifies :create, 'cookbook_file[server.yaml]'
  notifies :create, 'cookbook_file[upstart_service]'
end

execute 'decompress_service' do
  command 'tar zxf tarball.tar.gz'
  cwd '/opt/deploy-service/'
  action :nothing
end

directory '/opt/deploy-service/db' do
  owner 'teletraan'
  group 'teletraan'
  mode '0755'
  action :create
end


cookbook_file 'server.yaml' do
  path '/opt/deploy-service/bin/server.yaml'
  source 'server.yaml'
  owner 'teletraan'
  group 'teletraan'
  mode '0644'
  action :nothing
end

cookbook_file 'upstart_service' do
  path '/etc/init/teletraan.conf'
  source 'upstart/teletraan.conf'
  owner 'teletraan'
  group 'teletraan'
  mode '0644'
  action :nothing
end
