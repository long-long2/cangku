package cn.bgs.pojo;

import java.util.List;

public class Items {
    private Integer id;
    private String numActual;
    private String newClient;
    private String oldClient;
    private String yxClient;
    private String money;
    private String available;
    private String createtime;
    private String autoTimestamp;
    private Integer planId;
    private Integer deptId;
    private Integer areaId;
    private String areaCode;
    private Integer userId;
    private String userCode;
private Area areas;
    private Plan plan;

    public Plan getPlan() {
        return plan;
    }

    public void setPlan(Plan plan) {
        this.plan = plan;
    }

    public Area getAreas() {
        return areas;
    }

    public void setAreas(Area areas) {
        this.areas = areas;
    }

    @Override
    public String toString() {
        return "Items{" +
                "id=" + id +
                ", numActual='" + numActual + '\'' +
                ", newClient='" + newClient + '\'' +
                ", oldClient='" + oldClient + '\'' +
                ", yxClient='" + yxClient + '\'' +
                ", money='" + money + '\'' +
                ", available='" + available + '\'' +
                ", createtime='" + createtime + '\'' +
                ", autoTimestamp='" + autoTimestamp + '\'' +
                ", planId=" + planId +
                ", deptId=" + deptId +
                ", areaId=" + areaId +
                ", areaCode='" + areaCode + '\'' +
                ", userId=" + userId +
                ", userCode='" + userCode + '\'' +
                ", areas=" + areas +
                ", plan=" + plan +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNumActual() {
        return numActual;
    }

    public void setNumActual(String numActual) {
        this.numActual = numActual;
    }

    public String getNewClient() {
        return newClient;
    }

    public void setNewClient(String newClient) {
        this.newClient = newClient;
    }

    public String getOldClient() {
        return oldClient;
    }

    public void setOldClient(String oldClient) {
        this.oldClient = oldClient;
    }

    public String getYxClient() {
        return yxClient;
    }

    public void setYxClient(String yxClient) {
        this.yxClient = yxClient;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public String getAvailable() {
        return available;
    }

    public void setAvailable(String available) {
        this.available = available;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getAutoTimestamp() {
        return autoTimestamp;
    }

    public void setAutoTimestamp(String autoTimestamp) {
        this.autoTimestamp = autoTimestamp;
    }

    public Integer getPlanId() {
        return planId;
    }

    public void setPlanId(Integer planId) {
        this.planId = planId;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    public String getAreaCode() {
        return areaCode;
    }

    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserCode() {
        return userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode;
    }
}
