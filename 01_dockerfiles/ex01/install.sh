docker build -t ex01Image . && docker run --name ex01 -it -p 9987:9987/udp -p 30033:30033 -p 10011:10011 -d ex01Image && docker logs ex01
