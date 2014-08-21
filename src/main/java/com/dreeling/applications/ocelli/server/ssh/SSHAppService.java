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
	
	private static final Logger logger = LoggerFactory.getLogger(SSHAppService.class);
	
	ElasticSearchConnector n;

	Session session = null;
	String artifactLocation;

	public SSHAppService(String privateKey, String publicKey,
			String passPhrase, String user, String host, ESClientManager mgr,
			String artifactLocation) {
		super();
		try {
			
			logger.debug("Connecting to "+host+" as "+user);
			
			JSch jsch = new JSch();
			JSch.setConfig("StrictHostKeyChecking", "no");
			
			/**
			 * Just load the private key here - nothing else is required.
			 */
			jsch.addIdentity("key-pair", privateKey.getBytes(),
					(byte[])null, (byte[])null);
					
			session = jsch.getSession(user, host, 22);
			n = mgr.obtainClient();
			this.artifactLocation = artifactLocation;
		} catch (JSchException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 
	 */
	public void streamData() {
		try {
			// run stuff
			session.connect();
			
			logger.debug("Connected to "+session.getHost()+" as "+session.getUserName());
			
			String command = "tail -100000 " + artifactLocation;
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
				while (input.available() > 0) {
					int i = input.read(tmp, 0, 1024);
					if (i < 0)
						break;
					n.postElasticSearch(session.getHost(),
							new String(tmp, 0, i), session.getUserName());
				}
				if (channel.isClosed()) {
					logger.error("exit-status: "
							+ channel.getExitStatus());
					break;
				}
			}

			channel.disconnect();
			session.disconnect();
		} catch (JSchException e) {
			logger.error("JSchException while connecting and streaming ["+artifactLocation+"] from "+session.getHost(), e);
		} catch (IOException e) {
			logger.error("IOException while connecting and streaming ["+artifactLocation+"] from "+session.getHost(), e);
		}
	}
}
