##PS.: The app should not run as root for security reassons

bash 'app_setup' do
  user 'root'
  cwd '/root'
  code <<-EOH
    curl -sL https://rpm.nodesource.com/setup_14.x | sudo bash -
    sudo yum install -y nodejs
    yum install  npm
    npm install -g npm
    git clone https://github.com/persanBR/node-3tier-app.git
    cd ./node-3tier-app
    cd ./web
    mkdir ./log
    npm config set registry http://registry.npmjs.org/  
    npm config set strict-ssl false
    npm install
  EOH
end