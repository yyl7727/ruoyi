package com.ruoyi.system.service.impl;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.Performant;
import com.ruoyi.system.domain.Rearch;
import com.ruoyi.system.domain.Task;
import com.ruoyi.system.domain.TaskMember;
import com.ruoyi.system.domain.vo.TaskMemberVo;
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

    /**
     * 新增课题成员
     * @param taskMember
     * @return
     */
    @Override
    public int addTaskMember(TaskMember taskMember) {
        return taskMapper.addTaskMember(taskMember);
    }

    /**
     * 更新课题成员
     * @param taskMember
     * @return
     */
    @Override
    public int updateTaskMember(TaskMember taskMember) {
        return taskMapper.updateTaskMember(taskMember);
    }

    /**
     * 根据id获取课题成员
     * @param id
     * @return
     */
    @Override
    public TaskMemberVo selectTaskMemberById(String id) {
        return taskMapper.selectTaskMemberById(id);
    }

    /**
     * 新增绩效
     * @param performant
     * @return
     */
    @Override
    public int addPerformant(Performant performant) {
        return taskMapper.addPerformant(performant);
    }

    /**
     * 管理员获取所有绩效列表
     * @param performant
     * @return
     */
    @Override
    public List<Performant> selectPerformantList(Performant performant) {
        return taskMapper.selectPerformantList(performant);
    }

    /**
     * 教师获取自己的课题的绩效列表
     * @return
     */
    @Override
    public List<Performant> selectPerformantListByTaskId() {
        Task task = new Task();
        task.setCreateBy(SecurityUtils.getUsername());
        List<Task> tasks = taskMapper.selectTaskList(task);
        List<Performant> performantList = taskMapper.selectPerformantListByTaskId(tasks);
        return performantList;
    }

    /**
     * 学生获取自己的绩效列表
     * @param username
     * @return
     */
    @Override
    public List<Performant> selectPerformantListByUserName(String username) {
        return taskMapper.selectPerformantListByUserName(username);
    }
}
