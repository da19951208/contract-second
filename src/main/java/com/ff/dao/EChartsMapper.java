package com.ff.dao;


import com.ff.model.Compact;

import java.util.List;

public interface EChartsMapper {
    List<Compact> selectCA();

    List<Compact> selectRS();
}
