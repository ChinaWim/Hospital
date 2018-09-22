package com.ming.hospital.pojo;

import java.util.ArrayList;
import java.util.List;

public class DeptExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public DeptExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andDeidIsNull() {
            addCriterion("deid is null");
            return (Criteria) this;
        }

        public Criteria andDeidIsNotNull() {
            addCriterion("deid is not null");
            return (Criteria) this;
        }

        public Criteria andDeidEqualTo(Long value) {
            addCriterion("deid =", value, "deid");
            return (Criteria) this;
        }

        public Criteria andDeidNotEqualTo(Long value) {
            addCriterion("deid <>", value, "deid");
            return (Criteria) this;
        }

        public Criteria andDeidGreaterThan(Long value) {
            addCriterion("deid >", value, "deid");
            return (Criteria) this;
        }

        public Criteria andDeidGreaterThanOrEqualTo(Long value) {
            addCriterion("deid >=", value, "deid");
            return (Criteria) this;
        }

        public Criteria andDeidLessThan(Long value) {
            addCriterion("deid <", value, "deid");
            return (Criteria) this;
        }

        public Criteria andDeidLessThanOrEqualTo(Long value) {
            addCriterion("deid <=", value, "deid");
            return (Criteria) this;
        }

        public Criteria andDeidIn(List<Long> values) {
            addCriterion("deid in", values, "deid");
            return (Criteria) this;
        }

        public Criteria andDeidNotIn(List<Long> values) {
            addCriterion("deid not in", values, "deid");
            return (Criteria) this;
        }

        public Criteria andDeidBetween(Long value1, Long value2) {
            addCriterion("deid between", value1, value2, "deid");
            return (Criteria) this;
        }

        public Criteria andDeidNotBetween(Long value1, Long value2) {
            addCriterion("deid not between", value1, value2, "deid");
            return (Criteria) this;
        }

        public Criteria andDegradeIsNull() {
            addCriterion("degrade is null");
            return (Criteria) this;
        }

        public Criteria andDegradeIsNotNull() {
            addCriterion("degrade is not null");
            return (Criteria) this;
        }

        public Criteria andDegradeEqualTo(Integer value) {
            addCriterion("degrade =", value, "degrade");
            return (Criteria) this;
        }

        public Criteria andDegradeNotEqualTo(Integer value) {
            addCriterion("degrade <>", value, "degrade");
            return (Criteria) this;
        }

        public Criteria andDegradeGreaterThan(Integer value) {
            addCriterion("degrade >", value, "degrade");
            return (Criteria) this;
        }

        public Criteria andDegradeGreaterThanOrEqualTo(Integer value) {
            addCriterion("degrade >=", value, "degrade");
            return (Criteria) this;
        }

        public Criteria andDegradeLessThan(Integer value) {
            addCriterion("degrade <", value, "degrade");
            return (Criteria) this;
        }

        public Criteria andDegradeLessThanOrEqualTo(Integer value) {
            addCriterion("degrade <=", value, "degrade");
            return (Criteria) this;
        }

        public Criteria andDegradeIn(List<Integer> values) {
            addCriterion("degrade in", values, "degrade");
            return (Criteria) this;
        }

        public Criteria andDegradeNotIn(List<Integer> values) {
            addCriterion("degrade not in", values, "degrade");
            return (Criteria) this;
        }

        public Criteria andDegradeBetween(Integer value1, Integer value2) {
            addCriterion("degrade between", value1, value2, "degrade");
            return (Criteria) this;
        }

        public Criteria andDegradeNotBetween(Integer value1, Integer value2) {
            addCriterion("degrade not between", value1, value2, "degrade");
            return (Criteria) this;
        }

        public Criteria andDenameIsNull() {
            addCriterion("dename is null");
            return (Criteria) this;
        }

        public Criteria andDenameIsNotNull() {
            addCriterion("dename is not null");
            return (Criteria) this;
        }

        public Criteria andDenameEqualTo(String value) {
            addCriterion("dename =", value, "dename");
            return (Criteria) this;
        }

        public Criteria andDenameNotEqualTo(String value) {
            addCriterion("dename <>", value, "dename");
            return (Criteria) this;
        }

        public Criteria andDenameGreaterThan(String value) {
            addCriterion("dename >", value, "dename");
            return (Criteria) this;
        }

        public Criteria andDenameGreaterThanOrEqualTo(String value) {
            addCriterion("dename >=", value, "dename");
            return (Criteria) this;
        }

        public Criteria andDenameLessThan(String value) {
            addCriterion("dename <", value, "dename");
            return (Criteria) this;
        }

        public Criteria andDenameLessThanOrEqualTo(String value) {
            addCriterion("dename <=", value, "dename");
            return (Criteria) this;
        }

        public Criteria andDenameLike(String value) {
            addCriterion("dename like", value, "dename");
            return (Criteria) this;
        }

        public Criteria andDenameNotLike(String value) {
            addCriterion("dename not like", value, "dename");
            return (Criteria) this;
        }

        public Criteria andDenameIn(List<String> values) {
            addCriterion("dename in", values, "dename");
            return (Criteria) this;
        }

        public Criteria andDenameNotIn(List<String> values) {
            addCriterion("dename not in", values, "dename");
            return (Criteria) this;
        }

        public Criteria andDenameBetween(String value1, String value2) {
            addCriterion("dename between", value1, value2, "dename");
            return (Criteria) this;
        }

        public Criteria andDenameNotBetween(String value1, String value2) {
            addCriterion("dename not between", value1, value2, "dename");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}