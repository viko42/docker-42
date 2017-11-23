docker run --name mysqlDB -e MYSQL_ROOT_PASSWORD=admin -d mysql
docker run --name prestashop --link mysqlDB -e DB_SERVER=mysqlDB -p 8080:80 -d prestashop/prestashop
