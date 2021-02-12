package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.Task;

import java.util.List;

public interface TaskMapper {
    /**
     * 获取课题列表
     * @param task
     * @return
     */
    List<Task> selectTaskList(Task task);

    /**
     * 根据id获取课题信息
     * @param taskId
     * @return
     */
    Task selectTaskById(String taskId);

    /**
     * 添加课题
     * @param task
     * @return
     */
    int addTask(Task task);

    /**
     * 根据id修改课题信息
     * @param task
     * @return
     */
    int updateTaskById(Task task);

    /**
     * 根据id修改课题状态
     * @param task
     * @return
     */
    int changeStatusById(Task task);

    /**
     * 根据id删除课题
     * @param taskId
     * @return
     */
    int deleteTaskById(Long taskId);

    /**
     * 批量删除课题
     * @param taskId
     * @return
     */
    int deleteTaskByIds(Long[] taskId);
}
