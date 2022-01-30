##PS.: The app should not run as root for security reassons
##PS.: This should be modularized, this recipe is doing too much stuff

bash 'app_setup' do
  user 'root'
  cwd '/root'
  code <<-EOH
    curl -sL https://rpm.nodesource.com/setup_14.x | sudo bash -
    sudo yum install -y nodejs
    yum install  npm
    npm install -g npm
    git clone https://github.com/persanBR/node-3tier-app.git
    HOST=`hostname | grep -i frontend`
    if [ -z "$HOST" ]
    then
            cd ./node-3tier-app/api
    else
            cd ./node-3tier-app/web
    fi
    mkdir ./log
    npm config set registry http://registry.npmjs.org/  
    npm config set strict-ssl false
    npm install
    nohup npm start &
  EOH
end