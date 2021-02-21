apt update
apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt update
apt install docker-ce -y
curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
#rm -r monitoramento/
#docker rm -f $(docker ps -a -q)
#docker volume prune --force
git clone https://github.com/mirandait-services/monitoramento
read -p 'Por gentileza insira o endereço IP ou URL que sera utilizada para acesso ao Graylog: ' IP_SERVER
echo IP_SERVER=http://$IP_SERVER:9000/ > monitoramento/ambiente/var.env
docker-compose --env-file monitoramento/ambiente/var.env -f monitoramento/ambiente/docker-compose.yml up -d
