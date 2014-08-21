package com.dreeling.applications.ocelli.server.ssh;

import java.io.IOException;
import java.io.InputStream;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.dreeling.applications.ocelli.server.core.connectors.ElasticSearchConnector;
import com.dreeling.applications.ocelli.server.core.managed.ESClientManager;
import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;

public class SSHAppService {

	private static final Logger logger = LoggerFactory
			.getLogger(SSHAppService.class);

	ElasticSearchConnector n;
	private boolean doDiscardNl;
	Session session = null;
	String artifactLocation;

	public SSHAppService(String privateKey, String publicKey,
			String passPhrase, String user, String host, ESClientManager mgr,
			String artifactLocation) {
		super();
		try {

			logger.debug("Connecting to " + host + " as " + user);

			JSch jsch = new JSch();
			JSch.setConfig("StrictHostKeyChecking", "no");

			/**
			 * Just load the private key here - nothing else is required.
			 */
			jsch.addIdentity("key-pair", privateKey.getBytes(), (byte[]) null,
					(byte[]) null);

			session = jsch.getSession(user, host, 22);
			n = mgr.obtainClient();
			this.artifactLocation = artifactLocation;
		} catch (JSchException e) {
			logger.error(
					"JSchException while connecting to " + session.getHost(), e);
		}
	}

	/**
	 * 
	 */
	public void streamData() {
		try {
			// run stuff
			session.connect();

			logger.debug("Connected to " + session.getHost() + " as "
					+ session.getUserName());
			
			/*
			 * By default tail 1GB of logs 
			 */
			String command = "tail -f -c 1000000000 " + artifactLocation;
			Channel channel = session.openChannel("exec");
			((ChannelExec) channel).setCommand(command);
			channel.setInputStream(null);
			((ChannelExec) channel).setErrStream(System.err);
			InputStream in = channel.getInputStream();

			channel.connect();

			InputStream input = channel.getInputStream();
			// start reading the input from the executed commands on the shell
			byte[] tmp = new byte[1024];
			logger.debug("Loading data to Elastic Search @"
					+ System.currentTimeMillis() + "...");
			while (true) {
				StringBuilder sb = new StringBuilder();
				int i;
				while (0 <= (i = input.read())) {
					if (i == '\n') {
						if (doDiscardNl) {
							doDiscardNl = false;
						} else {
							n.postElasticSearch(session.getHost(),
									sb.toString(), session.getUserName());

							sb.setLength(0);
						}
					} else {
						doDiscardNl = false;
						sb.append((char) i);
						if (i == '\r') {
							doDiscardNl = true;
							n.postElasticSearch(session.getHost(),
									sb.toString(), session.getUserName());

							sb.setLength(0);
						}
					}
				}

				if (channel.isClosed()) {
					logger.debug("** No more data on stream");
					logger.debug("exit-status: " + channel.getExitStatus());
					break;
				}

			}

			channel.disconnect();
			session.disconnect();
		} catch (JSchException e) {
			logger.error("JSchException while connecting and streaming ["
					+ artifactLocation + "] from " + session.getHost(), e);
		} catch (IOException e) {
			logger.error("IOException while connecting and streaming ["
					+ artifactLocation + "] from " + session.getHost(), e);
		}
	}
}
