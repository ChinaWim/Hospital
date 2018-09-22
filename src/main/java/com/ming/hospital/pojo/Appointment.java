package com.ming.hospital.pojo;

import java.util.Date;

public class Appointment {
    private Long aid;

    private Long uid;

    private String visittime;

    private Long did;

    private String name;

    private String idcast;

    private String aphone;

    private Date createtime;

    private Date updatetime;

    public Long getAid() {
        return aid;
    }

    public void setAid(Long aid) {
        this.aid = aid;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public String getVisittime() {
        return visittime;
    }

    public void setVisittime(String visittime) {
        this.visittime = visittime == null ? null : visittime.trim();
    }

    public Long getDid() {
        return did;
    }

    public void setDid(Long did) {
        this.did = did;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getIdcast() {
        return idcast;
    }

    public void setIdcast(String idcast) {
        this.idcast = idcast == null ? null : idcast.trim();
    }

    public String getAphone() {
        return aphone;
    }

    public void setAphone(String aphone) {
        this.aphone = aphone == null ? null : aphone.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    @Override
    public String toString() {
        return "Appointment{" +
                "aid=" + aid +
                ", uid=" + uid +
                ", visittime='" + visittime + '\'' +
                ", did=" + did +
                ", name='" + name + '\'' +
                ", idcast='" + idcast + '\'' +
                ", aphone='" + aphone + '\'' +
                ", createtime=" + createtime +
                ", updatetime=" + updatetime +
                '}';
    }
}