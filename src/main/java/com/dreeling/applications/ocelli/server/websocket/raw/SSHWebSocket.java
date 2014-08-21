package com.dreeling.applications.ocelli.server.websocket.raw;

import org.eclipse.jetty.websocket.api.Session;
import org.eclipse.jetty.websocket.api.WebSocketAdapter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.dreeling.applications.ocelli.server.core.OcelliServer;
import com.dreeling.applications.ocelli.server.ssh.SSHAppService;

public class SSHWebSocket extends WebSocketAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(SSHWebSocket.class);
	
	private final SSHAppService ssh = new SSHAppService(null,
			null, null,"ec2-user",
			null, null,null);
	
	@Override
	public void onWebSocketConnect(Session sess) {
		super.onWebSocketConnect(sess);
		logger.debug("Socket Connected: " + sess);
	}

	@Override
	public void onWebSocketText(String message) {
		super.onWebSocketText(message);
		logger.debug("Received TEXT message: " + message);
		ssh.streamData();
	}

	@Override
	public void onWebSocketClose(int statusCode, String reason) {
		super.onWebSocketClose(statusCode, reason);
		logger.debug("Socket Closed: [" + statusCode + "] " + reason);
	}

	@Override
	public void onWebSocketError(Throwable cause) {
		super.onWebSocketError(cause);
		cause.printStackTrace(System.err);
	}
}