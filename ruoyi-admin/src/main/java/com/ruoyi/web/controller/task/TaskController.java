package com.ruoyi.web.controller.task;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.SysNotice;
import com.ruoyi.system.domain.SysNoticeStatus;
import com.ruoyi.system.domain.Task;
import com.ruoyi.system.domain.TaskMember;
import com.ruoyi.system.service.ISysNoticeService;
import com.ruoyi.system.service.ISysNoticeStatusService;
import com.ruoyi.system.service.ITaskService;
import com.sun.javafx.tk.Toolkit;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.StringJoiner;

/**
 * 课题
 * @author zxy
 */
@RestController
@RequestMapping("/task")
public class TaskController extends BaseController {
    @Autowired
    ITaskService taskService;
    @Autowired
    ISysNoticeService noticeService;
    @Autowired
    ISysNoticeStatusService noticeStatusService;

    /**
     * 获取课题列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Task task) {
        startPage();
        List<Task> list;
        if (SecurityUtils.isAdmin(SecurityUtils.getLoginUser().getUser().getUserId())) {
            list = taskService.selectTaskList(task);
        } else {
            task.setCreateBy(SecurityUtils.getUsername());
            list = taskService.selectTaskByUserId(task);
        }
        return getDataTable(list);
    }

    /**
     * 获取全部课题列表（学生端显示用）
     */
    @GetMapping("/allList")
    public TableDataInfo allList(Task task) {
        startPage();
        List<Task> list = taskService.selectTaskList(task);
        return getDataTable(list);
    }

    @GetMapping("/list/{userId}")
    public AjaxResult listByUserId(@PathVariable String userId) {
        Task task = new Task();
        task.setCreateBy(userId);
        return AjaxResult.success(taskService.selectTaskByUserId(task));
    }

    @GetMapping("getTask/{taskId}")
    public AjaxResult getTaskInfo(@PathVariable String taskId) {
        return AjaxResult.success(taskService.selectTaskById(taskId));
    }

    @PostMapping("/add")
    @Log(title = "课题管理", businessType = BusinessType.INSERT)
    public AjaxResult addTask(@RequestBody Task task) {
        task.setCreateBy(SecurityUtils.getUsername());
        return toAjax(taskService.addTask(task));
    }

    @PutMapping("/update")
    @Log(title = "课题管理", businessType = BusinessType.UPDATE)
    public AjaxResult updateTask(@RequestBody Task task) {
        task.setUpdateBy(SecurityUtils.getUsername());
        return toAjax(taskService.updateTaskById(task));
    }

    @PutMapping("/changeStatus")
    @Log(title = "课题管理", businessType = BusinessType.UPDATE)
    public AjaxResult changeStatus(@RequestBody Task task) {
        task.setUpdateBy(SecurityUtils.getUsername());
        return toAjax(taskService.changeStatusById(task));
    }

    @PostMapping("/deleteByIds")
    @Log(title = "课题管理", businessType = BusinessType.DELETE)
    public AjaxResult deleteTaskByIds(@RequestBody Long[] taskIds) {
        return toAjax(taskService.deleteTaskByIds(taskIds));
    }

    @PostMapping("/deleteById")
    @Log(title = "课题管理", businessType = BusinessType.DELETE)
    public AjaxResult deleteTaskById(@RequestBody Long taskId) {
        return toAjax(taskService.deleteTaskById(taskId));
    }

    @PostMapping("/invite")
    public AjaxResult inviteIntoTask(@RequestBody TaskMember taskMember) {
        String userName = SecurityUtils.getUsername();
        SysNotice notice = new SysNotice();
        SysNoticeStatus noticeStatus = new SysNoticeStatus();
        notice.setNoticeTitle("课题加入邀请");

        //获取通知内容所需的必要信息
        Task task = taskService.selectTaskById(taskMember.getTaskId());
        //发送通知
        notice.setNoticeContent(taskMember.getStudentUserName() + " 教师：" + task.getCreateBy() + " 邀请你加入课题：" + task.getTaskName());
        notice.setNoticeType("4");
        notice.setCreateBy(userName);
        noticeService.insertNotice(notice);
        noticeStatus.setNoticeId(noticeService.selectNewNotice().getNoticeId().toString());
        noticeStatus.setTaskId(taskMember.getTaskId());
        noticeStatus.setUserId(taskMember.getStudentUserName());
        noticeStatus.setCreateBy(userName);
        noticeStatusService.insertNoticeStatus(noticeStatus);

        taskMember.setCreateBy(userName);
        return toAjax(taskService.inviteIntoTask(taskMember));
    }

