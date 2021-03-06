package com.dreeling.applications.ocelli.server.resources;

import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import org.quartz.SchedulerException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.codahale.metrics.annotation.Timed;
import com.dreeling.applications.ocelli.server.core.OcelliServer;
import com.dreeling.applications.ocelli.server.core.managed.ESClientManager;
import com.dreeling.applications.ocelli.server.core.managed.SSHStreamManager;
import com.dreeling.applications.ocelli.server.dao.ApplicationDao;
import com.dreeling.applications.ocelli.server.dao.ArtifactInfoDao;
import com.dreeling.applications.ocelli.server.dao.UserDao;
import com.dreeling.applications.ocelli.server.domain.Application;
import com.dreeling.applications.ocelli.server.domain.User;
import com.dreeling.applications.ocelli.server.dto.ArtifactInfoDTO;
import com.dreeling.applications.ocelli.server.dto.CollectionJobDTO;
import com.google.common.base.Optional;

@Path("/collect")
@Produces(MediaType.APPLICATION_JSON)
public class CollectionResource {
	
	private static final Logger logger = LoggerFactory.getLogger(CollectionResource.class);
	private final String template;
	private final String defaultName;
	private final AtomicLong counter;
	SSHStreamManager mgr;
	ESClientManager esMgr;
	ApplicationDao dao;
	ArtifactInfoDao artDao;
	UserDao userDao;

	public CollectionResource(String template, String defaultName,
			SSHStreamManager mgr, ESClientManager esMgr, ApplicationDao dao,
			ArtifactInfoDao artDao,UserDao userDao) {
		this.template = template;
		this.defaultName = defaultName;
		this.counter = new AtomicLong();
		this.mgr = mgr;
		this.esMgr = esMgr;
		this.dao = dao;
		this.artDao = artDao;
		this.userDao = userDao;
	}

	@GET
	@Timed
	public CollectionJobDTO initiateCollection(
			@QueryParam("app_id") Optional<String> id,
			@QueryParam("env_id") Optional<String> environment) {
		
		//RESET
		OcelliServer.KILL_ALL_JOBS = false;
		OcelliServer.TOTAL_TRANSACTION_TIME=0;
		OcelliServer.TOTAL_TRANSACTIONS=0;
		OcelliServer.TRANSACTIONS_PER_SECOND=0;
		
		final String value = id.or("-1");
		try {

			Application app = dao.findById(value);
			User u = userDao.findByEmail("mdreeling@riotgames.com");
			
			if (app != null) {
				List<ArtifactInfoDTO> arts = artDao
						.findArtifactInfoByApplicationId(value);
				
				for (Iterator iterator = arts.iterator(); iterator.hasNext();) {
					ArtifactInfoDTO artifactInfoDTO = (ArtifactInfoDTO) iterator
							.next();
					logger.debug("[" + app.getAppName()+"] Scheduling data stream job from node "+artifactInfoDTO.getNodeName()+" for Artifact ["+artifactInfoDTO.getArtifactLocation()+"]");
					this.mgr.scheduleAdHocJob(esMgr,artifactInfoDTO,u);
				}
			} else {
				logger.error("App id " + value + " does not exist");
			}
		} catch (SchedulerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return new CollectionJobDTO(counter.incrementAndGet(), value);
	}
}
