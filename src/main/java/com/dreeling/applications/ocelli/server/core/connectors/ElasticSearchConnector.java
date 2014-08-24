package com.dreeling.applications.ocelli.server.core.connectors;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.elasticsearch.client.Client;
import org.elasticsearch.node.Node;

public class ElasticSearchConnector {
	Client client;
	Node node1;

	public ElasticSearchConnector(Client client) {
		this.client = client;
	}

	public static Map<String, Object> putJsonDocument(String node, String data,
			Date postDate, String user) {

		Map<String, Object> jsonDocument = new HashMap<String, Object>();

		jsonDocument.put("record", data);
		jsonDocument.put("timestamp", postDate);
		jsonDocument.put("streamed-by", user);
		jsonDocument.put("node", user);

		return jsonDocument;
	}

	public void postElasticSearch(String node, String data, String user) {
		client.prepareIndex("ocellidata", "sessiondata")
				.setSource(putJsonDocument(node, data, new Date(), user)).execute()
				.actionGet();
	}
}