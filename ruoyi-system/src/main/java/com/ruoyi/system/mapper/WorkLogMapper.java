package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.Task;
import com.ruoyi.system.domain.WorkLog;
import com.ruoyi.system.domain.vo.WorkLogVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WorkLogMapper {
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
    List<WorkLogVo> selectWorkLogListByTaskId(String taskId);

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
     * 根据课题id数据获取工作日志
     * @param taskIds
     * @return
     */
    List<WorkLogVo> selectWorkLogListByTaskIds(List<Task> tasks);

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
    int deleteWorkLog(@Param("ids")String[] logIds, @Param("updateBy")String updateBy);
}
