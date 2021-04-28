package com.ruoyi.system.service.impl;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.Task;
import com.ruoyi.system.domain.WorkLog;
import com.ruoyi.system.domain.vo.WorkLogVo;
import com.ruoyi.system.mapper.TaskMapper;
import com.ruoyi.system.mapper.WorkLogMapper;
import com.ruoyi.system.service.IWorkLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WorkLogServiceImpl implements IWorkLogService {
    @Autowired
    WorkLogMapper workLogMapper;
    @Autowired
    TaskMapper taskMapper;

    /**
     * 获取工作日志列表
     * @param workLog
     * @return
     */
    @Override
    public List<WorkLogVo> selectWorkLogList(WorkLog workLog) {
        List<WorkLogVo> workLogVos = workLogMapper.selectWorkLogList(workLog);
        return workLogVos;
    }

    @Override
    public WorkLogVo selectWorkLogById(String workLogId) {
        return workLogMapper.selectWorkLogById(workLogId);
    }

    /**
     * 根据课题id获取工作日志列表
     * @param taskId
     * @return
     */
    @Override
    public List<WorkLogVo> selectWorkLogListByTaskId() {
        Task task = new Task();
        task.setCreateBy(SecurityUtils.getUsername());
        List<Task> tasks = taskMapper.selectTaskList(task);
        List<WorkLogVo> workLogVos = workLogMapper.selectWorkLogListByTaskIds(tasks);
        return workLogVos;
    }

    /**
     * 根据用户名获取工作日志列表
     * @param userName
     * @return
     */
    @Override
    public List<WorkLogVo> selectWorkLogListByUserName(String userName) {
        List<WorkLogVo> workLogVos = workLogMapper.selectWorkLogListByUserName(userName);
        return workLogVos;
    }

    /**
     * 新增工作日志
     * @param workLog
     * @return
     */
    @Override
    public int addWorkLog(WorkLog workLog) {
        return workLogMapper.addWorkLog(workLog);
    }

    /**
     * 更新工作日志
     * @param workLog
     * @return
     */
    @Override
    public int updateWorkLog(WorkLog workLog) {
        return workLogMapper.updateWorkLog(workLog);
    }

    /**
     * 根据id删除工作日志
     * @param logIds
     * @return
     */
    @Override
    public int deleteWorkLog(String[] logIds, String updateBy) {
        return workLogMapper.deleteWorkLog(logIds, updateBy);
    }
}
