package com.dreeling.applications.ocelli.server.dto;

public class ArtifactInfoDTO {

	String artifactLocation;
	String nodeName;
	String nodePrincipal;
	String nodeAccessKeyData;

	public ArtifactInfoDTO(String artifactLocation, String nodeName,
			String nodePrincipal, String nodeAccessKeyData) {
		super();
		this.artifactLocation = artifactLocation;
		this.nodeName = nodeName;
		this.nodePrincipal = nodePrincipal;
		this.nodeAccessKeyData = nodeAccessKeyData;
	}

	public String getArtifactLocation() {
		return artifactLocation;
	}

	public void setArtifactLocation(String artifactLocation) {
		this.artifactLocation = artifactLocation;
	}

	public String getNodeName() {
		return nodeName;
	}

	public void setNodeName(String nodeName) {
		this.nodeName = nodeName;
	}

	public String getNodePrincipal() {
		return nodePrincipal;
	}

	public void setNodePrincipal(String nodePrincipal) {
		this.nodePrincipal = nodePrincipal;
	}

	public String getNodeAccessKeyData() {
		return nodeAccessKeyData;
	}

	public void setNodeAccessKeyData(String nodeAccessKeyData) {
		this.nodeAccessKeyData = nodeAccessKeyData;
	}

	public ArtifactInfoDTO() {
		// TODO Auto-generated constructor stub
	}

}
