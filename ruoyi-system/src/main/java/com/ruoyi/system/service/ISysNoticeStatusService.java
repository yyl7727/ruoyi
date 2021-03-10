package com.ruoyi.system.service;

import com.ruoyi.system.domain.SysNoticeStatus;

/**
 * 公告状态 服务层
 * @author zxy
 */
public interface ISysNoticeStatusService {
    /**
     * 新增公告状态
     *
     * @param sysNoticeStatus 公告信息
     * @return 结果
     */
    int insertNoticeStatus(SysNoticeStatus sysNoticeStatus);
}
