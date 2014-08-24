package com.dreeling.applications.ocelli.server.core.connectors;

import java.util.Collections;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import org.elasticsearch.client.Client;
import org.elasticsearch.node.Node;

import com.newrelic.api.agent.NewRelic;
import com.newrelic.api.agent.Request;
import com.newrelic.api.agent.Response;
import com.newrelic.api.agent.Trace;

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

	@Trace(dispatcher = true)
	public void postElasticSearch(String node, String data, String user) {
		
		NewRelic.setTransactionName(null, "/es-post");
		NewRelic.setUserName(user);
		NewRelic.addCustomParameter("node", node);
		NewRelic.incrementCounter("Custom/ElasticSearchPost");
		
		client.prepareIndex("ocellidata", "sessiondata")
				.setSource(putJsonDocument(node, data, new Date(), user))
				.execute().actionGet();
	}
}