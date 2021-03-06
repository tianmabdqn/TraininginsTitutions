package cn.huizhi.pojo;

import java.util.Date;

public class Order {

	private Integer orderId;
	private String feecateId;
	private Double dpMoney;
	private Integer stuId;
	private Date startTime;
	private Integer schoolId;
	private Integer identification;
	private Double feecategoryMoney;
	private Integer paymentmethodId;
	private String personliable;
	private Integer departmentofpediatricsId;
	private Integer addhour;
	private Integer givehour;
	private Date firstdate;
	private Date lastdate;
	private String remarks;
	private String orderNumber;
	private Integer expenditureitemsId;
	private Integer classId;
	private String feecateMoney;
	private String feecateMoneyYiKao;
	private Integer activityId;
	private Double serviceCharge;

	private String cityId;
	private String cityProperId;
	/**
	 * 学生交钱总数
	 */
	private Double sumDpMoney;

	private Integer giftId;
	private Integer giftNumber;
	private Double integral;
	private Integer teacherId;
	private Double discount;
	private Date endTime;
	private Integer renew;
	/**
	 * 学生
	 */
	private Student student;

	/**
	 * 账户类型
	 */
	private PaymentMethod paymentMethod;
	/**
	 * 课程类型
	 */
	private DepartmentOfPediatrics departmentOfPediatrics;
	/**
	 * 
	 * 收入类型
	 */
	private FeeCategory feeCategory;

	/**
	 * 支出类型
	 */
	private Expenditureitems expenditureitems;

	private School school;
	private Gift gift;
	private Teacher teacher;
	private Class classes;

	public Order() {
		super();
	}

	public Order(Integer orderId, String feecateId, Double dpMoney, Integer stuId, Date startTime, Integer schoolId,
			Integer identification, Double feecategoryMoney, Integer paymentmethodId, String personliable,
			Integer departmentofpediatricsId, Integer addhour, Integer givehour, Date firstdate, Date lastdate,
			String remarks, String orderNumber, Integer expenditureitemsId, Integer classId, String feecateMoney,
			String feecateMoneyYiKao, Integer activityId, Double serviceCharge, String cityId, String cityProperId,
			Double sumDpMoney, Integer giftId, Integer giftNumber, Double integral, Integer teacherId, Double discount,
			Date endTime, Integer renew, Student student, PaymentMethod paymentMethod,
			DepartmentOfPediatrics departmentOfPediatrics, FeeCategory feeCategory, Expenditureitems expenditureitems,
			School school, Gift gift, Teacher teacher, Class classes) {
		super();
		this.orderId = orderId;
		this.feecateId = feecateId;
		this.dpMoney = dpMoney;
		this.stuId = stuId;
		this.startTime = startTime;
		this.schoolId = schoolId;
		this.identification = identification;
		this.feecategoryMoney = feecategoryMoney;
		this.paymentmethodId = paymentmethodId;
		this.personliable = personliable;
		this.departmentofpediatricsId = departmentofpediatricsId;
		this.addhour = addhour;
		this.givehour = givehour;
		this.firstdate = firstdate;
		this.lastdate = lastdate;
		this.remarks = remarks;
		this.orderNumber = orderNumber;
		this.expenditureitemsId = expenditureitemsId;
		this.classId = classId;
		this.feecateMoney = feecateMoney;
		this.feecateMoneyYiKao = feecateMoneyYiKao;
		this.activityId = activityId;
		this.serviceCharge = serviceCharge;
		this.cityId = cityId;
		this.cityProperId = cityProperId;
		this.sumDpMoney = sumDpMoney;
		this.giftId = giftId;
		this.giftNumber = giftNumber;
		this.integral = integral;
		this.teacherId = teacherId;
		this.discount = discount;
		this.endTime = endTime;
		this.renew = renew;
		this.student = student;
		this.paymentMethod = paymentMethod;
		this.departmentOfPediatrics = departmentOfPediatrics;
		this.feeCategory = feeCategory;
		this.expenditureitems = expenditureitems;
		this.school = school;
		this.gift = gift;
		this.teacher = teacher;
		this.classes = classes;
	}

	public Integer getActivityId() {
		return activityId;
	}

