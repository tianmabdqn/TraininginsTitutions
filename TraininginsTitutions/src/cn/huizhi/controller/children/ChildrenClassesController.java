package cn.huizhi.controller.children;

import java.awt.Image;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.aspectj.weaver.NewConstructorTypeMunger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;

import cn.huizhi.pojo.ArtClassStudnet;
import cn.huizhi.pojo.ChildrenesClassStudnet;
import cn.huizhi.pojo.Class;
import cn.huizhi.pojo.ClassType;
import cn.huizhi.pojo.DepartmentOfPediatrics;
import cn.huizhi.pojo.HighesClassStudnet;
import cn.huizhi.pojo.Order;
import cn.huizhi.pojo.Student;
import cn.huizhi.pojo.Teacher;
import cn.huizhi.pojo.TeacherDiction;
import cn.huizhi.pojo.TeacherHour;
import cn.huizhi.pojo.User;
import cn.huizhi.pojo.UserDiction;
import cn.huizhi.service.ArtClassStudnetService;
import cn.huizhi.service.ChildrenesClassStudnetService;
import cn.huizhi.service.ClassService;
import cn.huizhi.service.ClassTypeService;
import cn.huizhi.service.DepartmentOfPediatricsService;
import cn.huizhi.service.HighesClassStudnetService;
import cn.huizhi.service.OrderService;
import cn.huizhi.service.StudentService;
import cn.huizhi.service.TeacherHourService;
import cn.huizhi.service.TeacherService;
import cn.huizhi.service.UserService;

@Controller
public class ChildrenClassesController {
	/**
	 * 少儿班级业务逻辑
	 */
	@Resource
	ClassService classService;
	/**
	 * 少儿班级科别
	 */
	@Resource
	DepartmentOfPediatricsService departmentOfPediatricsService;
	/**
	 * 用户
	 */
	@Resource
	UserService userService;
	/**
	 * 教师
	 */
	@Resource
	TeacherService teacherService;

	@Resource
	ChildrenesClassStudnetService childrenesClassStudnetService;

	@Resource
	HighesClassStudnetService highesClassStudnetService;

	@Resource
	StudentService studentService;

	@Resource
	OrderService orderService;

	@Resource
	TeacherHourService teacherHourService;

	@Resource
	ArtClassStudnetService artClassStudnetService;
	
	@Resource
	ClassTypeService classTypeService;

	@RequestMapping("childrenSchoolLogin.html")
	public String childrenSchoolLogin(HttpSession session) {
		session.setAttribute("schoolType", 1);
		Integer loginType = (Integer) session.getAttribute("loginType");
		if (loginType == 1) {

			List<UserDiction> list = (List<UserDiction>) session.getAttribute("schoolListByUId");
			for (int i = 0; i < list.size(); i++) {
				if (1 == list.get(i).getSchool().getSchoolType()) {
					return "redirect:/index.html";
				}
			}
		}
		if (loginType == 2) {

			List<TeacherDiction> list = (List<TeacherDiction>) session.getAttribute("schoolListByUId");
			for (int i = 0; i < list.size(); i++) {
				if (1 == list.get(i).getSchool().getSchoolType()) {
					return "redirect:/index.html";
				}
			}
		}
		return "redirect:/selectionModule.html";
	}

	/**
	 * 返回到少儿首页
	 * 
	 * @return
	 */
	@RequestMapping("classIndex.html")
	public String childrenIndex(HttpSession session) {

		Integer schoolId = (Integer) session.getAttribute("schoolId");
		List<Class> childrenClassList = classService.findChildrenescClasses(String.valueOf(schoolId));
		if (childrenClassList != null) {
			session.setAttribute("childrenClassList", childrenClassList);
		}
		return "children/childrenIndex";
	}

	/**
	 * 返回创建少儿学生页面
	 * 
	 * @return
	 */
	@RequestMapping("regitStudent.html")
	public String createChildrenStudent(Integer classId) {
		return "children/create/createChildrenStudent";
	}

	/**
	 * 跳转到学生信息管理页面
	 * 
	 * @return
	 */
	@RequestMapping("studentInfo.html")
	public String studentInfo() {
		return "children/studentInfo";
	}

