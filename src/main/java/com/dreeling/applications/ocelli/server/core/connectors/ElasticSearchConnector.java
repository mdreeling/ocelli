package com.dreeling.applications.ocelli.server.core.connectors;

import static org.elasticsearch.node.NodeBuilder.nodeBuilder;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.elasticsearch.client.Client;
import org.elasticsearch.node.Node;
import static org.elasticsearch.node.NodeBuilder.*;

public class ElasticSearchConnector {
	Client client;
	Node node1;

	public ElasticSearchConnector() {

		Node node1 = nodeBuilder().clusterName("elasticsearch").client(true)
				.node();
		client = node1.client();
	}

	public static Map<String, Object> putJsonDocument(String data,
			Date postDate, String user) {

		Map<String, Object> jsonDocument = new HashMap<String, Object>();

		jsonDocument.put("ocelli-data", data);
		jsonDocument.put("author", postDate);
		jsonDocument.put("streamed-by", user);

		return jsonDocument;
	}

	public void postElasticSearch(String node, String data, String user) {
		client.prepareIndex("sshsessions", "sessiondata")
				.setSource(putJsonDocument(data, new Date(), user)).execute()
				.actionGet();
	}
}