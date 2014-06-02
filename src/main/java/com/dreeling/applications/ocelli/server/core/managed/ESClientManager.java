package com.dreeling.applications.ocelli.server.core.managed;

import io.dropwizard.lifecycle.Managed;

import org.elasticsearch.client.Client;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.ImmutableSettings;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.common.transport.TransportAddress;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.dreeling.applications.ocelli.server.core.connectors.ElasticSearchConnector;

import java.util.List;

import static com.google.common.collect.Lists.newArrayList;

/**
 * Elasticsearch client factory bean that returns a client instance. You are responsible for closing the client when
 * you are done with it. Client objects are expensive to use and should be reused within your application.
 * <p/>
 * The host string most be of format "host1:port1,host2:port2"
 * The cluster name must be the name of the cluster than runs on the provided host(s)
 */
public class ESClientManager implements Managed {
    private static final Logger logger = LoggerFactory.getLogger(ESClientManager.class);
    private static final int DEFAULT_ELASTICSEARCH_PORT = 9300;

    private final String host;
    private final String clusterName;
    private Client client;

    public ESClientManager(String host, String clusterName) {
        this.host = host;
        this.clusterName = clusterName;
    }

    private static TransportAddress[] getTransportAddresses(String unicastHosts) {
        List<TransportAddress> transportAddresses = newArrayList();

        for (String unicastHost : unicastHosts.split(",")) {
            int port = DEFAULT_ELASTICSEARCH_PORT;
            String serverName = unicastHost;
            if (unicastHost.contains(":")) {
                String[] splitted = unicastHost.split(":");
                serverName = splitted[0];
                port = Integer.parseInt(splitted[1].trim());
            }
            transportAddresses.add(new InetSocketTransportAddress(serverName.trim(), port));
        }

        return transportAddresses.toArray(new TransportAddress[transportAddresses.size()]);
    }

    public ElasticSearchConnector obtainClient() {
    	
        return new ElasticSearchConnector(this.client);
    }

    public void start() throws Exception {
        Settings settings = ImmutableSettings.settingsBuilder().put("cluster.name", clusterName).build();

        logger.debug("Settings used for connection to elasticsearch : {}", settings.toDelimitedString('#'));

        TransportAddress[] addresses = getTransportAddresses(host);

        logger.debug("Hosts used for transport client : {}", (Object) addresses);

        this.client = new TransportClient(settings).addTransportAddresses(addresses);
    }

    public void stop() throws Exception {
        this.client.close();
    }
}
