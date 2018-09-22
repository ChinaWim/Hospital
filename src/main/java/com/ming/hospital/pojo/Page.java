package com.ming.hospital.pojo;

import java.util.List;

/**
 * Created by Ming on 2017/11/18.
 */
public class Page<T> {
    private Integer totalCount;
    private Integer totalPage;
    private Integer PageNum;
    private Integer PageSize;
    private List<T> data;

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public Integer getPageNum() {
        return PageNum;
    }

    public void setPageNum(Integer pageNum) {
        PageNum = pageNum;
    }

    public Integer getPageSize() {
        return PageSize;
    }

    public void setPageSize(Integer pageSize) {
        PageSize = pageSize;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "Page{" +
                "totalCount=" + totalCount +
                ", totalPage=" + totalPage +
                ", PageNum=" + PageNum +
                ", PageSize=" + PageSize +
                ", data=" + data +
                '}';
    }
}
