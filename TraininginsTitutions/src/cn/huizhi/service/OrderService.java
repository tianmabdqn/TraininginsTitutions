

package cn.huizhi.service;
import java.util.List;


import cn.huizhi.pojo.Order;

public interface OrderService {

	/**
	 * 查询课时订单
	 * @return
	 */
	public List<Order> selectOrderHour(Integer schoolId);
	
	/**
	 * 查询时间段订单
	 * @return
	 */
	public List<Order> selectOrderPeriod(Integer schoolId);
	
	/**
	 * 查询其他订单
	 * @return
	 */
	public List<Order> selectOrderOther(Integer schoolId);
	
	/**
	 * 查询费用支出订单
	 * @param schoolId
	 * @return
	 */
	public List<Order> selectOrderExpenditure(Integer schoolId);
	
	/**
	 * 修改订单
	 * @param order
	 * @return
	 */
	public Integer updateOrderAll(Order order);
	
	/**
	 * 添加订单
	 * @param order
	 * @return
	 */
	public Integer addOrder(Order order);
	
	/**
	 * 删除订单
	 * @param orderId
	 * @return
	 */
	public Integer delOrder(Integer orderId);
	/**
	 * 根据学校主键查询你订单信息
	 * @param schoolId
	 * @return
	 */
	public List<Order> findOrderListBySchool(Order order);
	
	/**
	 * 根据条件查询支出项目
	 * @param order
	 * @return
	 */
	public List<Order> findExpenOrderList(Order order);
	
	/**
	 * 查询学生 赠品 税分
	 * @param student
	 * @return
	 */
	public List<Order> selectUsedIntegral(String student);
	
	/**
	 * 查询少儿学生收费情况
	 * @param classId
	 * @return
	 */
	public List<Order> selectChildrenFeeSituation(Integer classId,Integer studentId);
	/**
	 * 查询高中学生收费情况
	 * @param classId
	 * @return
	 */
	public List<Order> selectHighsFeeSituation(Integer classId);
	
	/**
	 * 查询学生收费
	 * @param studentId
	 * @return
	 */
	public List<Order> selectOrderListByStudentId(Integer studentId);

}