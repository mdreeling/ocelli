package com.dreeling.applications.ocelli.server.core;

import io.dropwizard.Application;
import io.dropwizard.jdbi.DBIFactory;
import io.dropwizard.setup.Bootstrap;
import io.dropwizard.setup.Environment;

import javax.servlet.Servlet;

import org.eclipse.jetty.servlet.ServletHolder;
import org.skife.jdbi.v2.DBI;

import com.dreeling.applications.ocelli.server.core.connectors.ESHealthCheck;
import com.dreeling.applications.ocelli.server.core.managed.ESClientManager;
import com.dreeling.applications.ocelli.server.core.managed.SSHStreamManager;
import com.dreeling.applications.ocelli.server.dao.ApplicationDao;
import com.dreeling.applications.ocelli.server.dao.ArtifactInfoDao;
import com.dreeling.applications.ocelli.server.dao.UserDao;
import com.dreeling.applications.ocelli.server.domain.User;
import com.dreeling.applications.ocelli.server.jobs.scheduler.JobsBundle;
import com.dreeling.applications.ocelli.server.resources.CollectionResource;
import com.dreeling.applications.ocelli.server.websocket.raw.SSHDataWebSocketServlet;

public class OcelliServer extends Application<OcelliServerConfiguration> {

	SSHStreamManager mgr;

	public static void main(String[] args) throws Exception {
		new OcelliServer().run(args);
	}

	@Override
	public String getName() {
		return "ocelli-server";
	}

	/**
	 * 
	 * @param mgr
	 */
	public void setStreamManger(SSHStreamManager mgr) {
		this.mgr = mgr;
	}

	@Override
	public void initialize(Bootstrap<OcelliServerConfiguration> bootstrap) {
		System.out.println("Bootstrapping...");
		JobsBundle bdl = new JobsBundle(
				"com.dreeling.applications.ocelli.server.jobs");
		bootstrap.addBundle(bdl);
	}

	@Override
	public void run(OcelliServerConfiguration configuration,
			Environment environment) {

		try {

			final DBIFactory factory = new DBIFactory();
			final DBI jdbi = factory.build(environment,
					configuration.getDataSourceFactory(), "postgresql");
			final UserDao dao = jdbi.onDemand(UserDao.class);
			final ApplicationDao appDao = jdbi.onDemand(ApplicationDao.class);
			final ArtifactInfoDao artDao = jdbi.onDemand(ArtifactInfoDao.class);

			ESClientManager esClientManager = new ESClientManager(
					configuration.getElasticsearchHost(),
					configuration.getClusterName());
			environment.lifecycle().manage(esClientManager);

			final CollectionResource resource = new CollectionResource(
					configuration.getTemplate(),
					configuration.getDefaultName(), mgr, esClientManager,
					appDao, artDao,dao);

			environment.jersey().register(resource);
			// Add a websocket to a specific path spec
			ServletHolder holderEvents = new ServletHolder("ws-events",
					(Class<? extends Servlet>) SSHDataWebSocketServlet.class);
			environment.getApplicationContext().addServlet(holderEvents,
					"/rawEventSocket");

			final ESHealthCheck esHealthCheck = new ESHealthCheck(
					esClientManager);
			environment.healthChecks().register("elasticsearch", esHealthCheck);

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
