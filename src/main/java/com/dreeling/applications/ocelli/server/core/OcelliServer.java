package com.dreeling.applications.ocelli.server.core;

import io.dropwizard.Application;
import io.dropwizard.jdbi.DBIFactory;
import io.dropwizard.setup.Bootstrap;
import io.dropwizard.setup.Environment;

import javax.servlet.Servlet;

import org.eclipse.jetty.servlet.ServletHolder;
import org.skife.jdbi.v2.DBI;

import com.dreeling.applications.ocelli.server.core.connectors.ElasticSearchConnector;
import com.dreeling.applications.ocelli.server.dao.UserDao;
import com.dreeling.applications.ocelli.server.domain.User;
import com.dreeling.applications.ocelli.server.resources.HelloWorldResource;
import com.dreeling.applications.ocelli.server.ssh.SSHAppService;
import com.dreeling.applications.ocelli.server.websocket.raw.SSHDataWebSocketServlet;

public class OcelliServer extends Application<OcelliServerConfiguration> {

	SSHAppService ssh = new SSHAppService("E:\\Downloads\\web\\ocelli.pem",
			"ec2-user", "ec2-54-187-127-192.us-west-2.compute.amazonaws.com");

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
				configuration.getTemplate(), configuration.getDefaultName());
		try {
			environment.jersey().register(resource);
			// Add a websocket to a specific path spec
			ServletHolder holderEvents = new ServletHolder("ws-events",
					(Class<? extends Servlet>) SSHDataWebSocketServlet.class);
			environment.getApplicationContext().addServlet(holderEvents,
					"/rawEventSocket");

			// DBIFactory factory = new DBIFactory();
			// final DBI jdbi = factory.build(env,
			// conf.getDatabaseConfiguration(), "postgresql");
			// using in-memory H2 database here for simplicity during
			// development
			final DBIFactory factory = new DBIFactory();
			final DBI jdbi = factory.build(environment,
					configuration.getDataSourceFactory(), "postgresql");
			final UserDao dao = jdbi.onDemand(UserDao.class);
			
			User u = dao.findByEmail("mdreeling@riotgames.com");
			System.out.println(u.getUserProfileses().size());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public OcelliServer() {
		super();
		// TODO Auto-generated constructor stub
	}

}
