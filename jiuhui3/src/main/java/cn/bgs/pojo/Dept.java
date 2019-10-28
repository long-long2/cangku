package cn.bgs.pojo;

public class Dept {
    private Integer id;
    private String deptCode;
    private String deptName;
    private String areaCode;
    private Integer areaId;
    private String available;
    private String type;
    private String areaName;

    @Override
    public String toString() {
        return "Dept{" +
                "id=" + id +
                ", deptCode='" + deptCode + '\'' +
                ", deptName='" + deptName + '\'' +
                ", areaCode='" + areaCode + '\'' +
                ", areaId=" + areaId +
                ", available='" + available + '\'' +
                ", type='" + type + '\'' +
                ", areaName='" + areaName + '\'' +
                '}';
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDeptCode() {
        return deptCode;
    }

    public void setDeptCode(String deptCode) {
        this.deptCode = deptCode;
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

    public String getAvailable() {
        return available;
    }

    public void setAvailable(String available) {
        this.available = available;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
