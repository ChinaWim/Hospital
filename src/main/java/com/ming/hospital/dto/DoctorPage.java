package com.ming.hospital.dto;

/**
 * Created by Ming on 2017/11/19.
 */
public class DoctorPage {
    //科室id，医生等级,//搜索关键字
    private Long deid;
    private Integer grade;
    private String key;
    private Integer pageNum = 1;
    private Integer pageSize = 5;

    private Long hid;

    public Long getHid() {
        return hid;
    }

    public void setHid(Long hid) {
        this.hid = hid;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public Long getDeid() {
        return deid;
    }

    public void setDeid(Long deid) {
        this.deid = deid;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    @Override
    public String toString() {
        return "DoctorPage{" +
                "deid=" + deid +
                ", grade=" + grade +
                ", key='" + key + '\'' +
                ", pageNum=" + pageNum +
                ", pageSize=" + pageSize +
                ", hid=" + hid +
                '}';
    }
}
