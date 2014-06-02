package com.dreeling.applications.ocelli.server.resources;

import java.util.concurrent.atomic.AtomicLong;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import org.quartz.SchedulerException;

import com.codahale.metrics.annotation.Timed;
import com.dreeling.applications.ocelli.server.core.managed.ESClientManager;
import com.dreeling.applications.ocelli.server.core.managed.SSHStreamManager;
import com.dreeling.applications.ocelli.server.dto.CollectionJob;
import com.dreeling.applications.ocelli.server.dto.Saying;
import com.google.common.base.Optional;

@Path("/collect")
@Produces(MediaType.APPLICATION_JSON)
public class CollectionResource {
    private final String template;
    private final String defaultName;
    private final AtomicLong counter;
    SSHStreamManager mgr;
    ESClientManager esMgr;
    
    public CollectionResource(String template, String defaultName, SSHStreamManager mgr, ESClientManager esMgr) {
        this.template = template;
        this.defaultName = defaultName;
        this.counter = new AtomicLong();
        this.mgr = mgr;
        this.esMgr = esMgr;
    }

    @GET
    @Timed
    public CollectionJob initiateCollection(@QueryParam("app_id") Optional<String> name,@QueryParam("env_id") Optional<String> environment) {
        final String value = String.format(template, name.or(defaultName));
        try {
        	this.mgr.scheduleAdHocJob(esMgr);
		} catch (SchedulerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        return new CollectionJob(counter.incrementAndGet(), value);
    }
}
