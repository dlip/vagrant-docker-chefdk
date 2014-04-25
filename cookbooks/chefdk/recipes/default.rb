execute "install chefdk" do
  command "wget https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/13.10/x86_64/chefdk_0.0.1-1_amd64.deb && dpkg -i chefdk_0.0.1-1_amd64.deb"
  user "root"
  not_if { ::File.exists?("chefdk_0.0.1-1_amd64.deb") }
end