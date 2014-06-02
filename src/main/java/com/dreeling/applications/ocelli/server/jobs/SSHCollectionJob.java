package com.dreeling.applications.ocelli.server.jobs;

import org.quartz.JobDataMap;

import com.dreeling.applications.ocelli.server.core.managed.ESClientManager;
import com.dreeling.applications.ocelli.server.jobs.scheduler.AdHocJob;
import com.dreeling.applications.ocelli.server.jobs.scheduler.Job;
import com.dreeling.applications.ocelli.server.ssh.SSHAppService;

@AdHocJob
public class SSHCollectionJob extends Job {

	public SSHCollectionJob() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void doJob(JobDataMap jobDataMap, ESClientManager mgr) {
		// logic run once on application start
		
		System.out.println("Hey Job "+jobDataMap.get("app-id"));
		final SSHAppService ssh = new SSHAppService(
				"E:\\Downloads\\web\\ocelli.pem", "ec2-user",
				"ec2-54-187-127-192.us-west-2.compute.amazonaws.com", mgr);
		ssh.streamData();
	}
}
