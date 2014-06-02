package com.dreeling.applications.ocelli.server.dao.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.skife.jdbi.v2.StatementContext;
import org.skife.jdbi.v2.tweak.ResultSetMapper;

import com.dreeling.applications.ocelli.server.domain.Application;
import com.dreeling.applications.ocelli.server.domain.User;
import com.dreeling.applications.ocelli.server.dto.ArtifactInfoDTO;

public class UserMapper implements ResultSetMapper<User> {

	public User map(int index, ResultSet r, StatementContext ctx)
			throws SQLException {
		return new User(r.getString("user_id"), r.getString("email"), null,
				null, r.getString("data"));
	}
}