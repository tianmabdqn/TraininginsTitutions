package cn.huizhi.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.huizhi.mapper.TeacherMapper;
import cn.huizhi.pojo.Teacher;
import cn.huizhi.service.TeacherService;

@Service
public class TeacherServiceImpl implements TeacherService{

	@Resource
	private TeacherMapper teacherMapper;//注入容器

	/**
	 * 查询所有教师
	 */
	@Override
	public List<Teacher> selectTeacher(Integer schoolId) {
		return teacherMapper.selectTeacher(schoolId);
	}

	
	/**
	 * 删除教师
	 */
	@Override
	public Integer delTeacher(Integer uId) {
		return teacherMapper.delTeacher(uId);
	}

	@Override
	public Teacher findTeacherByLogin(String loginName, String loginPassword,Integer schoolType) {
		return teacherMapper.selectTeacherByLogin(loginName, loginPassword,schoolType);
	}

	public Integer addTeacher(Teacher teacher) {
		return teacherMapper.addTeacher(teacher);
	}


	public List<Teacher> findTeachersByTeacherTypeId(Integer schoolId) {
		return teacherMapper.selecTeachersByTeacherTypeId( schoolId);
	}
	
	/**
	 * 修改教师
	 */
	@Override
	public Integer updateTeacher(Teacher teacher) {
		return teacherMapper.updateTeacher(teacher);
	}

	/**
	 * 添加教师-查询新插入数据的id
	 */
	@Override
	public Teacher selectTeachers(Teacher teacher) {
		return teacherMapper.selectTeachers(teacher);
	}

	@Override
	public List<Teacher> findTeacherListBySchoolId(Integer schoolId) {
		// TODO Auto-generated method stub
		return teacherMapper.selectTeacherListBySchoolId(schoolId);
	}


	@Override
	public Teacher findTeacherByTeacherId(Integer teacherId) {
		// TODO Auto-generated method stub
		return teacherMapper.selectTeacherByTeacherId(teacherId);
	}


	@Override
	public Teacher findTeacherByTeacherName(String teacherName) {
		// TODO Auto-generated method stub
		return teacherMapper.selecTeacherByTeacherName(teacherName);
	}


	/**
	 * 查找招生老师
	 */
	@Override
	public List<Teacher> selectTeacherZS(Integer schoolId) {
		return teacherMapper.selectTeacherZS(schoolId);
	}


	@Override
	public Integer delTeacherTable() {
		// TODO Auto-generated method stub
		return teacherMapper.delTeacherTable();
	}


	@Override
	public Integer updateTeacherQuanXian(Integer state, Integer addState, Integer teacherId) {
		// TODO Auto-generated method stub
		return teacherMapper.updateTeacherQuanXian(state, addState, teacherId);
	}
	
	
	
}
