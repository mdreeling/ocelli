#Ocelli

Ocelli Server - An open source SSH data retriever using JSch and WebSockets.

Ocelli is a lightweight server built using DropWizard which allows you to connect to multiple
SSH Server's at once and then stream data from them into ElasticSearch for perusal in real-time.

You just define Application profiles which describe where your log data resides, and Ocelli will 
stream them on demand.

#Requirements

Ocelli requires the following in order to function

* MySQL (Stores Application profiles and SSH Server information)
* ElasticSearch (Document Storage) 
* Kibana (UI)

#Running via Docker

On a Docker enabled host

* sudo docker build -t mdreeling/ocelli-server github.com/mdreeling/ocelli
* sudo docker run -p 80:80 mdreeling/ocelli-server

or alternatively

sudo docker pull mdreeling/ocelli-server

* sudo docker run -i -t -p 80:80 -p 8090:8090 mdreeling/ocelli-server:latest /usr/bin/start-server

To update a box already running Ocelli to the latest GitHub version and run it

* sudo docker build -t mdreeling/ocelli-server github.com/mdreeling/ocelli
* sudo docker run -i -d -t -p 80:80 -p 8090:8090 mdreeling/ocelli-server:latest /usr/bin/start-server
