package com.ff.serivce;

import com.ff.dao.CompactMapper;
import com.ff.dao.ManagementMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManagementService {
    @Autowired
    private ManagementMapper managementMapper;
}
