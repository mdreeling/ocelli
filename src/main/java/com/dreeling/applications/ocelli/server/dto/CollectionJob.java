package com.dreeling.applications.ocelli.server.dto;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonProperty;

public class CollectionJob {
    private long id;

    @Length(max = 3)
    private String content;

    public CollectionJob() {
        // Jackson deserialization
    }

    public CollectionJob(long id, String content) {
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
