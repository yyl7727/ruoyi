package com.ruoyi.system.domain.vo;

public class TaskMemberVo {
    private String Id;

    private String taskId;

    private String taskName;

    private String taskTeacher;

    private String studentName;

    private String status;

    private String isDelete;

    public String getId() {
        return Id;
    }

    public void setId(String id) {
        Id = id;
    }

    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public String getTaskTeacher() {
        return taskTeacher;
    }

    public void setTaskTeacher(String taskTeacher) {
        this.taskTeacher = taskTeacher;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
    }
}
