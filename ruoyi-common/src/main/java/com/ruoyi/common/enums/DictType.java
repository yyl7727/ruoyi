package com.ruoyi.common.enums;

public enum DictType {
    /**
     * 学生专业
     */
    studentMajor("student_major"),
    /**
     * 学生技术方向
     */
    studentSkill("student_skill"),
    /**
     * 助研信息状态
     */
    rearchStatus("rearch_status");


    private final String text;
    DictType(String text) {
        this.text = text;
    }
    @Override
    public String toString() {
        return text;
    }
}
