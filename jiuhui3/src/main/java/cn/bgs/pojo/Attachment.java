package cn.bgs.pojo;

public class Attachment {
    private Integer id;
    private String itemId;
    private String fileextensions;
    private  String url;
    private String size;
    private String date;
    private String shootingtime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getItemId() {
        return itemId;
    }

    public void setItemId(String itemId) {
        this.itemId = itemId;
    }

    public String getFileextensions(String exName) {
        return fileextensions;
    }

    public void setFileextensions(String fileextensions) {
        this.fileextensions = fileextensions;
    }

    public String getFileextensions() {
        return fileextensions;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getShootingtime() {
        return shootingtime;
    }

    public void setShootingtime(String shootingtime) {
        this.shootingtime = shootingtime;
    }
}
