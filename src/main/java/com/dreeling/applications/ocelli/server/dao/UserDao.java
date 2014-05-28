package com.dreeling.applications.ocelli.server.dao;

import java.util.List;

import org.skife.jdbi.v2.sqlobject.Bind;
import org.skife.jdbi.v2.sqlobject.SqlQuery;
import org.skife.jdbi.v2.sqlobject.helpers.MapResultAsBean;

import com.dreeling.applications.ocelli.server.domain.User;

public interface UserDao {
	@MapResultAsBean
    @SqlQuery("select * from User where email = :id")
    User findByEmail(@Bind("id") String email);

    @SqlQuery("select * from User")
    List<User> getAll();
}
