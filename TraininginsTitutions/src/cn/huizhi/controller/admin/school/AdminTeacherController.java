package cn.huizhi.controller.admin.school;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import cn.huizhi.pojo.Teacher;
import cn.huizhi.pojo.TeacherDiction;
import cn.huizhi.pojo.TeacherHour;
import cn.huizhi.pojo.User;
import cn.huizhi.service.ChildStuReistrationService;
import cn.huizhi.service.ClassService;
import cn.huizhi.service.TeacherDictionService;
import cn.huizhi.service.TeacherHourService;
import cn.huizhi.service.TeacherService;
import cn.huizhi.pojo.ChildStuReistration;
import cn.huizhi.pojo.Class;
@Controller
public class AdminTeacherController {
	@Resource
	TeacherService teacherService;
	@Resource
	TeacherHourService teacherHourService;
	
	@Resource
	TeacherDictionService teacherDictionService;
	
	@Resource
	ClassService classService;
	
	@Resource
	ChildStuReistrationService childStuReistrationService;
	
	@RequestMapping("schoolTeacherInfo.html")
	public String schoolTeacherInfo(Integer schoolId,String schoolName,HttpSession session) {
		session.setAttribute("schoolName", schoolName);
		User user = new User();
		user.setSchoolId(String.valueOf(schoolId));
		session.setAttribute("user", user);
		List<Teacher> teacherListBYSchoolId =  teacherService.findTeacherListBySchoolId(schoolId);
		if(teacherListBYSchoolId.size()>0) {
			session.setAttribute("teacherListBYSchoolId", teacherListBYSchoolId);
		}else {
			session.setAttribute("teacherListBYSchoolId", teacherListBYSchoolId);
		}
		
		return "admin/schoolTeacherInfo";
	}
	
	/**
	 * 根据教师主键查询教师信息
	 * @param teacherId
	 * @return
	 */
	@RequestMapping("selectTeacher.html")
	@ResponseBody
	public String selectTeacher(Integer teacherId) {
		Teacher teacher = teacherService.findTeacherByTeacherId(teacherId);
		if(teacher!=null) {
			return JSON.toJSONString(teacher);
		}
 		return "";
	}
	
	/**
	 * 校验登录名
	 * @param teacherName
	 * @return
	 */
	@RequestMapping("teacherNameCheck.html")
	@ResponseBody
	public Map<String, String> teacherNameCheck(String teacherName) {
		Map<String, String> jsonMap = new HashMap<String, String>();
		if(teacherService.findTeacherByTeacherName(teacherName)!=null) {
			jsonMap.put("state","0");
		}else {
			jsonMap.put("state","1");
		}
		return jsonMap;
	}
	/**
	 * 添加教师
	 * @param teacher
	 * @param schoolId
	 * @return
	 */
	@RequestMapping("createTeacher.html")
	@ResponseBody
	public Map<String, String> createTeacher(Teacher teacher,Integer schoolId){
		Map<String, String> jsonMap = new HashMap<String, String>();
		//如果添加成功返回1不成功返回0
		if(teacherService.addTeacher(teacher)>0) {
			Teacher teachers = teacherService.selectTeachers(teacher);
			if(teacherDictionService.addTeacherDiction(schoolId, teachers.getTeacherId())>0) {
				jsonMap.put("state","1");
			}else {
				jsonMap.put("state","0");
			}
		}else {
			jsonMap.put("state","0");
		}
		return jsonMap;
	}
	/**
	 * 根据教师主键查询教书所存在的学校
	 * @param teacherId
	 * @param session
	 * @return
	 */
	@RequestMapping("teacherAuthorization.html")
	public String teacherAuthorization(Integer teacherId,HttpSession session) {
		//调用方法
		List<TeacherDiction> teacherDictionListByTeacherId = teacherDictionService.findTeacherDictionListByTeacherId(teacherId);
		session.setAttribute("teacherDictionListByTeacherId",teacherDictionListByTeacherId);
		return "admin/school/authorization/teacherAuthorization";
	}
	
	@RequestMapping("authorization.html")
	@ResponseBody
	public Map<String, String> authorization(Integer teacherId,Integer schoolId) {
 		Map<String, String> jsonMap = new HashMap<String, String>();
 		TeacherDiction teacherDiction = teacherDictionService.findTeacherDictionBySchoolIdAndTeacherId(schoolId, teacherId);
 		if(teacherDiction!=null) {
 			jsonMap.put("state","2");
 			return jsonMap;
 		}
		if(teacherDictionService.addTeacherDiction(schoolId, teacherId)>0) {
			jsonMap.put("state","1");
		}else {
			jsonMap.put("state","0");
		}
		return jsonMap;
	}
	
	/**
	 * 返回选择学校教师视图
	 * @return
	 */
	@RequestMapping("selectOrderTeacherInfo.html")
	public String selectOrderTeacherInfo() {
		return "admin/teacher/selectOrderTeacherInfo";
	}
	
	/**
	 * 查询教师课时并返回信息
	 * @param schoolId
	 * @param schoolName
	 * @param session
	 * @return
	 */
	@RequestMapping("teacherInfo.html")
	public String teacherInfo(Integer schoolId,String schoolName,HttpSession session) {
		
		List<TeacherHour> teacherHourList = teacherHourService.findTeacherHourListBySchoolId(schoolId);
		
		session.setAttribute("schoolName", schoolName);
		session.setAttribute("teacherHourList", teacherHourList);
		return "admin/teacher/teacherInfo";
	}
	/**
	 * 返回选择学校视图
	 * @return
	 */
	@RequestMapping("selectClassSchoolInfo.html")
	public String selectClassSchool() {
		return "admin/classStudent/selectClassSchoolInfo";
	}
	
	@RequestMapping("classSchoolInfo.html")
	public String classSchoolInfo(Integer schoolId,String schoolName,HttpSession session) {
		
		List<Class> classList = classService.findChildrenescClasses(String.valueOf(schoolId));
		
		session.setAttribute("classList", classList);
		
		return "admin/classStudent/classSchoolInfo";
	}
	
	@RequestMapping("studentHourInfo.html")
	public String studentHourInfo(Integer classId,Integer classLevel) {
		if(classLevel == 1)  {
			List<ChildStuReistration> cilChildStuReistrationList = childStuReistrationService.findchildStuReistrationListByClass(classId);
		}
		
		if(classLevel == 2) {
			
		}
		
		return "studentHourInfo";
	}
	
	
}