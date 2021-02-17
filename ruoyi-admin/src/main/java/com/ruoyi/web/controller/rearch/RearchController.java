package com.ruoyi.web.controller.rearch;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.Rearch;
import com.ruoyi.system.domain.vo.RearchVo;
import com.ruoyi.system.service.IRearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.lang.reflect.Array;
import java.util.Arrays;

@RestController
@RequestMapping("/rearch")
public class RearchController extends BaseController {
    @Autowired
    IRearchService rearchService;

    @PostMapping("/add")
    @Log(title = "助研信息", businessType = BusinessType.INSERT)
    public AjaxResult add(@RequestBody RearchVo rearchVo) {
        Rearch rearch = new Rearch();
        String userName = SecurityUtils.getUsername();
        rearch.setStudentId(userName);
        rearch.setStudentName(SecurityUtils.getLoginUser().getUser().getNickName());
        rearch.setSkill(StringUtils.join(rearchVo.getSkill(),','));
        rearch.setStudentPhone(rearchVo.getStudentPhone());
        rearch.setStudentEmail(rearchVo.getStudentEmail());
        if (StringUtils.isNotEmpty(rearchVo.getStudentDesc())) {
            rearch.setStudentDesc(rearchVo.getStudentDesc());
        }
        rearch.setCreateBy(userName);
        return toAjax(rearchService.addRearch(rearch));
    }
}