	/**
	 * 返回注册班级页面
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("regitClass.html")
	public String createChildrenClass(HttpSession session) {
		Integer schoolId = (Integer) session.getAttribute("schoolId");
		List<DepartmentOfPediatrics> dpList = departmentOfPediatricsService.findDepartmentOfPediatrics(schoolId);
		List<ClassType> classTypes = classTypeService.selectClassTypes(schoolId);
		session.setAttribute("dpList", dpList);
		session.setAttribute("classTypes", classTypes);
		return "children/create/createChildrenClass";
	}

	/**
	 * 根据教师科别，学校主键查询所有老师并异步返回数据
	 * 
	 * @param dpId
	 * @param session
	 * @return
	 */
	@RequestMapping("dpChange.html")
	@ResponseBody
	public String dpChange(Integer dpId, HttpSession session) {
		Integer schoolId = (Integer) session.getAttribute("schoolId");
		List<Teacher> teacherUserList = teacherService.findTeachersByTeacherTypeId(schoolId);
		
		if (teacherUserList.size() > 0) {
			return JSON.toJSONString(teacherUserList);
		}
		return "";
	}

	/**
	 * 创建学生班级
	 * 
	 * @param childrenescClass
	 * @return
	 */
	@RequestMapping("createClass.html")
	@ResponseBody
	public Map<String, String> createChildrenClass(Class classes, HttpSession session) {
		Map<String, String> jsonMap = new HashMap<String, String>();
		Integer schoolId = (Integer) session.getAttribute("schoolId");
		classes.setSchoolId(schoolId);
		Integer schoolType = (Integer) session.getAttribute("schoolType");
		if (schoolType != 1) {
			classes.setClassType(1);
		}
		if (classService.addChildrenescClass(classes) > 0) {
			jsonMap.put("state", "1");
		} else {
			jsonMap.put("state", "0");
		}
		return jsonMap;
	}

	/**
	 * 跳转班级信息管理
	 * 
	 * @param classId
	 * @param session
	 * @return
	 */
	@RequestMapping("seeStudentInfo.html")
	public String seeStudentInfo(Integer classId, HttpSession session) {

		Integer schoolType = (Integer) session.getAttribute("schoolType");
		session.setAttribute("classId", classId);

		List<Class> classList = classService
				.findChildrenescClasses(String.valueOf((Integer) session.getAttribute("schoolId")));
		List<TeacherHour> teacherHourList = teacherHourService.selectCurriculumInfo(classId, null, null);
		session.setAttribute("teacherHourList", teacherHourList);
		if (schoolType == 1) {
			List<ChildrenesClassStudnet> childrenesClassStudnets = childrenesClassStudnetService
					.findChildrenesClassStudnetByClassId(classId);
			session.setAttribute("childrenesClassStudnets", childrenesClassStudnets);
			return "root/studentInfo/children/seeStudentInfo";
		}
		if (schoolType == 2) {
			List<HighesClassStudnet> highesClassStudnets = highesClassStudnetService
					.findHighesClassStudnetListByClassId(classId);
			session.setAttribute("classList", classList);
			session.setAttribute("highesClassStudnets", highesClassStudnets);
			return "root/studentInfo/high/seeStudentInfo";
		}
		if (schoolType == 3) {
			List<ArtClassStudnet> artClassStudnets = artClassStudnetService.findArtClassStudnetListByClassId(classId);
			session.setAttribute("artClassStudnets", artClassStudnets);
			return "root/studentInfo/art/seeStudentInfo";
		}

		return "seeStudentInfo";
	}
	@RequestMapping("queryStudentByTime.html")
	public String queryStudent(Integer classId,String startTime,String endTime, HttpSession session) {

		Integer schoolType = (Integer) session.getAttribute("schoolType");
		session.setAttribute("classId", classId);

		List<Class> classList = classService
				.findChildrenescClasses(String.valueOf((Integer) session.getAttribute("schoolId")));
		List<TeacherHour> teacherHourList = teacherHourService.selectCurriculumInfo(classId, null, null);
		session.setAttribute("teacherHourList", teacherHourList);
		if (schoolType == 1) {
			List<ChildrenesClassStudnet> childrenesClassStudnets = childrenesClassStudnetService
					.findChildrenesClassStudnetByClassIdAndTime(String.valueOf(classId),startTime,endTime);
			session.setAttribute("childrenesClassStudnets", childrenesClassStudnets);
			return "root/studentInfo/children/seeStudentInfo";
		}
		if (schoolType == 2) {
			List<HighesClassStudnet> highesClassStudnets = highesClassStudnetService
					.findHighesClassStudnetListByClassId(classId);
			session.setAttribute("classList", classList);
			session.setAttribute("highesClassStudnets", highesClassStudnets);
			return "root/studentInfo/high/seeStudentInfo";
		}
		if (schoolType == 3) {
			List<ArtClassStudnet> artClassStudnets = artClassStudnetService.findArtClassStudnetListByClassId(classId);
			session.setAttribute("artClassStudnets", artClassStudnets);
			return "root/studentInfo/art/seeStudentInfo";
		}

		return "seeStudentInfo";
	}
	/**
	 * 查询学生信息
	 * 
	 * @param studentId
	 * @return
	 */
	@RequestMapping("updateStudnet.html")
	@ResponseBody
	public String updateStudnet(Integer studentId) {

		Student student = studentService.findStudentById(studentId);

		if (student != null) {
			return JSON.toJSONStringWithDateFormat(student, "yyyy-MM-dd hh:mm:ss",
					SerializerFeature.WriteDateUseDateFormat);
		}

		return "";
	}
	
