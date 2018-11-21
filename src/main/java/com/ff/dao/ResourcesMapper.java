package com.ff.dao;

import com.ff.model.Resources;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ResourcesMapper {
    List<Resources> getUserResources(String valueOf);

    List<Resources> findAll();
}
