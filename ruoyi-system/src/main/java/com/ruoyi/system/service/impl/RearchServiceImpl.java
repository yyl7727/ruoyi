package com.ruoyi.system.service.impl;

import com.ruoyi.system.domain.Rearch;
import com.ruoyi.system.mapper.RearchMapper;
import com.ruoyi.system.service.IRearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RearchServiceImpl implements IRearchService {
    @Autowired
    RearchMapper rearchMapper;

    /**
     * 获取助研信息列表
     * @param rearch
     * @return
     */
    @Override
    public List<Rearch> selectRearchList(Rearch rearch) {
        return rearchMapper.selectRearchList(rearch);
    }

    /**
     * 新增助研信息
     * @param rearch
     * @return
     */
    @Override
    public int addRearch(Rearch rearch) {
        return rearchMapper.addRearch(rearch);
    }
}
