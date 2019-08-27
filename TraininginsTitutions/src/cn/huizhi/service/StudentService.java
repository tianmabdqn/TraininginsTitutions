package cn.huizhi.service;

import java.util.List;

import cn.huizhi.pojo.Student;

public interface StudentService {

	/**
	 * 查询所有高中学生
	 * @return
	 */
	public List<Student> selectHigh(Integer schoolId);
	
	/**
	 * 查询所有少儿学生
	 * @param feeCategory
	 * @return
	 */
	public List<Student> selectChildren(Integer schoolId);
	
	/**
	 * 查询所有艺考学生
	 * @param feeCategory
	 * @return
	 */
	public List<Student> selectYiKao(Integer schoolId);
	
	/**
	 * 添加学生班级查询学生主键
	 * @param stu
	 * @return
	 */
	public Student findChildrenInfoByStudnet(Student stu);
	/**
	 * 添加学生信息
	 * @param stu
	 * @return
	 */
	public int addStudnetInfo(Student stu);
}