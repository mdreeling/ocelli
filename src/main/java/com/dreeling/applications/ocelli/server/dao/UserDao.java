package com.dreeling.applications.ocelli.server.dao;

import org.skife.jdbi.v2.sqlobject.Bind;
import org.skife.jdbi.v2.sqlobject.SqlQuery;
import org.skife.jdbi.v2.sqlobject.customizers.RegisterMapper;

import com.dreeling.applications.ocelli.server.dao.mappers.UserMapper;
import com.dreeling.applications.ocelli.server.domain.User;

@RegisterMapper(UserMapper.class)
public interface UserDao {
    @SqlQuery("select u.user_id, u.email,k.data from User u "+
    		" INNER JOIN access_key k on k.id = u.access_key_id " +
    		" where email = :id")
    User findByEmail(@Bind("id") String email);
}
