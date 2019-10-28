package cn.bgs.pojo;

public class Plan {
    private Integer id;
    private String activitiesName;
    private String numActivities;
    private Integer deptId;
    private String deptName;
    private String areaCode;
    private Integer areaId;
    private Integer available;
    private String type;
    private String startTime;
    private String endTime;
    private String timestamp;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getActivitiesName() {
        return activitiesName;
    }

    public void setActivitiesName(String activitiesName) {
        this.activitiesName = activitiesName;
    }

    public String getNumActivities() {
        return numActivities;
    }

    public void setNumActivities(String numActivities) {
        this.numActivities = numActivities;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getAreaCode() {
        return areaCode;
    }

    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode;
    }

    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    public Integer getAvailable() {
        return available;
    }

    public void setAvailable(Integer available) {
        this.available = available;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }
}
