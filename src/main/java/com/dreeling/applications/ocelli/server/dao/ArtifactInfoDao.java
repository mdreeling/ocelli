package com.dreeling.applications.ocelli.server.dao;

import java.util.List;

import org.skife.jdbi.v2.sqlobject.Bind;
import org.skife.jdbi.v2.sqlobject.SqlQuery;
import org.skife.jdbi.v2.sqlobject.customizers.RegisterMapper;

import com.dreeling.applications.ocelli.server.dao.mappers.ArtifactInfoMapper;
import com.dreeling.applications.ocelli.server.dto.ArtifactInfoDTO;

@RegisterMapper(ArtifactInfoMapper.class)
public interface ArtifactInfoDao {

	@SqlQuery("SELECT af.artifact_location,n.node_host_name,k.principal,k.data FROM application a "
			+ "INNER JOIN application_artifact aa ON aa.application_artifacts_id = a.id "
			+ "INNER JOIN artifact af ON af.id = aa.artifact_id "
			+ "INNER JOIN node_artifact na ON na.artifact_id = aa.artifact_id "
			+ "INNER JOIN node n ON n.id = na.node_artifacts_id "
			+ "INNER JOIN access_key k on k.id = n.access_key_id "
			+ "WHERE a.id = :id")
	List<ArtifactInfoDTO> findArtifactInfoByApplicationId(@Bind("id") String id);
}
