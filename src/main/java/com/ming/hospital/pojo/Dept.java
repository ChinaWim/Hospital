package com.ming.hospital.pojo;

public class Dept {
    private Long deid;

    private Integer degrade;

    private String dename;

    public Long getDeid() {
        return deid;
    }

    public void setDeid(Long deid) {
        this.deid = deid;
    }

    public Integer getDegrade() {
        return degrade;
    }

    public void setDegrade(Integer degrade) {
        this.degrade = degrade;
    }

    public String getDename() {
        return dename;
    }

    public void setDename(String dename) {
        this.dename = dename == null ? null : dename.trim();
    }

    @Override
    public String toString() {
        return "Dept{" +
                "deid=" + deid +
                ", degrade=" + degrade +
                ", dename='" + dename + '\'' +
                '}';
    }
}