package com.dreeling.applications.ocelli.server.dto;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonProperty;

public class CollectionJobDTO {
    private long id;

    @Length(max = 3)
    private String content;

    public CollectionJobDTO() {
        // Jackson deserialization
    }

    public CollectionJobDTO(long id, String content) {
        this.id = id;
        this.content = content;
    }

    @JsonProperty
    public long getId() {
        return id;
    }

    @JsonProperty
    public String getContent() {
        return content;
    }
}
