package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.Rearch;

import java.util.List;

/**
 * @author zxy
 */
public interface RearchMapper {
    /**
     * 获取助研信息列表
     * @param rearch 助研信息实体
     * @return 结果
     */
    List<Rearch> selectRearchList(Rearch rearch);

    /**
     * 新增助研信息
     * @param rearch 助研信息实体
     * @return 结果
     */
    int addRearch(Rearch rearch);

    /**
     * 根据学生用户名查询助研信息
     * @param userName 用户名
     * @return 结果
     */
    Rearch selectRearchByStudent(String userName);

    /**
     * 根据id修改助研信息
     * @param rearch 助研信息实体
     * @return 结果
     */
    int updateRearchById(Rearch rearch);
}
