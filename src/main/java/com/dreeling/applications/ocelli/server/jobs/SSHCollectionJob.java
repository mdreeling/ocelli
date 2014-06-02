package com.dreeling.applications.ocelli.server.jobs;

import org.quartz.JobDataMap;

import com.dreeling.applications.ocelli.server.core.managed.ESClientManager;
import com.dreeling.applications.ocelli.server.domain.User;
import com.dreeling.applications.ocelli.server.dto.ArtifactInfoDTO;
import com.dreeling.applications.ocelli.server.jobs.scheduler.AdHocJob;
import com.dreeling.applications.ocelli.server.jobs.scheduler.Job;
import com.dreeling.applications.ocelli.server.ssh.SSHAppService;

@AdHocJob
public class SSHCollectionJob extends Job {

	public SSHCollectionJob() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void doJob(JobDataMap jobDataMap, ESClientManager mgr, ArtifactInfoDTO art, User user) {
		final SSHAppService ssh = new SSHAppService(art.getNodeAccessKeyData(),user.getAccessKey(),null, art.getNodePrincipal(),
				art.getNodeName(), mgr,art.getArtifactLocation());
		ssh.streamData();
	}
}
