package com.dreeling.applications.ocelli.server.domain;

// Generated May 27, 2014 9:55:07 PM by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * User generated by hbm2java
 */
public class User implements java.io.Serializable {

	private String userId;
	private String email;
	private String password;
	private Date createTime;
	private Set<UserProfiles> userProfileses = new HashSet<UserProfiles>(0);

	public User() {
	}

	public User(String userId, String email, String password, Date createTime) {
		this.userId = userId;
		this.email = email;
		this.password = password;
		this.createTime = createTime;
	}

	public User(String userId, String email, String password, Date createTime,
			Set<UserProfiles> userProfileses) {
		this.userId = userId;
		this.email = email;
		this.password = password;
		this.createTime = createTime;
		this.userProfileses = userProfileses;
	}

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Set<UserProfiles> getUserProfileses() {
		return this.userProfileses;
	}

	public void setUserProfileses(Set<UserProfiles> userProfileses) {
		this.userProfileses = userProfileses;
	}

}