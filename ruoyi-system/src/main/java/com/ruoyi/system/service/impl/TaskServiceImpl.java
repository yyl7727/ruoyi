package com.ruoyi.system.service.impl;

import com.ruoyi.system.domain.Rearch;
import com.ruoyi.system.domain.Task;
import com.ruoyi.system.domain.TaskMember;
import com.ruoyi.system.mapper.RearchMapper;
import com.ruoyi.system.mapper.SysNoticeMapper;
import com.ruoyi.system.mapper.TaskMapper;
import com.ruoyi.system.service.ITaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaskServiceImpl implements ITaskService {
    @Autowired
    TaskMapper taskMapper;
    @Autowired
    SysNoticeMapper noticeMapper;
    @Autowired
    RearchMapper rearchMapper;

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
     * @param task
     * @return
     */
    @Override
    public List<Task> selectTaskByUserId(Task task) {
        return taskMapper.selectTaskList(task);
    }

    @Override
    public int inviteIntoTask(TaskMember taskMember) {
        return taskMapper.inviteIntoTask(taskMember);
    }

    /**
     * 加入课题
     * @param taskMember 课题成员参数
     * @return 结果
     */
    @Override
    public int joinTask(TaskMember taskMember) {
        Rearch rearch = rearchMapper.selectRearchByStudent(taskMember.getStudentName());
        rearch.setStatus("1");
        rearchMapper.updateRearchById(rearch);
        return taskMapper.joinTask(taskMember);
    }

    /**
     * 拒绝加入课题
     * @param taskMember 课题成员参数
     * @return 结果
     */
    @Override
    public int unJoinTask(TaskMember taskMember) {
        return taskMapper.unJoinTask(taskMember);
    }

    /**
     * 加入课题
     * @param taskMember 课题成员参数
     * @return 结果
     */
    @Override
    public int joinTask1(TaskMember taskMember) {
        return taskMapper.joinTask1(taskMember);
    }

    /**
     * 拒绝加入课题
     * @param taskMember 课题成员参数
     * @return 结果
     */
    @Override
    public int unJoinTask1(TaskMember taskMember) {
        return taskMapper.unJoinTask1(taskMember);
    }

    /**
     * 获取已加入的课题列表
     * @param userName 学生用户名
     * @return
     */
    @Override
    public List<Task> selectJoinedTask(String userName) {
        return taskMapper.selectJoinedTask(userName);
    }

    /**
     * 获取课题成员
     * @param taskMember
     * @return
     */
    @Override
    public List<TaskMember> selectTaskMember(TaskMember taskMember) {
        return taskMapper.selectTaskMember(taskMember);
    }

    @Override
    public int addTaskMember(TaskMember taskMember) {
        return taskMapper.addTaskMember(taskMember);
    }
}
