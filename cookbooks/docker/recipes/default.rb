execute "apt-get-update" do
  command "apt-get update"
end

package "docker.io"

group "docker" do
  members "vagrant"
  append true
end

execute "link docker command" do
  command "ln -s /usr/bin/docker.io /usr/bin/docker"
  user "root"
  not_if { ::File.exists?("/usr/bin/docker") }
end

service "docker.io" do
  provider Chef::Provider::Service::Upstart
  action :restart
end
