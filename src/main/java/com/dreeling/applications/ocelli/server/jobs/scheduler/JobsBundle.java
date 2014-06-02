package com.dreeling.applications.ocelli.server.jobs.scheduler;

import io.dropwizard.Application;
import io.dropwizard.Bundle;
import io.dropwizard.setup.Bootstrap;
import io.dropwizard.setup.Environment;

import com.codahale.metrics.SharedMetricRegistries;
import com.dreeling.applications.ocelli.server.core.OcelliServer;
import com.dreeling.applications.ocelli.server.core.managed.SSHStreamManager;

public class JobsBundle implements Bundle {
	
	SSHStreamManager jobManager;
	
    protected String scanURL = null;
    Bootstrap<?> bts;
    
    public void initialize(Bootstrap<?> bootstrap) {
        // add shared metrics registry to be used by Jobs, since defaultRegistry
        // has been removed
        SharedMetricRegistries.add(Job.DROPWIZARD_JOBS_KEY,
                bootstrap.getMetricRegistry());
        this.bts = bootstrap;
    }

    public JobsBundle() {
    }

    public JobsBundle(String scanURL) {
        this.scanURL = scanURL;
    }

    public void run(Environment environment) {
    	jobManager = new SSHStreamManager(scanURL);
        environment.lifecycle().manage(jobManager);
        Application<?> app = bts.getApplication();
        ((OcelliServer)app).setStreamManger(jobManager);
    }
}
