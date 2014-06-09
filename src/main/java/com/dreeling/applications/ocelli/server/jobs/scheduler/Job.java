package com.dreeling.applications.ocelli.server.jobs.scheduler;

import static com.codahale.metrics.MetricRegistry.name;

import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.SchedulerException;

import com.codahale.metrics.MetricRegistry;
import com.codahale.metrics.SharedMetricRegistries;
import com.codahale.metrics.Timer;
import com.codahale.metrics.Timer.Context;
import com.dreeling.applications.ocelli.server.core.managed.ESClientManager;
import com.dreeling.applications.ocelli.server.domain.User;
import com.dreeling.applications.ocelli.server.dto.ArtifactInfoDTO;
import com.dreeling.applications.ocelli.server.util.Utils;

public abstract class Job implements org.quartz.Job {
    public static final String DROPWIZARD_JOBS_KEY = "dropwizard-jobs";

    private final Timer timer;

    public Job() {
        // get the metrics registry which was shared during bundle instantiation
        this(SharedMetricRegistries.getOrCreate(DROPWIZARD_JOBS_KEY));
    }

    public Job(MetricRegistry metricRegistry) {
        timer = metricRegistry.timer(name(getClass(), getClass().getName()));
    }

    public void execute(JobExecutionContext context) throws JobExecutionException {
        Context timerContext = timer.time();
        try {
        	
        	ESClientManager esMgr= (ESClientManager)context.getScheduler().getContext().get(Utils.ELASTIC_SEARCH_INSTANCE);
        	ArtifactInfoDTO art= (ArtifactInfoDTO)context.getScheduler().getContext().get(Utils.ARTIFACT_INFO);
        	User user = (User)context.getScheduler().getContext().get(Utils.USER_INFO);
            doJob(context.getJobDetail().getJobDataMap(), esMgr, art,user);
            
        } catch (SchedulerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
            timerContext.stop();
        }
    }

    public abstract void doJob(JobDataMap jobDataMap, ESClientManager mgr, ArtifactInfoDTO art, User user);
}
