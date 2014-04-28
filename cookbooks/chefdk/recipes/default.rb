execute "install chefdk" do
  command "wget https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/13.10/x86_64/chefdk_0.0.1-1_amd64.deb && dpkg -i chefdk_0.0.1-1_amd64.deb"
  user "root"
  not_if { ::File.exists?("chefdk_0.0.1-1_amd64.deb") }
end

execute "add chefdk to path" do
  command "echo 'export PATH=\"/opt/chefdk/embedded/bin\"\:$PATH' > /home/vagrant/.bash_profile"
  user "vagrant"
  not_if { ::File.exists?("/home/vagrant/.bash_profile") }
end

execute "install kitchen-docker" do
  command "/opt/chefdk/embedded/bin/gem install kitchen-docker"
  user "root"
end
