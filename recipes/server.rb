repository "brightbox-gluster3" do
  key_url    "http://apt.brightbox.net/release.asc"
end

package "glusterfs-server" do
  action :install
end

service "glusterfs-server" do
  action :nothing
end

directory node[:glusterfs][:export_directory] do
  recursive true
end

# This configuration installs a replicated glusterfs server
template "/etc/glusterfs/glusterfsd.vol" do
  source "glusterfsd.vol.erb"
  mode   "0644"
  owner  "root"
  group  "root"
  notifies :restart, resources(:service => "glusterfs-server")
end


service "glusterfs-server" do
  action :restart
end
