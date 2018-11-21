package com.ff.model;


public class Resources {

  private long id;
  private String name;
  private long parentId;
  private String resKey;
  private String type;
  private String resUrl;
  private long level;
  private String description;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public long getParentId() {
    return parentId;
  }

  public void setParentId(long parentId) {
    this.parentId = parentId;
  }


  public String getResKey() {
    return resKey;
  }

  public void setResKey(String resKey) {
    this.resKey = resKey;
  }


  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }


  public String getResUrl() {
    return resUrl;
  }

  public void setResUrl(String resUrl) {
    this.resUrl = resUrl;
  }


  public long getLevel() {
    return level;
  }

  public void setLevel(long level) {
    this.level = level;
  }


  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

}
