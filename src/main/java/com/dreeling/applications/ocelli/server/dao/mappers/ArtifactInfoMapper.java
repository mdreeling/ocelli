package com.dreeling.applications.ocelli.server.dao.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.skife.jdbi.v2.StatementContext;
import org.skife.jdbi.v2.tweak.ResultSetMapper;

import com.dreeling.applications.ocelli.server.dto.ArtifactInfoDTO;

public class ArtifactInfoMapper implements ResultSetMapper<ArtifactInfoDTO> {

	public ArtifactInfoDTO map(int index, ResultSet r, StatementContext ctx)
			throws SQLException {
		return new ArtifactInfoDTO(r.getString("artifact_location"),
				r.getString("node_host_name"), r.getString("principal"),
				r.getString("data"));
	}
}