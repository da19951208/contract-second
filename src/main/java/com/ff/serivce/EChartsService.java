package com.ff.serivce;

import com.ff.dao.EChartsMapper;
import com.ff.model.Compact;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EChartsService {
    @Autowired
    private EChartsMapper eChartsMapper;

    public List<Compact> selectCA() {
        return eChartsMapper.selectCA();
    }

    public List<Compact> selectRS() {
        return eChartsMapper.selectRS();
    }
}
