package com.dreeling.applications.ocelli.server.dao;

import java.util.List;

import org.skife.jdbi.v2.sqlobject.Bind;
import org.skife.jdbi.v2.sqlobject.SqlQuery;
import org.skife.jdbi.v2.sqlobject.customizers.RegisterMapper;

import com.dreeling.applications.ocelli.server.dao.mappers.ApplicationMapper;
import com.dreeling.applications.ocelli.server.domain.Application;
import com.dreeling.applications.ocelli.server.domain.User;


@RegisterMapper( ApplicationMapper.class)
public interface ApplicationDao {

	@SqlQuery("select * from Application where id = :id")
	Application findById(@Bind("id") String id);

	@SqlQuery("select * from Application")
	List<User> getAll();
}
