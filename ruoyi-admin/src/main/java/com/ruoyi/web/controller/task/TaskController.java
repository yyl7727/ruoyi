package com.ruoyi.web.controller.task;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.Task;
import com.ruoyi.system.service.ITaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/task")
public class TaskController extends BaseController {
    @Autowired
    ITaskService taskService;

    /**
     * 获取课题列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Task task) {
        startPage();
        List<Task> list = taskService.selectTaskList(task);
        return getDataTable(list);
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
}
