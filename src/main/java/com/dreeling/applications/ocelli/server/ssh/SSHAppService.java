package com.dreeling.applications.ocelli.server.ssh;

import java.io.IOException;
import java.io.InputStream;

import com.dreeling.applications.ocelli.server.core.connectors.ElasticSearchConnector;
import com.dreeling.applications.ocelli.server.core.managed.ESClientManager;
import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;

public class SSHAppService {

	ElasticSearchConnector n;

	Session session = null;
	String artifactLocation;
	public SSHAppService(String privateKey, String publicKey,
			String passPhrase, String user, String host, ESClientManager mgr, String artifactLocation) {
		super();
		try {
			JSch jsch = new JSch();
			JSch.setConfig("StrictHostKeyChecking", "no");
			jsch.addIdentity("key-pair", privateKey.getBytes(), publicKey.getBytes(), (byte[])null);
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

			String command = "tail -100000 "+artifactLocation;
			Channel channel = session.openChannel("exec");
			((ChannelExec) channel).setCommand(command);
			channel.setInputStream(null);
			((ChannelExec) channel).setErrStream(System.err);
			InputStream in = channel.getInputStream();

			channel.connect();

			InputStream input = channel.getInputStream();
			// start reading the input from the executed commands on the shell
			byte[] tmp = new byte[1024];
			System.out.println("Loading data to Elastic Search @"
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
					System.out.println("exit-status: "
							+ channel.getExitStatus());
					break;
				}
			}

			channel.disconnect();
			session.disconnect();
		} catch (JSchException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
