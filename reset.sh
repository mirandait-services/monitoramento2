rm -r monitoramento2/
docker rm -f $(docker ps -a -q)
docker volume prune --force
git clone https://github.com/mirandait-services/monitoramento2
chmod +x monitoramento2/setup.sh
./monitoramento2/setup.sh