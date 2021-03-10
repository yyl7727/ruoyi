package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysNotice;
import com.ruoyi.system.domain.request.SysNoticeRequest;

/**
 * 公告 服务层
 *
 * @author zxy
 */
public interface ISysNoticeService
{
    /**
     * 查询公告信息
     *
     * @param noticeId 公告ID
     * @return 公告信息
     */
    SysNotice selectNoticeById(Long noticeId);

    /**
     * 返回最新的一条公告信息
     * @return 公告信息
     */
    SysNotice selectNewNotice();

    /**
     * 查询公告列表
     *
     * @param noticeRequest 公告信息
     * @return 公告集合
     */
    List<SysNotice> selectNoticeList(SysNoticeRequest noticeRequest);

    /**
     * 查询所有未读公告列表
     * @return 未读数量
     */
    int selectNoticeNotReadList(SysNoticeRequest noticeRequest);

    /**
     * 新增公告
     *
     * @param notice 公告信息
     * @return 结果
     */
    int insertNotice(SysNotice notice);

    /**
     * 修改公告
     *
     * @param notice 公告信息
     * @return 结果
     */
    int updateNotice(SysNotice notice);

    /**
     * 删除公告信息
     *
     * @param noticeId 公告ID
     * @return 结果
     */
    int deleteNoticeById(Long noticeId);

    /**
     * 批量删除公告信息
     *
     * @param noticeIds 需要删除的公告ID
     * @return 结果
     */
    int deleteNoticeByIds(Long[] noticeIds);
}
