package com.dreeling.applications.ocelli.server.core;

import io.dropwizard.Configuration;
import io.dropwizard.db.DataSourceFactory;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonProperty;

public class OcelliServerConfiguration extends Configuration {

	@NotEmpty
	private String elasticsearchHost = "localhost:9200";

	@NotEmpty
	private String clusterName = "elasticsearch";

	@Valid
	@NotNull
	@JsonProperty
	private DataSourceFactory database = new DataSourceFactory();

	private long tpsCheckInterval = 1500;
	private long simulationRunTimeMillis;
	private boolean simulationMode = false;

	@JsonProperty
	public boolean getSimulationMode() {
		return simulationMode;
	}

	public void setSimulationMode(boolean simulationMode) {
		this.simulationMode = simulationMode;
	}

	@NotEmpty
	private String template;

	@JsonProperty
	public long getTpsCheckInterval() {
		return tpsCheckInterval;
	}

	public void setTpsCheckInterval(long tpsCheckInterval) {
		this.tpsCheckInterval = tpsCheckInterval;
	}

	@JsonProperty
	public long getSimulationRunTimeMillis() {
		return simulationRunTimeMillis;
	}

	public void setSimulationRunTimeMillis(long simulationRunTimeMillis) {
		this.simulationRunTimeMillis = simulationRunTimeMillis;
	}

	@NotEmpty
	private String defaultName = "Stranger";

	@JsonProperty
	public String getClusterName() {
		return clusterName;
	}

	public DataSourceFactory getDataSourceFactory() {
		return database;
	}

	@JsonProperty
	public String getDefaultName() {
		return defaultName;
	}

	@JsonProperty
	public String getElasticsearchHost() {
		return elasticsearchHost;
	}

	@JsonProperty
	public String getTemplate() {
		return template;
	}

	@JsonProperty
	public void setClusterName(String clusterName) {
		this.clusterName = clusterName;
	}

	@JsonProperty
	public void setDefaultName(String name) {
		this.defaultName = name;
	}

	@JsonProperty
	public void setElasticsearchHost(String elasticsearchHost) {
		this.elasticsearchHost = elasticsearchHost;
	}

	@JsonProperty
	public void setTemplate(String template) {
		this.template = template;
	}

}