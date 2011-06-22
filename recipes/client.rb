repository "brightbox-gluster3" do
  key_url    "http://apt.brightbox.net/release.asc"
end

package "glusterfs-client" do
  action :upgrade
end

execute "add-fuse-to-modules" do
  command "echo fuse >> /etc/modules"
  user "root"
  creates "/var/tmp/.add-fuse-to-modules"
end

file "/var/tmp/.add-fuse-to-modules"

if not File.directory?(node[:glusterfs][:client][:mount_directory])
  directory node[:glusterfs][:client][:mount_directory] do
    action :create
    recursive true
  end
end

gluster_servers=search(:node,"role:glusterfs-server")

template "/etc/glusterfs/glusterfs.vol" do
  source "glusterfs.vol.erb"
  mode   "0644"
  owner  "root"
  group  "root"
  variables :servers => gluster_servers
end

mount node[:glusterfs][:client][:mount_directory] do
  device "/etc/glusterfs/glusterfs.vol"
  fstype "glusterfs"
  action [:mount, :enable]  #This add the mount to fstab
  options "defaults,_netdev"
  dump 0
  pass 0
end

execute "glusterfs-client-remount" do
  command "umount /etc/glusterfs/glusterfs.vol && mount /etc/glusterfs/glusterfs.vol"
  action :nothing
  subscribes :run, resources(:template => "/etc/glusterfs/glusterfs.vol")
end


