docker-machine create --driver virtualbox Char1
docker-machine create --driver virtualbox Char2
docker-machine ssh Char1 "docker swarm init --advertise-addr $(docker-machine ip Char1)"
docker-machine ssh Char2 "docker swarm join \
--token $(docker swarm join-token worker -q) \
$(docker-machine ip Char2):2377"
docker stack deploy -c docker-compose.yml getstartedlab
