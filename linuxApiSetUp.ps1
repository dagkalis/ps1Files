# set up api for wsl2, ubuntu2204 
netsh interface portproxy add v4tov4 listenport=4000 listenaddress=192.168.0.84 connectport=4000 connectaddress=$(wsl hostname -I)