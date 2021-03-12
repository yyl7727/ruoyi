package com.ruoyi.system.domain.request;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * sys_notice 查询条件实体
 * @author zxy
 */
public class SysNoticeRequest extends BaseEntity {
    private static final long serialVersionUID = 1L;
    /**
     * 通知id
     */
    private String noticeId;
    /**
     * 收件人用户名
     */
    private String userId;

    /**
     * 通知标题
     */
    private String noticeTitle;

    /**
     * 通知类型
     */
    private String noticeType;

    /**
     * 是否已读 0未读 1已读
     */
    private String isRead;


    public String getNoticeId() {
        return noticeId;
    }

    public void setNoticeId(String noticeId) {
        this.noticeId = noticeId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getNoticeTitle() {
        return noticeTitle;
    }

    public void setNoticeTitle(String noticeTitle) {
        this.noticeTitle = noticeTitle;
    }

    public String getNoticeType() {
        return noticeType;
    }

    public void setNoticeType(String noticeType) {
        this.noticeType = noticeType;
    }

    public String getIsRead() {
        return isRead;
    }

    public void setIsRead(String isRead) {
        this.isRead = isRead;
    }
}
