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
        	
        	ESClientManager externalInstance= (ESClientManager)context.getScheduler().getContext().get("externalInstance");
            doJob(context.getJobDetail().getJobDataMap(), externalInstance);
            
        } catch (SchedulerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
            timerContext.stop();
        }
    }

    public abstract void doJob(JobDataMap jobDataMap, ESClientManager mgr);
}
