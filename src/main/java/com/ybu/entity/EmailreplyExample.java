package com.ybu.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class EmailreplyExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public EmailreplyExample() {
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

        public Criteria andLeridIsNull() {
            addCriterion("lerid is null");
            return (Criteria) this;
        }

        public Criteria andLeridIsNotNull() {
            addCriterion("lerid is not null");
            return (Criteria) this;
        }

        public Criteria andLeridEqualTo(Integer value) {
            addCriterion("lerid =", value, "lerid");
            return (Criteria) this;
        }

        public Criteria andLeridNotEqualTo(Integer value) {
            addCriterion("lerid <>", value, "lerid");
            return (Criteria) this;
        }

        public Criteria andLeridGreaterThan(Integer value) {
            addCriterion("lerid >", value, "lerid");
            return (Criteria) this;
        }

        public Criteria andLeridGreaterThanOrEqualTo(Integer value) {
            addCriterion("lerid >=", value, "lerid");
            return (Criteria) this;
        }

        public Criteria andLeridLessThan(Integer value) {
            addCriterion("lerid <", value, "lerid");
            return (Criteria) this;
        }

        public Criteria andLeridLessThanOrEqualTo(Integer value) {
            addCriterion("lerid <=", value, "lerid");
            return (Criteria) this;
        }

        public Criteria andLeridIn(List<Integer> values) {
            addCriterion("lerid in", values, "lerid");
            return (Criteria) this;
        }

        public Criteria andLeridNotIn(List<Integer> values) {
            addCriterion("lerid not in", values, "lerid");
            return (Criteria) this;
        }

        public Criteria andLeridBetween(Integer value1, Integer value2) {
            addCriterion("lerid between", value1, value2, "lerid");
            return (Criteria) this;
        }

        public Criteria andLeridNotBetween(Integer value1, Integer value2) {
            addCriterion("lerid not between", value1, value2, "lerid");
            return (Criteria) this;
        }

        public Criteria andReplytimeIsNull() {
            addCriterion("replytime is null");
            return (Criteria) this;
        }

        public Criteria andReplytimeIsNotNull() {
            addCriterion("replytime is not null");
            return (Criteria) this;
        }

        public Criteria andReplytimeEqualTo(Date value) {
            addCriterion("replytime =", value, "replytime");
            return (Criteria) this;
        }

        public Criteria andReplytimeNotEqualTo(Date value) {
            addCriterion("replytime <>", value, "replytime");
            return (Criteria) this;
        }

        public Criteria andReplytimeGreaterThan(Date value) {
            addCriterion("replytime >", value, "replytime");
            return (Criteria) this;
        }

        public Criteria andReplytimeGreaterThanOrEqualTo(Date value) {
            addCriterion("replytime >=", value, "replytime");
            return (Criteria) this;
        }

        public Criteria andReplytimeLessThan(Date value) {
            addCriterion("replytime <", value, "replytime");
            return (Criteria) this;
        }

        public Criteria andReplytimeLessThanOrEqualTo(Date value) {
            addCriterion("replytime <=", value, "replytime");
            return (Criteria) this;
        }

        public Criteria andReplytimeIn(List<Date> values) {
            addCriterion("replytime in", values, "replytime");
            return (Criteria) this;
        }

        public Criteria andReplytimeNotIn(List<Date> values) {
            addCriterion("replytime not in", values, "replytime");
            return (Criteria) this;
        }

        public Criteria andReplytimeBetween(Date value1, Date value2) {
            addCriterion("replytime between", value1, value2, "replytime");
            return (Criteria) this;
        }

        public Criteria andReplytimeNotBetween(Date value1, Date value2) {
            addCriterion("replytime not between", value1, value2, "replytime");
            return (Criteria) this;
        }

        public Criteria andLeidIsNull() {
            addCriterion("leid is null");
            return (Criteria) this;
        }

        public Criteria andLeidIsNotNull() {
            addCriterion("leid is not null");
            return (Criteria) this;
        }

        public Criteria andLeidEqualTo(Integer value) {
            addCriterion("leid =", value, "leid");
            return (Criteria) this;
        }

        public Criteria andLeidNotEqualTo(Integer value) {
            addCriterion("leid <>", value, "leid");
            return (Criteria) this;
        }

        public Criteria andLeidGreaterThan(Integer value) {
            addCriterion("leid >", value, "leid");
            return (Criteria) this;
        }

        public Criteria andLeidGreaterThanOrEqualTo(Integer value) {
            addCriterion("leid >=", value, "leid");
            return (Criteria) this;
        }

        public Criteria andLeidLessThan(Integer value) {
            addCriterion("leid <", value, "leid");
            return (Criteria) this;
        }

        public Criteria andLeidLessThanOrEqualTo(Integer value) {
            addCriterion("leid <=", value, "leid");
            return (Criteria) this;
        }

        public Criteria andLeidIn(List<Integer> values) {
            addCriterion("leid in", values, "leid");
            return (Criteria) this;
        }

        public Criteria andLeidNotIn(List<Integer> values) {
            addCriterion("leid not in", values, "leid");
            return (Criteria) this;
        }

        public Criteria andLeidBetween(Integer value1, Integer value2) {
            addCriterion("leid between", value1, value2, "leid");
            return (Criteria) this;
        }

        public Criteria andLeidNotBetween(Integer value1, Integer value2) {
            addCriterion("leid not between", value1, value2, "leid");
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