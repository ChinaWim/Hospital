package com.ming.hospital.pojo;

public class Doctor {
    private String surgeryweek;

    public String getSurgeryweek() {
        return surgeryweek;
    }

    public void setSurgeryweek(String surgeryweek) {
        this.surgeryweek = surgeryweek;
    }

    private Hospital hospital;

    private Long hid;

    private Dept dept;

    private Long deid;

    public Hospital getHospital() {
        return hospital;
    }

    public void setHospital(Hospital hospital) {
        this.hospital = hospital;
    }

    private Long did;

    private String dname;

    private String gender;

    private Float score;

    private Integer grade;

    private String skill;

    private String description;

    private String image;


    public Long getHid() {
        return hid;
    }

    public void setHid(Long hid) {
        this.hid = hid;
    }

    public Long getDeid() {
        return deid;
    }

    public void setDeid(Long deid) {
        this.deid = deid;
    }

    public Long getDid() {
        return did;
    }

    public void setDid(Long did) {
        this.did = did;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname == null ? null : dname.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }



    public Float getScore() {
        return score;
    }

    public void setScore(Float score) {
        this.score = score;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }



    public String getSkill() {
        return skill;
    }

    public void setSkill(String skill) {
        this.skill = skill == null ? null : skill.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public Dept getDept() {
        return dept;
    }

    public void setDept(Dept dept) {
        this.dept = dept;
    }

    @Override
    public String toString() {
        return "Doctor{" +
                "surgeryweek='" + surgeryweek + '\'' +
                ", hospital=" + hospital +
                ", hid=" + hid +
                ", dept=" + dept +
                ", deid=" + deid +
                ", did=" + did +
                ", dname='" + dname + '\'' +
                ", gender='" + gender + '\'' +
                ", score=" + score +
                ", grade=" + grade +
                ", skill='" + skill + '\'' +
                ", description='" + description + '\'' +
                ", image='" + image + '\'' +
                '}';
    }
}