package com.dreeling.applications.ocelli.server.core;

import io.dropwizard.Application;
import io.dropwizard.setup.Bootstrap;
import io.dropwizard.setup.Environment;

import javax.servlet.Servlet;

import org.eclipse.jetty.servlet.ServletHolder;

import com.dreeling.applications.ocelli.server.resources.HelloWorldResource;
import com.dreeling.applications.ocelli.server.ssh.SSHAppService;
import com.dreeling.applications.ocelli.server.websocket.raw.SSHDataWebSocketServlet;

public class OcelliServer extends Application<OcelliServerConfiguration> {
	
	SSHAppService ssh = new SSHAppService("E:\\Downloads\\web\\ocelli.pem", "ec2-user", "ec2-54-187-127-192.us-west-2.compute.amazonaws.com");
		
	public static void main(String[] args) throws Exception {
		new OcelliServer().run(args);
	}

	@Override
	public String getName() {
		return "ocelli-server";
	}

	@Override
	public void initialize(Bootstrap<OcelliServerConfiguration> bootstrap) {
		// nothing to do yet
	}

	@Override
	public void run(OcelliServerConfiguration configuration,
			Environment environment) {
		
		final HelloWorldResource resource = new HelloWorldResource(
		        configuration.getTemplate(),
		        configuration.getDefaultName()
		    );
		    environment.jersey().register(resource);
		 // Add a websocket to a specific path spec
	        ServletHolder holderEvents = new ServletHolder("ws-events", (Class<? extends Servlet>) SSHDataWebSocketServlet.class);
		    environment.getApplicationContext().addServlet(holderEvents, "/rawEventSocket");
	}

	public OcelliServer() {
		super();
		// TODO Auto-generated constructor stub
	}

}
