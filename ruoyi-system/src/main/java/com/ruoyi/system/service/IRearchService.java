package com.ruoyi.system.service;

import com.ruoyi.system.domain.Rearch;

import java.util.List;

public interface IRearchService {
    /**
     * 获取助研信息列表
     * @param rearch
     * @return
     */
    List<Rearch> selectRearchList(Rearch rearch);

    /**
     * 新增助研信息
     * @param rearch
     * @return
     */
    int addRearch(Rearch rearch);
}