	@RequestMapping("delClass.html")
	@ResponseBody
	public Map<String, String> delClass(String classId) {
		Map jsonMap = new HashMap<String, String>();
		if(classService.delClass(classId)>0) {
			jsonMap.put("state","1");
		}else {
			jsonMap.put("state","0");
		}
		return jsonMap;
	}
	
	/**
	 *根据主键查询班级信息 
	 * @param classId
	 * @return
	 */
	@RequestMapping("queryClassByClassId.html")
	@ResponseBody
	public Map<String, Object> queryClassByClassId(Integer classId){
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		Class class1 = classService.findClassByClassId(classId);
		jsonMap.put("class",class1);
		return jsonMap;
	}
	
	/**
	 * 修改学生信息
	 * 
	 * @param student
	 * @return
	 */
	@RequestMapping("updateStudentInfo.html")
	@ResponseBody
	public Map<String, String> updateStudentInfo(Student student) {
		Map<String, String> jsonMap = new HashMap<String, String>();
		if (studentService.updateStudent(student) > 0) {
			jsonMap.put("update", "1");
		} else {
			jsonMap.put("update", "0");

		}

		return jsonMap;
	}

	/**
	 * 学生转班
	 * 
	 * @param studentId
	 * @param classId
	 * @param session
	 * @return
	 */
	@RequestMapping("studentShiftWork.html")
	public String studentShiftWork(Integer studentId, Integer classId, HttpSession session) {
		Integer schoolType = (Integer) session.getAttribute("schoolType");
		Integer schoolId = (Integer) session.getAttribute("schoolId");
		List<Class> classListAll = classService.findChildrenescClasses(String.valueOf(schoolId));
		session.setAttribute("classListAll", classListAll);
		if (schoolType == 1) {
			// 查询
			List<ChildrenesClassStudnet> childrenesClassStudnets = childrenesClassStudnetService
					.findChildrenesClassStudnetByClassId(classId);
			List<Order> studentOrder = orderService.selectOrderListByStudentId(studentId);

			Order student = studentOrder.get(0);
			if (student.getLastdate() != null) {
				Integer time = Integer.valueOf(
						(int) (new Date().getTime() - student.getLastdate().getTime()) / (1000 * 60 * 60 * 24));

				session.setAttribute("time", time);
			}
			session.setAttribute("studentOrder", student);
			for (ChildrenesClassStudnet childrenesClassStudnet : childrenesClassStudnets) {
				if (childrenesClassStudnet.getStudentId().equals(studentId)) {
					session.setAttribute("childrenesClassStudnet", childrenesClassStudnet);
					break;
				}
			}
			return "root/studentInfo/children/studentShiftWork";
		}
		if (schoolType == 2) {
			// 查询
			List<HighesClassStudnet> highesClassStudnets = highesClassStudnetService
					.findHighesClassStudnetListByClassId(classId);
			for (HighesClassStudnet highesClassStudnet : highesClassStudnets) {
				if (highesClassStudnet.getStudentId().equals(studentId)) {
					session.setAttribute("childrenesClassStudnet", highesClassStudnet);
					break;
				}
			}
			return "root/studentInfo/high/studentShiftWork";
		}
		if (schoolType == 3) {
			// 查询
			List<ArtClassStudnet> artClassStudnets = artClassStudnetService.findArtClassStudnetListByClassId(classId);

			for (int i = 0; i < artClassStudnets.size(); i++) {
				if (artClassStudnets.get(i).getStudentId().equals(studentId)) {
					session.setAttribute("childrenesClassStudnet", artClassStudnets.get(i));
					break;
				}
			}
			return "root/studentInfo/art/studentShiftWork";
		}
		return "root/studentInfo/children/studentShiftWork";

	}

