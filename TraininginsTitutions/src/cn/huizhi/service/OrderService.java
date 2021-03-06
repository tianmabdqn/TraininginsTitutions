
package cn.huizhi.service;

import java.util.List;


import cn.huizhi.pojo.Order;

public interface OrderService {

	/**
	 * 查询课时订单总数
	 * 
	 * @param schoolId
	 * @return
	 */
	public Integer selectCountHour(Integer schoolId);

	/**
	 * 查询时间段订单总数
	 * 
	 * @param schoolId
	 * @return
	 */
	public Integer selectCount(Integer schoolId);

	/**
	 * 查询其他订单总数
	 * 
	 * @param schoolId
	 * @return
	 */
	public Integer selectCountOther(Integer schoolId);

	/**
	 * 查询支出订单总数
	 * 
	 * @param schoolId
	 * @return
	 */
	public Integer selectCountExpenditure(Integer schoolId);
	
	/**
	 * 查询退费订单总数
	 * @param schoolId
	 * @return
	 */
	public Integer selectCountRefund(Integer schoolId);

	/**
	 * 查询课时订单
	 * 
	 * @return
	 */
	public List<Order> selectOrderHour(Integer schoolId, Integer page, String studentName, Integer classId);

	/**
	 * 查询时间段订单
	 * 
	 * @return
	 */
	public List<Order> selectOrderPeriod(Integer schoolId, Integer page, String studentName, Integer classId);

	/**
	 * 查询艺考时间段订单
	 * 
	 * @return
	 */
	public List<Order> selectOrderPeriods(Integer schoolId, Integer page, String studentName, Integer classId);

	/**
	 * 查询其他订单
	 * 
	 * @return
	 */
	public List<Order> selectOrderOther(Integer schoolId, Integer page, String studentName, Integer classId);

	/**
	 * 查询费用支出订单
	 * 
	 * @param schoolId
	 * @return
	 */
	public List<Order> selectOrderExpenditure(Integer schoolId, Integer page, String studentName, Integer classId);

	/**
	 * 修改订单
	 * 
	 * @param order
	 * @return
	 */
	public Integer updateOrderAll(Order order);

	/**
	 * 添加订单
	 * 
	 * @param order
	 * @return
	 */
	public Integer addOrder(Order order);

	/**
	 * 删除订单
	 * 
	 * @param orderId
	 * @return
	 */
	public Integer delOrder(Integer orderId);

	/**
	 * 根据学校主键查询你订单信息
	 * 
	 * @param schoolId
	 * @return
	 */
	public List<Order> findOrderListBySchool(Order order);

	/**
	 * 根据条件查询支出项目
	 * 
	 * @param order
	 * @return
	 */
	public List<Order> findExpenOrderList(Order order);

	/**
	 * 查询学生 赠品 税分
	 * 
	 * @param student
	 * @return
	 */
	public List<Order> selectUsedIntegral(String student);

	/**
	 * 查询少儿学生收费情况
	 * 
	 * @param classId
	 * @return
	 */
	public List<Order> selectChildrenFeeSituation(Integer classId, Integer studentId, String startTime, String endTime);

	/**
	 * 查询高中学生收费情况
	 * 
	 * @param classId
	 * @return
	 */
	public List<Order> selectHighsFeeSituation(Integer classId, String startTime, String endTime);

	/**
	 * 查询学生收费
	 * 
	 * @param studentId
	 * @return
	 */
	public List<Order> selectOrderListByStudentId(Integer studentId);

	/*
	 * 课程提醒
	 * 
	 * @param time
	 * 
	 * @return
	 */
	public List<Order> selectStduentHour(Integer time, Integer schoolId, String studentName, Integer number);

	/**
	 * 时间段提醒
	 * 
	 * @param time
	 * @return
	 */
	public List<Order> selectStduentDay(String time, Integer schoolId, String studentName, Integer number);

	/**
	 * 查询高中学生收费情况
	 * 
	 * @param classId
	 * @return
	 */
	public List<Order> selectArtFeeSituation(Integer classId);

	/**
	 * 查找参与活动订单
	 * 
	 * @param startTime
	 * @param activityId
	 * @return
	 */
	public List<Order> selectActivityOrders(String startTime, Integer activityId, Integer schoolId);

	public List<Order> selectArtFeeSituation(Integer classId, String startTime, String endTime);

	/**
	 * 删除表数据
	 * 
	 * @return
	 */
	public Integer delOrderTable();

	/**
	 * 查找获得赠品订单
	 * 
	 * @param startTime
	 * @param giftId
	 * @param schoolId
	 * @return
	 */
	public List<Order> selectGiftes(String startTime, Integer giftId, Integer schoolId);

	/**
	 * 招生报表
	 * 
	 * @param schoolId
	 * @return
	 */
	public List<Order> RecruitStudentes(String studentName, String startTime, Integer classes, Integer teacherId,
			Integer schoolId);

	/**
	 * 批量添加时间段订单
	 * 
	 * @param order
	 * @return
	 */
	public Integer BulkChargingInsert(List<Order> order);
	
	/**
	 * 查询退费订单
	 * 
	 * @return
	 */
	public List<Order> selectOrderRefund(Integer schoolId,Integer page,String studentName,Integer classId);
	
	/**
	 * 根据退费学生查找最后一次订单
	 * @param studentId
	 * @return
	 */
	public Order selectOrderTF(Integer studentId);
	/**
	 * 查询续费学生
	 * @param schoolId
	 * @return
	 */
	public List<Order> queryOrderByRenew( Integer schoolId, Integer classId);
}