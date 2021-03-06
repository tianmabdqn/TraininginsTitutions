package cn.huizhi.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.metadata.Table;
import org.springframework.web.bind.annotation.RequestParam;

import cn.huizhi.pojo.Order;
import cn.huizhi.pojo.Student;

public interface StudentMapper {

	/**
	 * 查询所有高中学生
	 * 
	 * @return
	 */
	public Integer selectHigh(@Param("schoolId")Integer schoolId, @Param("map") Map<Object, Object> map);

	/**
	 * 查询所有少儿学生
	 * 
	 * @param feeCategory
	 * @return
	 */
	public Integer selectChildren(@Param("schoolId")Integer schoolId, @Param("map") Map<Object, Object> map);

	/**
	 * 查询所有艺考学生
	 * 
	 * @param feeCategory
	 * @return
	 */
	public Integer selectYiKao(@Param("schoolId")Integer schoolId, @Param("map") Map<Object, Object> map);

	/**
	 * 添加学生班级查询学生主键
	 * 
	 * @param stu
	 * @return
	 */
	public Student selectChildrenInfoByStudnet(Student stu);

	/**
	 * 添加学生信息
	 * 
	 * @param stu
	 * @return
	 */
	public int insertStudnetInfo(Student stu);

	/**
	 * 更新总课时
	 * 
	 * @param studentHour
	 * @return
	 */
	public Integer updateStudentOrderHour(Integer studentHour, Integer studentId, Double integral);

	/**
	 * 根据班级查找学生
	 * 
	 * @param classId
	 * @return
	 */
	public List<Student> selectStudentClass(@Param("table") String table, @Param("classId") Integer classId, @Param("state") Integer state);

	/**
	 * 查询本校全部学生
	 * 
	 * @param schoolId
	 * @return
	 */
	public List<Student> selectStudentUsedIntegral(@Param("table") String table, @Param("schoolId") Integer schoolId);

	/**
	 * 查询插入学生的id
	 * 
	 * @param studentName
	 * @param parentName
	 * @param studentSex
	 * @return
	 */
	public Student selectStudentId(String studentName, String parentName, Integer studentSex);

	/**
	 * 根据主键查询学生
	 * 
	 * @param studentId
	 * @return
	 */
	public Student findStudentById(@Param("studentId") Integer studentId);

	/**
	 * 更改学生信息
	 * 
	 * @param studentId
	 * @return
	 */
	public Integer updateStudent(Student student);

	/**
	 * 批量修改学生课时
	 * 
	 * @param list
	 * @return
	 */
	public Integer updateStuHour(List<Student> list);

	/**
	 * 清空表数据
	 * 
	 * @return
	 */
	public Integer delStudentTable();

	/**
	 * 艺考收费情况
	 * 
	 * @param map
	 * @return
	 */
	public List<Student> findArtStudentResverSchoolInfo(@Param("map") Map<String, Object> map);

	/**
	 * 高中收费情况
	 * 
	 * @param map
	 * @return
	 */
	public List<Student> findHighStudentResverSchoolInfo(@Param("map") Map<String, Object> map);

	/**
	 * 查看本校所有学生
	 * 
	 * @return
	 */
	public List<Student> selectAllStudent(Integer schoolId);

	/**
	 * 根据班级、名字查找学生
	 * 
	 * @param schoolId
	 * @param classId
	 * @param studentName
	 * @return
	 */
	public List<Student> selectByClassIdStudent(@RequestParam("schoolId") Integer schoolId,
			@RequestParam("classId") Integer classId, @RequestParam("studentName") String studentName);

	/**
	 * 批量更新学生时间段
	 * 
	 * @param student
	 * @return
	 */
	public Integer StudentInsert(@Param("student") List<Student> student);
	
}
