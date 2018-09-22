package com.ming.hospital.dto;

/**
 * Created by Ming on 2017/11/19.
 */
public class HospitalPage {
    private String name;
    private String grade;
    private Integer pageNum;
    private Integer pageSize;
    private Integer insurance;
    private Integer times;
    public Integer getTimes() {
        return times;
    }

    public void setTimes(Integer times) {
        this.times = times;
    }

    public Integer getInsurance() {
        return insurance;
    }

    public void setInsurance(Integer insurance) {
        this.insurance = insurance;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
        return "HospitalPage{" +
                "name='" + name + '\'' +
                ", grade='" + grade + '\'' +
                ", pageNum=" + pageNum +
                ", pageSize=" + pageSize +
                ", insurance=" + insurance +
                ", times=" + times +
                '}';
    }
}
