package com.ruoyi.system.service.impl;

import com.ruoyi.system.domain.Task;
import com.ruoyi.system.mapper.TaskMapper;
import com.ruoyi.system.service.ITaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaskServiceImpl implements ITaskService {
    @Autowired
    TaskMapper taskMapper;

    /**
     * 查询课题列表
     * @param task
     * @return
     */
    @Override
    public List<Task> selectTaskList(Task task) {
        return taskMapper.selectTaskList(task);
    }

    @Override
    public Task selectTaskById(String taskId) {
        return taskMapper.selectTaskById(taskId);
    }

    /**
     * 添加课题
     * @param task
     * @return
     */
    @Override
    public int addTask(Task task) {
        return taskMapper.addTask(task);
    }

    /**
     * 根据id修改课题信息
     * @param task
     * @return
     */
    @Override
    public int updateTaskById(Task task) {
        return taskMapper.updateTaskById(task);
    }

    @Override
    public int changeStatusById(Task task) {
        return taskMapper.changeStatusById(task);
    }

    /**
     * 删除课题
     * @param taskId
     * @return
     */
    @Override
    public int deleteTaskById(Long taskId) {
        return taskMapper.deleteTaskById(taskId);
    }

    /**
     * 批量删除课题
     * @param taskIds
     * @return
     */
    @Override
    public int deleteTaskByIds(Long[] taskIds) {
        return taskMapper.deleteTaskByIds(taskIds);
    }

    /**
     *
     * @param userId
     * @return
     */
    @Override
    public List<Task> selectTaskByUserId(String userId) {
        Task task = new Task();
        task.setCreateBy(userId);
        return taskMapper.selectTaskList(task);
    }
}
