package com.dreeling.applications.ocelli.server.websocket.raw;

import org.eclipse.jetty.websocket.servlet.WebSocketServlet;
import org.eclipse.jetty.websocket.servlet.WebSocketServletFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.dreeling.applications.ocelli.server.ssh.SSHAppService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.protobuf.ProtoTypeAdapter;
import com.google.protobuf.GeneratedMessage;

@SuppressWarnings("serial")
public class SSHDataWebSocketServlet extends WebSocketServlet {

	@SuppressWarnings("unused")
	private static final Logger LOGGER = LoggerFactory
			.getLogger(SSHDataWebSocketServlet.class);

	@SuppressWarnings("unused")
	private static final Gson gson = new GsonBuilder()
			.registerTypeHierarchyAdapter(GeneratedMessage.class,
					new ProtoTypeAdapter()).create();

	@SuppressWarnings("unused")

	@Override
	public void configure(WebSocketServletFactory factory) {
		factory.register(SSHWebSocket.class);
	}
}
