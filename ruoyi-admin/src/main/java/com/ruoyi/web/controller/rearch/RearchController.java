package com.ruoyi.web.controller.rearch;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysDictData;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.enums.DictType;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.Rearch;
import com.ruoyi.system.domain.vo.RearchVo;
import com.ruoyi.system.service.IRearchService;
import com.ruoyi.system.service.ISysDictTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 助研信息控制层
 */
@RestController
@RequestMapping("/rearch")
public class RearchController extends BaseController {
    @Autowired
    IRearchService rearchService;
    @Autowired
    ISysDictTypeService dictTypeService;

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
        rearch.setStudentMajor(rearchVo.getStudentMajor());
        if (StringUtils.isNotEmpty(rearchVo.getStudentDesc())) {
            rearch.setStudentDesc(rearchVo.getStudentDesc());
        }
        rearch.setCreateBy(userName);
        int isExist = rearchService.checkExist(rearch);
        if (isExist > 0){
            return AjaxResult.error("存在有效的助研信息，无法同时存在多个状态为有效的助研信息！");
        }
        return toAjax(rearchService.addRearch(rearch));
    }

    @GetMapping("/info")
    public TableDataInfo list(Rearch rearch) {
        //获取助研信息列表及需要格式化的状态字典
        List<Rearch> rearchList = rearchService.selectRearchList(rearch);
        List<SysDictData> studentMajorDict = dictTypeService.selectDictDataByType(DictType.studentMajor.toString());
        List<SysDictData> studentSkillDict = dictTypeService.selectDictDataByType(DictType.studentSkill.toString());
        List<SysDictData> rearchStatusDict = dictTypeService.selectDictDataByType(DictType.rearchStatus.toString());
        Map<String,String> studentMajorMap = new HashMap<>();
        Map<String,String> studentSkillMap = new HashMap<>();
        Map<String,String> rearchStatusMap = new HashMap<>();

        //将获取的字典数据放到map中方便后续处理
        for (SysDictData sysDictData : studentMajorDict) {
            studentMajorMap.put(sysDictData.getDictValue(),sysDictData.getDictLabel());
        }
        for (SysDictData sysDictData : studentSkillDict) {
            studentSkillMap.put(sysDictData.getDictValue(),sysDictData.getDictLabel());
        }
        for (SysDictData sysDictData : rearchStatusDict) {
            rearchStatusMap.put(sysDictData.getDictValue(),sysDictData.getDictLabel());
        }

        //使用map处理助研信息列表对码值数据进行格式化处理
        for (Rearch rearch1 : rearchList) {
            //学生专业格式化
            rearch1.setStudentMajor(studentMajorMap.get(rearch1.getStudentMajor()));

            //技术方向格式化
            StringBuilder skillBuilder = new StringBuilder();
            String[] skills = rearch1.getSkill().split(",");
            for (String skill : skills) {
                skillBuilder.append(studentSkillMap.get(skill)).append(" ");
            }
            rearch1.setSkill(skillBuilder.toString());

            //助研信息状态格式化
            rearch1.setStatus(rearchStatusMap.get(rearch1.getStatus()));
        }
        startPage();
        return getDataTable(rearchList);
    }
}
