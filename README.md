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
