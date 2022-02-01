##PS.: The app should not run as root for security reassons
##PS.: This should be modularized, this recipe is doing too much stuff
##PS.: The app output should be sent do the log dir and this should be consumed by c.w

bash 'app_setup' do
  user 'root'
  cwd '/root'
  code <<-EOH
    ##smelly code
    kill $(pidof node)
    cd ./node-3tier-app/
    git pull
    HOST=`hostname | grep -i frontend`
    if [ -z "$HOST" ]
    then
            cd ./api
    else
            cd ./web
    fi
    mkdir ./log
    npm config set registry http://registry.npmjs.org/  
    npm config set strict-ssl false
    npm install
    nohup npm start &
  EOH
end