    /**
     * 申请加入课题
     * @param taskMember
     * @return
     */
    @PostMapping("/apply")
    public AjaxResult applyIntoTask(@RequestBody TaskMember taskMember) {
        String userName = SecurityUtils.getUsername();
        SysNotice notice = new SysNotice();
        SysNoticeStatus noticeStatus = new SysNoticeStatus();
        notice.setNoticeTitle("课题加入申请");

        //获取通知内容所需的必要信息
        Task task = taskService.selectTaskById(taskMember.getTaskId());
        //发送通知
        notice.setNoticeContent(userName + " 申请加入你的课题：" + task.getTaskName());
        notice.setNoticeType("5");
        notice.setCreateBy(userName);
        noticeService.insertNotice(notice);
        noticeStatus.setNoticeId(noticeService.selectNewNotice().getNoticeId().toString());
        noticeStatus.setTaskId(taskMember.getTaskId());
        noticeStatus.setUserId(task.getCreateBy());
        noticeStatus.setCreateBy(userName);
        noticeStatusService.insertNoticeStatus(noticeStatus);

        taskMember.setCreateBy(userName);
        return toAjax(taskService.inviteIntoTask(taskMember));
    }

    /**
     * 加入课题
     * @param noticeId 课题id
     * @return 结果
     */
    @PutMapping("/join")
    public AjaxResult joinTask(@RequestBody String noticeId) {
        return toAjax(taskService.joinTask(getTaskMember(noticeId)));
    }

    /**
     * 拒绝加入课题
     * @param noticeId 课题id
     * @return 结果
     */
    @PutMapping("/unJoin")
    public AjaxResult unJoinTask(@RequestBody String noticeId) {
        return toAjax(taskService.unJoinTask(getTaskMember(noticeId)));
    }

    /**
     * 加入课题
     * @param noticeId 课题id
     * @return 结果
     */
    @PutMapping("/join1")
    public AjaxResult joinTask1(@RequestBody String noticeId) {
        return toAjax(taskService.joinTask1(getTaskMember1(noticeId)));
    }

    /**
     * 拒绝加入课题
     * @param noticeId 课题id
     * @return 结果
     */
    @PutMapping("/unJoin1")
    public AjaxResult unJoinTask1(@RequestBody String noticeId) {
        return AjaxResult.success(getTaskMember1(noticeId));
    }

    /**
     * 获取加入或拒绝课题所需的参数
     * @param noticeId 课题id
     * @return 结果
     */
    private TaskMember getTaskMember(String noticeId ) {
        SysNotice notice = new SysNotice();
        SysNoticeStatus noticeStatus = new SysNoticeStatus();
        TaskMember taskMember = new TaskMember();

        noticeStatus.setUserId(SecurityUtils.getUsername());
        noticeStatus.setNoticeId(noticeId);
        List<SysNoticeStatus> noticeStatuses = noticeStatusService.selectNoticeStatus(noticeStatus);

        if (noticeStatuses.size() == 1) {
            taskMember.setTaskId(noticeStatuses.get(0).getTaskId());
            taskMember.setStudentUserName(noticeStatuses.get(0).getUserId());
            taskMember.setUpdateBy(SecurityUtils.getUsername());

            notice.setNoticeId(Long.valueOf(noticeId));
            notice.setUpdateBy(SecurityUtils.getUsername());
            notice.setStatus("1");
            noticeService.updateNotice(notice);
            return taskMember;
        } else {
            return new TaskMember();
        }
    }

    /**
     * 获取加入或拒绝课题所需的参数
     * @param noticeId 课题id
     * @return 结果
     */
    private TaskMember getTaskMember1(String noticeId ) {
        SysNotice notice = new SysNotice();
        SysNoticeStatus noticeStatus = new SysNoticeStatus();
        TaskMember taskMember = new TaskMember();

        noticeStatus.setUserId(SecurityUtils.getUsername());
        noticeStatus.setNoticeId(noticeId);
        List<SysNoticeStatus> noticeStatuses = noticeStatusService.selectNoticeStatus(noticeStatus);

        if (noticeStatuses.size() == 1) {
            taskMember.setTaskId(noticeStatuses.get(0).getTaskId());
            taskMember.setStudentUserName(noticeStatuses.get(0).getCreateBy());
            taskMember.setCreateBy(SecurityUtils.getUsername());

            notice.setNoticeId(Long.valueOf(noticeId));
            notice.setUpdateBy(SecurityUtils.getUsername());
            notice.setStatus("1");
            noticeService.updateNotice(notice);
            return taskMember;
        } else {
            return new TaskMember();
        }
    }
}
