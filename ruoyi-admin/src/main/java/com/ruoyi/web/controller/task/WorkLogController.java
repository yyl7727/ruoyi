package com.ruoyi.web.controller.task;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.WorkLog;
import com.ruoyi.system.domain.vo.WorkLogVo;
import com.ruoyi.system.service.ISysRoleService;
import com.ruoyi.system.service.IWorkLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 工作日志
 * @author zxy
 */
@RestController
@RequestMapping("/workLog")
public class WorkLogController extends BaseController {
    @Autowired
    IWorkLogService workLogService;
    @Autowired
    ISysRoleService sysRoleService;

    /**
     * 获取工作日志列表
     */
    @GetMapping("/list")
    public TableDataInfo list(WorkLog workLog) {
        startPage();
        List<WorkLogVo> list;

        //获取登录用户的角色
        Integer roleId = sysRoleService.selectRoleListByUserId(SecurityUtils.getLoginUser().getUser().getUserId()).get(0);
        SysRole role = sysRoleService.selectRoleById(Long.parseLong(roleId.toString()));

        //管理员显示所有数据
        if (SecurityUtils.isAdmin(SecurityUtils.getLoginUser().getUser().getUserId())) {
            list = workLogService.selectWorkLogList(workLog);
        } else if (role.getRoleName().equals("教师")){
            list = workLogService.selectWorkLogListByTaskId();
        } else {
            list = workLogService.selectWorkLogListByUserName(SecurityUtils.getUsername());
        }
        return getDataTable(list);
    }

    @GetMapping("getWorkLog/{workLogId}")
    public AjaxResult getWorkLog(@PathVariable String workLogId) {
        return AjaxResult.success(workLogService.selectWorkLogById(workLogId));
    }

    @PostMapping("/add")
    @Log(title = "工作日志", businessType = BusinessType.INSERT)
    public AjaxResult addWorkLog(@RequestBody WorkLog workLog) {
        workLog.setCreateBy(SecurityUtils.getUsername());
        return toAjax(workLogService.addWorkLog(workLog));
    }

    @PutMapping("/update")
    @Log(title = "工作日志", businessType = BusinessType.UPDATE)
    public AjaxResult updateWorkLog(@RequestBody WorkLog workLog) {
        workLog.setUpdateBy(SecurityUtils.getUsername());
        return toAjax(workLogService.updateWorkLog(workLog));
    }

    @PutMapping("/delete")
    @Log(title = "工作日志", businessType = BusinessType.UPDATE)
    public AjaxResult deleteWorkLog(@RequestBody String[] logIds) {
        return toAjax(workLogService.deleteWorkLog(logIds,SecurityUtils.getUsername()));
    }
}