	public void setActivityId(Integer activityId) {
		this.activityId = activityId;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public String getCityId() {
		return cityId;
	}

	public void setCityId(String cityId) {
		this.cityId = cityId;
	}

	public String getCityProperId() {
		return cityProperId;
	}

	public void setCityProperId(String cityProperId) {
		this.cityProperId = cityProperId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public String getFeecateId() {
		return feecateId;
	}

	public void setFeecateId(String feecateId) {
		this.feecateId = feecateId;
	}

	public Double getDpMoney() {
		return dpMoney;
	}

	public void setDpMoney(Double dpMoney) {
		this.dpMoney = dpMoney;
	}

	public Integer getStuId() {
		return stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Integer getSchoolId() {
		return schoolId;
	}

	public void setSchoolId(Integer schoolId) {
		this.schoolId = schoolId;
	}

	public Integer getIdentification() {
		return identification;
	}

	public void setIdentification(Integer identification) {
		this.identification = identification;
	}

	public Double getFeecategoryMoney() {
		return feecategoryMoney;
	}

	public void setFeecategoryMoney(Double feecategoryMoney) {
		this.feecategoryMoney = feecategoryMoney;
	}

	public Integer getPaymentmethodId() {
		return paymentmethodId;
	}

	public void setPaymentmethodId(Integer paymentmethodId) {
		this.paymentmethodId = paymentmethodId;
	}

	public String getPersonliable() {
		return personliable;
	}

	public void setPersonliable(String personliable) {
		this.personliable = personliable;
	}

	public Integer getDepartmentofpediatricsId() {
		return departmentofpediatricsId;
	}

	public void setDepartmentofpediatricsId(Integer departmentofpediatricsId) {
		this.departmentofpediatricsId = departmentofpediatricsId;
	}

	public Integer getAddhour() {
		return addhour;
	}

	public void setAddhour(Integer addhour) {
		this.addhour = addhour;
	}

	public Integer getGivehour() {
		return givehour;
	}

	public void setGivehour(Integer givehour) {
		this.givehour = givehour;
	}

	public Date getFirstdate() {
		return firstdate;
	}

	public void setFirstdate(Date firstdate) {
		this.firstdate = firstdate;
	}

	public Date getLastdate() {
		return lastdate;
	}

	public void setLastdate(Date lastdate) {
		this.lastdate = lastdate;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public Integer getExpenditureitemsId() {
		return expenditureitemsId;
	}

	public void setExpenditureitemsId(Integer expenditureitemsId) {
		this.expenditureitemsId = expenditureitemsId;
	}

	public Integer getClassId() {
		return classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
	}

	public Double getSumDpMoney() {
		return sumDpMoney;
	}

	public void setSumDpMoney(Double sumDpMoney) {
		this.sumDpMoney = sumDpMoney;
	}

	public Integer getGiftId() {
		return giftId;
	}

	public void setGiftId(Integer giftId) {
		this.giftId = giftId;
	}

	public Integer getGiftNumber() {
		return giftNumber;
	}

	public void setGiftNumber(Integer giftNumber) {
		this.giftNumber = giftNumber;
	}

	public Double getIntegral() {
		return integral;
	}

	public void setIntegral(Double integral) {
		this.integral = integral;
	}

	public Integer getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public PaymentMethod getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(PaymentMethod paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public DepartmentOfPediatrics getDepartmentOfPediatrics() {
		return departmentOfPediatrics;
	}

	public void setDepartmentOfPediatrics(DepartmentOfPediatrics departmentOfPediatrics) {
		this.departmentOfPediatrics = departmentOfPediatrics;
	}

	public FeeCategory getFeeCategory() {
		return feeCategory;
	}

	public void setFeeCategory(FeeCategory feeCategory) {
		this.feeCategory = feeCategory;
	}

	public Expenditureitems getExpenditureitems() {
		return expenditureitems;
	}

	public void setExpenditureitems(Expenditureitems expenditureitems) {
		this.expenditureitems = expenditureitems;
	}

	public School getSchool() {
		return school;
	}

	public void setSchool(School school) {
		this.school = school;
	}

	public Gift getGift() {
		return gift;
	}

	public void setGift(Gift gift) {
		this.gift = gift;
	}

	public String getFeecateMoney() {
		return feecateMoney;
	}

	public void setFeecateMoney(String feecateMoney) {
		this.feecateMoney = feecateMoney;
	}

	public String getFeecateMoneyYiKao() {
		return feecateMoneyYiKao;
	}

	public void setFeecateMoneyYiKao(String feecateMoneyYiKao) {
		this.feecateMoneyYiKao = feecateMoneyYiKao;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public Class getClasses() {
		return classes;
	}

	public void setClasses(Class classes) {
		this.classes = classes;
	}

	public Double getServiceCharge() {
		return serviceCharge;
	}

	public void setServiceCharge(Double serviceCharge) {
		this.serviceCharge = serviceCharge;
	}

	public Integer getRenew() {
		return renew;
	}

	public void setRenew(Integer renew) {
		this.renew = renew;
	}

}