	/*
	 * @RequestMapping("classIdChange.html")
	 * 
	 * @ResponseBody public Map<String, Object> updateStudentShiftWork(Integer
	 * classId,Integer studentId,Integer classesId,Integer classType,Integer
	 * classesType){ Map<String, Object> jsonMap = new HashMap<String, Object>();
	 * Student student = studentService.findStudentById(studentId);
	 * 
	 * 
	 * DepartmentOfPediatrics departmentOfPediatrics =
	 * departmentOfPediatricsService.findDepartmentOfByClassId(classId);
	 * 
	 * DepartmentOfPediatrics depa =
	 * departmentOfPediatricsService.findDepartmentOfByClassId(classesId);
	 * 
	 * Double vipMoney = null; if(student.getStudentHour() == null) {
	 * student.setStudentHour(0.0); } //获取学生总课时
	 * jsonMap.put("studentHour",student.getStudentHour());
	 * 
	 * if(classesType ==1) {
	 * 
	 * } if(classesType ==2) {
	 * 
	 * }
	 * 
	 * return jsonMap;
	 * 
	 * }
	 */

	/**
	 * 学生转班
	 * 
	 * @param classId
	 * @param studentId
	 * @param remarks
	 * @param money
	 * @param session
	 * @return
	 */
	@RequestMapping("updateStudentShiftWork.html")
	@ResponseBody
	public Map<String, String> updateStudentShiftWork(Integer classId, Integer studentId, String remarks, Double money,
			HttpSession session) {
		Map<String, String> jsonMap = new HashMap<String, String>();
		Integer schoolId = (Integer) session.getAttribute("schoolId");
		Order order = new Order();
		order.setStuId(studentId);
		order.setIdentification(0);
		order.setDpMoney(money);
		order.setGiftNumber(0);
		order.setGiftId(0);
		order.setClassId(classId);
		order.setRemarks(remarks);
		order.setIntegral(0.0);
		order.setPaymentmethodId(0);
		order.setSchoolId(schoolId);
		order.setActivityId(0);
		SimpleDateFormat startTime1 = new SimpleDateFormat("yyyy-MM-dd");

		String date = startTime1.format(new Date());
		String str = date.replace("-", "");
		order.setOrderNumber("SJ" + str + studentId + new Random().nextInt(100));
		try {
			Date startTime = new SimpleDateFormat("yyyy-MM-dd").parse(date);
			order.setStartTime(startTime);
		} catch (ParseException e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		// 获取学校类别
		Integer schoolType = (Integer) session.getAttribute("schoolType");

		if (orderService.addOrder(order) > 0) {
			// 如果学校是少儿修改少儿班级学生
			if (schoolType == 1) {
				ChildrenesClassStudnet cStudnet = new ChildrenesClassStudnet();
				cStudnet.setStudentId(studentId);
				cStudnet.setClassId(classId);
				if (childrenesClassStudnetService.updateChildrenesClassStudnet(cStudnet) > 0) {
					jsonMap.put("state", "1");
				}
			}

			// 如果是艺考，修改艺考
			if (schoolType == 3) {
				ArtClassStudnet cStudnet = new ArtClassStudnet();
				cStudnet.setStudentId(studentId);
				cStudnet.setClassId(classId);
				if (artClassStudnetService.updateArtClassStudentByClass(cStudnet) > 0) {
					jsonMap.put("state", "1");
				}
			}
		} else {
			jsonMap.put("state", "0");
		}

		return jsonMap;
	}

	/**
	 * 高中学生转班
	 * 
	 * @param map
	 * @return
	 */
	@RequestMapping("updateHighStudentShiftWork.html")
	@ResponseBody
	public Map<String, String> updateHighStudentShiftWork(String map) {
		Map<String, String> jsonMap = new HashMap<String, String>();
		Map<String, Object> map2 = (Map<String, Object>) JSON.parseObject(map);

		List<HighesClassStudnet> highesClassStudnets = new ArrayList<HighesClassStudnet>();
		HighesClassStudnet high = null;
		List<String> studentId = null ;
		String classId = null;
		for (String key : map2.keySet()) {
			if (("classId").equals(key)) {
				classId = (String) map2.get(key);
			}
			if (("studentId").equals(key)) {
				studentId = (List<String>) map2.get(key);
			}
		}

		for (int i = 0; i < studentId.size(); i++) {
			high = new HighesClassStudnet();
			high.setStudentId(Integer.valueOf(studentId.get(i)));
			high.setClassId(Integer.valueOf(classId));
			highesClassStudnets.add(high);
		}

		if (highesClassStudnetService.updateHighStudentClass(highesClassStudnets) > 0) {
			jsonMap.put("state", "1");
		} else {
			jsonMap.put("state", "0");

		}

		return jsonMap;
	}

}
