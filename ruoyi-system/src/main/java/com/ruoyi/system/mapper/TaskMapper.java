package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.Task;
import com.ruoyi.system.domain.TaskMember;

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

    /**
     * 邀请学生加入课题
     * @param taskMember
     * @return
     */
    int inviteIntoTask(TaskMember taskMember);

    /**
     * 加入课题
     * @param taskMember 课题成员参数
     * @return 结果
     */
    int joinTask(TaskMember taskMember);

    /**
     * 拒绝加入课题
     * @param taskMember 课题成员参数
     * @return 结果
     */
    int unJoinTask(TaskMember taskMember);

    /**
     * 加入课题
     * @param taskMember 课题成员参数
     * @return 结果
     */
    int joinTask1(TaskMember taskMember);

    /**
     * 拒绝加入课题
     * @param taskMember 课题成员参数
     * @return 结果
     */
    int unJoinTask1(TaskMember taskMember);

    /**
     * 获取已加入的课题列表
     * @param userName
     * @return
     */
    List<Task> selectJoinedTask(String userName);
}
