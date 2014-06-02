package com.dreeling.applications.ocelli.server.core.managed;

import io.dropwizard.lifecycle.Managed;

import java.lang.annotation.Annotation;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.quartz.CronScheduleBuilder;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;
import org.reflections.Reflections;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.dreeling.applications.ocelli.server.jobs.scheduler.AdHocJob;
import com.dreeling.applications.ocelli.server.jobs.scheduler.Job;
import com.google.common.collect.Sets;

/**
 * An adaptation of dropwizard-job for adhoc jobs.
 * 
 * @author Michael Dreeling
 * 
 */
public class SSHStreamManager implements Managed {

	private static final Logger log = LoggerFactory
			.getLogger(SSHStreamManager.class);
	protected Reflections reflections = null;
	protected Scheduler scheduler;

	public SSHStreamManager() {
		this("");
	}

	public SSHStreamManager(String scanUrl) {
		reflections = new Reflections(scanUrl);
	}

	public void start() throws Exception {
		scheduler = StdSchedulerFactory.getDefaultScheduler();
		scheduler.start();
	}

	public void stop() throws Exception {
		// this is enough to put the job into the queue, otherwise the jobs wont
		// be executed
		// anyone got a better solution?
		Thread.sleep(100);

		scheduler.shutdown(true);
	}

	protected List<Class<? extends Job>> getJobClasses(
			Class<? extends Annotation> annotation) {
		Set<Class<? extends Job>> jobs = reflections.getSubTypesOf(Job.class);
		Set<Class<?>> annotatedClasses = reflections
				.getTypesAnnotatedWith(annotation);

		return Sets
				.intersection(new HashSet<Class<? extends Job>>(jobs),
						annotatedClasses).immutableCopy().asList();
	}

	public void scheduleAdHocJob(ESClientManager es) throws SchedulerException {
		List<Class<? extends Job>> startJobClasses = getJobClasses(AdHocJob.class);
		log.info("Jobs to run on application start: " + startJobClasses);
		for (Class<? extends org.quartz.Job> clazz : startJobClasses) {
			JobBuilder jobBuilder = JobBuilder.newJob(clazz);
			JobDetail jd = jobBuilder.build();
			jd.getJobDataMap().put("app-id", 99999);
			scheduler.getContext().put("externalInstance", es);
			scheduler.scheduleJob(jd, executeNowTrigger());
		}
	}

	protected Trigger executeNowTrigger() {
		return TriggerBuilder.newTrigger().startNow().build();
	}
}
