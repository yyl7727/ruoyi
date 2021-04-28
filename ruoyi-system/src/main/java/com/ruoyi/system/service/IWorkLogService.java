package com.ruoyi.system.service;

import com.ruoyi.system.domain.WorkLog;
import com.ruoyi.system.domain.vo.WorkLogVo;

import java.util.List;

public interface IWorkLogService {
    /**
     * 获取工作日志列表
     * @param workLog
     * @return
     */
    List<WorkLogVo> selectWorkLogList(WorkLog workLog);

    /**
     * 根据课题id获取工作日志
     * @param taskId
     * @return
     */
    List<WorkLogVo> selectWorkLogListByTaskId();

    /**
     * 根据用户名获取工作日志
     * @param userName
     * @return
     */
    List<WorkLogVo> selectWorkLogListByUserName(String userName);

    /**
     * 新增工作日志
     * @param workLog
     * @return
     */
    int addWorkLog(WorkLog workLog);

    /**
     * 更新工作日志
     * @param workLog
     * @return
     */
    int updateWorkLog(WorkLog workLog);

    /**
     * 根据id获取工作日志
     * @param workLogId
     * @return
     */
    WorkLogVo selectWorkLogById(String workLogId);

    /**
     * 根据id删除工作日志
     * @param logIds
     * @return
     */
    int deleteWorkLog(String[] logIds, String updateBy);
}
