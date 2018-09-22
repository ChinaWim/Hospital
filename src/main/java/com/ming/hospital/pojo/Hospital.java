package com.ming.hospital.pojo;

import java.util.List;

public class Hospital {
    private Long hid;

    private String hname;

    private String hphone;

    private String address;

    private Float score;

    private String grade;

    private String description;

    private Integer insurance;

    private String image;

    private List<Doctor> doctorList;

    private Integer times; //提供服务次数

    public Integer getTimes() {
        return times;
    }

    public void setTimes(Integer times) {
        this.times = times;
    }

    public Long getHid() {
        return hid;
    }

    public void setHid(Long hid) {
        this.hid = hid;
    }

    public String getHname() {
        return hname;
    }

    public void setHname(String hname) {
        this.hname = hname == null ? null : hname.trim();
    }

    public String getHphone() {
        return hphone;
    }

    public void setHphone(String hphone) {
        this.hphone = hphone == null ? null : hphone.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Float getScore() {
        return score;
    }

    public void setScore(Float score) {
        this.score = score;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade == null ? null : grade.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Integer getInsurance() {
        return insurance;
    }

    public void setInsurance(Integer insurance) {
        this.insurance = insurance;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public List<Doctor> getDoctorList() {
        return doctorList;
    }

    public void setDoctorList(List<Doctor> doctorList) {
        this.doctorList = doctorList;
    }

    @Override
    public String toString() {
        return "Hospital{" +
                "hid=" + hid +
                ", hname='" + hname + '\'' +
                ", hphone='" + hphone + '\'' +
                ", address='" + address + '\'' +
                ", score=" + score +
                ", grade='" + grade + '\'' +
                ", description='" + description + '\'' +
                ", insurance=" + insurance +
                ", image='" + image + '\'' +
                ", doctorList=" + doctorList +
                ", times=" + times +
                '}';
    }
}