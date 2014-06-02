package com.dreeling.applications.ocelli.server.websocket.raw;

import org.eclipse.jetty.websocket.api.Session;
import org.eclipse.jetty.websocket.api.WebSocketAdapter;

import com.dreeling.applications.ocelli.server.ssh.SSHAppService;

public class SSHWebSocket extends WebSocketAdapter {
	
	private final SSHAppService ssh = new SSHAppService(
			"E:\\Downloads\\web\\ocelli.pem", "ec2-user",
			"ec2-54-187-127-192.us-west-2.compute.amazonaws.com", null);
	
	@Override
	public void onWebSocketConnect(Session sess) {
		super.onWebSocketConnect(sess);
		System.out.println("Socket Connected: " + sess);
	}

	@Override
	public void onWebSocketText(String message) {
		super.onWebSocketText(message);
		System.out.println("Received TEXT message: " + message);
		ssh.streamData();
	}

	@Override
	public void onWebSocketClose(int statusCode, String reason) {
		super.onWebSocketClose(statusCode, reason);
		System.out.println("Socket Closed: [" + statusCode + "] " + reason);
	}

	@Override
	public void onWebSocketError(Throwable cause) {
		super.onWebSocketError(cause);
		cause.printStackTrace(System.err);
	}
}