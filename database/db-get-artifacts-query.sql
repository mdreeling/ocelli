SELECT af.artifact_location,n.node_host_name,k.principal,k.data FROM application a
INNER JOIN application_artifact aa ON aa.application_artifacts_id = a.id
INNER JOIN artifact af ON af.id = aa.artifact_id
INNER JOIN node_artifact na ON na.artifact_id = aa.artifact_id
INNER JOIN node n ON n.id = na.node_artifacts_id
INNER JOIN access_key k on k.id = n.access_key_id
WHERE a.id
