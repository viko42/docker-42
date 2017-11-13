docker rm ts3container
docker build -t ts3 . && docker run --name ts3container -t -i -d -p 9987:9987/udp -p 30033:30033 -p 10011:10011 ts3
docker logs ts3container
