package com.dreeling.applications.ocelli.server.dto;

public class ArtifactInfoDTO {

	String artifactLocation;
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime
				* result
				+ ((artifactLocation == null) ? 0 : artifactLocation.hashCode());
		result = prime
				* result
				+ ((nodeAccessKeyData == null) ? 0 : nodeAccessKeyData
						.hashCode());
		result = prime * result
				+ ((nodeName == null) ? 0 : nodeName.hashCode());
		result = prime * result
				+ ((nodePrincipal == null) ? 0 : nodePrincipal.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ArtifactInfoDTO other = (ArtifactInfoDTO) obj;
		if (artifactLocation == null) {
			if (other.artifactLocation != null)
				return false;
		} else if (!artifactLocation.equals(other.artifactLocation))
			return false;
		if (nodeAccessKeyData == null) {
			if (other.nodeAccessKeyData != null)
				return false;
		} else if (!nodeAccessKeyData.equals(other.nodeAccessKeyData))
			return false;
		if (nodeName == null) {
			if (other.nodeName != null)
				return false;
		} else if (!nodeName.equals(other.nodeName))
			return false;
		if (nodePrincipal == null) {
			if (other.nodePrincipal != null)
				return false;
		} else if (!nodePrincipal.equals(other.nodePrincipal))
			return false;
		return true;
	}

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
