package com.ruoyi.system.service;

import com.ruoyi.system.domain.SysNotice;
import com.ruoyi.system.domain.SysNoticeStatus;

import java.util.List;

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

    /**
     * 查询公告状态
     * @param noticeStatus 公告状态参数
     * @return 结果
     */
    List<SysNoticeStatus> selectNoticeStatus(SysNoticeStatus noticeStatus);
}
