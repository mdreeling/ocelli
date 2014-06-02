package com.dreeling.applications.ocelli.server.dao.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.skife.jdbi.v2.StatementContext;
import org.skife.jdbi.v2.tweak.ResultSetMapper;

import com.dreeling.applications.ocelli.server.domain.Application;

public class ApplicationMapper implements ResultSetMapper<Application> {

	public Application map(int index, ResultSet r, StatementContext ctx)
			throws SQLException {
		return new Application(r.getInt("id"),
				r.getString("app_description"), r.getString("app_name"),
				null, null);
	}
}