package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.SysNoticeStatus;

/**
 * 通知公告状态 数据层
 * @author zxy
 */
public interface SysNoticeStatusMapper {
    /**
     * 新增公告状态
     *
     * @param sysNoticeStatus 公告信息
     * @return 结果
     */
    int insertNoticeStatus(SysNoticeStatus sysNoticeStatus);
}
