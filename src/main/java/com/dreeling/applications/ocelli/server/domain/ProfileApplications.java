package com.dreeling.applications.ocelli.server.domain;

// Generated May 27, 2014 9:55:07 PM by Hibernate Tools 3.4.0.CR1

/**
 * ProfileApplications generated by hbm2java
 */
public class ProfileApplications implements java.io.Serializable {

	private int profileId;
	private Application application;
	private Profile profile;

	public ProfileApplications() {
	}

	public ProfileApplications(Application application, Profile profile) {
		this.application = application;
		this.profile = profile;
	}

	public int getProfileId() {
		return this.profileId;
	}

	public void setProfileId(int profileId) {
		this.profileId = profileId;
	}

	public Application getApplication() {
		return this.application;
	}

	public void setApplication(Application application) {
		this.application = application;
	}

	public Profile getProfile() {
		return this.profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

}