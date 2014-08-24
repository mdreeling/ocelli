package com.dreeling.applications.ocelli.server.core;

import io.dropwizard.Application;
import io.dropwizard.jdbi.DBIFactory;
import io.dropwizard.setup.Bootstrap;
import io.dropwizard.setup.Environment;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.Servlet;

import org.eclipse.jetty.servlet.ServletHolder;
import org.skife.jdbi.v2.DBI;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.dreeling.applications.ocelli.server.core.connectors.ESHealthCheck;
import com.dreeling.applications.ocelli.server.core.managed.ESClientManager;
import com.dreeling.applications.ocelli.server.core.managed.SSHStreamManager;
import com.dreeling.applications.ocelli.server.dao.ApplicationDao;
import com.dreeling.applications.ocelli.server.dao.ArtifactInfoDao;
import com.dreeling.applications.ocelli.server.dao.UserDao;
import com.dreeling.applications.ocelli.server.jobs.scheduler.JobsBundle;
import com.dreeling.applications.ocelli.server.resources.CollectionResource;
import com.dreeling.applications.ocelli.server.websocket.raw.SSHDataWebSocketServlet;
import com.newrelic.api.agent.NewRelic;
import com.newrelic.api.agent.Trace;

public class OcelliServer extends Application<OcelliServerConfiguration> {

	private static final Logger logger = LoggerFactory
			.getLogger(OcelliServer.class);

	public static int TRANSACTIONS_PER_SECOND = 0;
	public static int TOTAL_TRANSACTIONS = 0;
	public static long TOTAL_TRANSACTION_TIME = 0;
	public static long START_TIME = 0;
	private static PrintWriter WRITER;
	private static PrintWriter AVG_WRITER;
	private static OcelliServerConfiguration config;
	public static boolean KILL_ALL_JOBS = false;

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
		logger.debug("Bootstrapping...");
		JobsBundle bdl = new JobsBundle(
				"com.dreeling.applications.ocelli.server.jobs");
		bootstrap.addBundle(bdl);
	}

	@Override
	public void run(OcelliServerConfiguration configuration,
			Environment environment) {

		try {
			config = configuration;
			WRITER = new PrintWriter("tps_detail.out", "UTF-8");
			AVG_WRITER = new PrintWriter("tps_avg.out", "UTF-8");
			
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
					appDao, artDao, dao);

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
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public OcelliServer() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Trace
	public static void addTransaction(long start, long end, String user,
			String node) {

		synchronized (OcelliServer.class) {
			long timePeriodMillis = end - START_TIME;
			NewRelic.setTransactionName(null, "/es-post");
			NewRelic.setUserName(user);
			NewRelic.addCustomParameter("node", node);
			NewRelic.incrementCounter("Custom/ElasticSearchPost");
			NewRelic.recordMetric("Custom/ESPostTime",(end=start));
			
			if (config.getSimulationMode()) {
				TOTAL_TRANSACTIONS++;
				int tps = 0;
				if ((int) timePeriodMillis / 1000 > 0) {
					tps = TOTAL_TRANSACTIONS / ((int) timePeriodMillis / 1000);
				}
				TOTAL_TRANSACTION_TIME+=tps;
				if (tps > 0
						&& TOTAL_TRANSACTIONS % config.getTpsCheckInterval() == 0) {
					WRITER.println("" + tps + "("+TOTAL_TRANSACTION_TIME/TOTAL_TRANSACTIONS+" avg)");
					WRITER.flush();
				}

				if (config.getSimulationRunTimeMillis() != 0
						&& timePeriodMillis > config
								.getSimulationRunTimeMillis()) {
					KILL_ALL_JOBS = true;
				}
			}
		}

	}
}
