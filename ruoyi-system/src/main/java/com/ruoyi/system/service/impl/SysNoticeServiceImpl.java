package com.ruoyi.system.service.impl;

import java.util.List;

import com.ruoyi.system.domain.SysNoticeStatus;
import com.ruoyi.system.domain.request.SysNoticeRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.domain.SysNotice;
import com.ruoyi.system.mapper.SysNoticeMapper;
import com.ruoyi.system.service.ISysNoticeService;

/**
 * 公告 服务层实现
 *
 * @author zxy
 */
@Service
public class SysNoticeServiceImpl implements ISysNoticeService
{
    @Autowired
    private SysNoticeMapper noticeMapper;

    /**
     * 查询公告信息
     *
     * @param noticeId 公告ID
     * @return 公告信息
     */
    @Override
    public SysNotice selectNoticeById(String noticeId)
    {
        return noticeMapper.selectNoticeById(noticeId);
    }

    /**
     * 查询公告状态信息
     *
     * @param noticeRequest 参数实体
     * @return 公告状态信息
     */
    @Override
    public SysNoticeStatus selectNoticeStatusById(SysNoticeRequest noticeRequest) {
        return noticeMapper.selectNoticeStatusById(noticeRequest);
    }

    /**
     * 返回最新的一条公告信息
     * @return 公告信息
     */
    @Override
    public SysNotice selectNewNotice() {
        return noticeMapper.selectNewNotice();
    }

    /**
     * 查询公告列表
     *
     * @param noticeRequest 公告信息
     * @return 公告集合
     */
    @Override
    public List<SysNotice> selectNoticeList(SysNoticeRequest noticeRequest)
    {
        return noticeMapper.selectNoticeList(noticeRequest);
    }

    /**
     * 查询所有未读公告列表
     * @return 未读数量
     */
    @Override
    public int selectNoticeNotReadList(SysNoticeRequest noticeRequest) {
        return noticeMapper.selectNoticeNotReadList(noticeRequest);
    }

    /**
     * 新增公告
     *
     * @param notice 公告信息
     * @return 结果
     */
    @Override
    public int insertNotice(SysNotice notice)
    {
        return noticeMapper.insertNotice(notice);
    }

    /**
     * 修改公告
     *
     * @param notice 公告信息
     * @return 结果
     */
    @Override
    public int updateNotice(SysNotice notice)
    {
        return noticeMapper.updateNotice(notice);
    }

    /**
     * 删除公告对象
     *
     * @param noticeId 公告ID
     * @return 结果
     */
    @Override
    public int deleteNoticeById(String noticeId)
    {
        return noticeMapper.deleteNoticeById(noticeId);
    }

    /**
     * 批量删除公告信息
     *
     * @param noticeIds 需要删除的公告ID
     * @return 结果
     */
    @Override
    public int deleteNoticeByIds(String[] noticeIds)
    {
        return noticeMapper.deleteNoticeByIds(noticeIds);
    }

    /**
     * 设置通知为已读
     * @param sysNoticeRequest 参数实体
     * @return 结果
     */
    @Override
    public int setRead(SysNoticeRequest sysNoticeRequest) {
        noticeMapper.setRead1(sysNoticeRequest);
        return noticeMapper.setRead(sysNoticeRequest);
    }
}
