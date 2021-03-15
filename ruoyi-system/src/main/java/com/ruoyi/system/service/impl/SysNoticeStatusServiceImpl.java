package com.ruoyi.system.service.impl;

import com.ruoyi.system.domain.SysNoticeStatus;
import com.ruoyi.system.mapper.SysNoticeStatusMapper;
import com.ruoyi.system.service.ISysNoticeStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 公告状态 服务层实现
 *
 * @author zxy
 */
@Service
public class SysNoticeStatusServiceImpl implements ISysNoticeStatusService {
    @Autowired
    SysNoticeStatusMapper noticeStatusMapper;

    /**
     * 新增公告状态
     *
     * @param sysNoticeStatus 公告信息
     * @return 结果
     */
    @Override
    public int insertNoticeStatus(SysNoticeStatus sysNoticeStatus) {
        return noticeStatusMapper.insertNoticeStatus(sysNoticeStatus);
    }

    /**
     * 查询公告状态
     * @param noticeStatus 公告状态参数
     * @return 结果
     */
    @Override
    public List<SysNoticeStatus> selectNoticeStatus(SysNoticeStatus noticeStatus) {
        return noticeStatusMapper.selectNoticeStatus(noticeStatus);
    }
}
