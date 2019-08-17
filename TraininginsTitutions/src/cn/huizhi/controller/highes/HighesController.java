package cn.huizhi.controller.highes;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.jms.Session;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;

import cn.huizhi.pojo.Expenditureitems;
import cn.huizhi.pojo.FeeCategory;
import cn.huizhi.pojo.PaymentMethod;
import cn.huizhi.pojo.User;
import cn.huizhi.service.ExpenditureitemsService;
import cn.huizhi.service.FeeCategoryService;
import cn.huizhi.service.PaymentMethodService;
import cn.huizhi.service.TeacherDictionService;
import cn.huizhi.service.TeacherService;
import cn.huizhi.service.TeacherTypeService;
import cn.huizhi.pojo.Teacher;
import cn.huizhi.pojo.TeacherType;

@Controller
public class HighesController {
	
	/**
	 * 注入容器
	 */
	@Resource
	private FeeCategoryService feecategoryService;
	@Resource
	private PaymentMethodService paymentMethodService;
	@Resource
	private ExpenditureitemsService expenditureitemsService;
	@Resource
	HttpSession session;
	@Resource
	private TeacherService teacherService;
	@Resource
	private TeacherTypeService teacherTypeService;
	@Resource
	private TeacherDictionService teacherDictionService;
	
	/**
	 * 查询所有账户信息
	 * @param model
	 * @return
	 */
	@RequestMapping("Accountinformation.html")
	public String Accountinformation(Model model) {
		List<PaymentMethod> list = paymentMethodService.selectPaymentMethod();
		model.addAttribute("list", list);
		return "high/Accountinformation";
	}
	
	/**
	 * 删除账户信息
	 * @param chargeTypeId
	 * @return
	 */
	@RequestMapping("delAccountinformation.html")
	@ResponseBody
	public Object DelAccountinformation(@RequestParam int paymentmethodId) {
		HashMap<String, String> map = new HashMap<String, String>();
		if(paymentMethodService.delPaymentMethod(paymentmethodId) == 1) {
			map.put("del", "1");
		}else {
			map.put("del", "0");
		}
		return JSONArray.toJSONString(map);
	}
	
	/**
	 * 添加账户信息
	 * @param chargeTypeId
	 * @return
	 */
	@RequestMapping("addAccountinformation.html")
	@ResponseBody
	public Object AddAccountinformation(@RequestParam String paymentmethodName) {
		HashMap<String, String> map = new HashMap<String, String>();
		if(paymentMethodService.addPaymentMethod(paymentmethodName) == 1) {
			map.put("add", "1");
		}else {
			map.put("add", "0");
		}
		return JSONArray.toJSONString(map);
	}
	
	/**
	 * 查询所有收入项目
	 * @param model
	 * @return
	 */
	@RequestMapping("Incomeitems.html")
	public String Incomeitems(Model model,HttpSession session) {
		List<FeeCategory> list = feecategoryService.selectFeeCategory();
		model.addAttribute("list", list);
		return "high/Incomeitems";
	}
	
	/**
	 * 删除收入项目
	 * @param chargeTypeId
	 * @return
	 */
	@RequestMapping("delIncomeitems.html")
	@ResponseBody
	public Object DelIncomeitems(@RequestParam int chargeTypeId) {
		HashMap<String, String> map = new HashMap<String, String>();
		if(feecategoryService.delFeeCategory(chargeTypeId)) {
			map.put("del", "1");
		}else {
			map.put("del", "0");
		}
		return JSONArray.toJSONString(map);
	}
	
	/**
	 * 添加收入项目
	 * @param chargeTypeId
	 * @return
	 */
	@RequestMapping("addIncomeitems.html")
	@ResponseBody
	public Object AddIncomeitems(@RequestParam String chargeTypeName,@RequestParam String category) {
		HashMap<String, String> map = new HashMap<String, String>();
		if(feecategoryService.addFeeCategory(chargeTypeName, category) == 1) {
			map.put("add", "1");
		}else {
			map.put("add", "0");
		}
		return JSONArray.toJSONString(map);
	}
	
	/**
	 * 查询所有支出项目
	 * @param model
	 * @return
	 */
	@RequestMapping("Expenditureitemses.html")
	public String Expenditureitemses(Model model) {
		User user = (User) session.getAttribute("user");
		List<Expenditureitems> list = expenditureitemsService.selectExpenditureitems(user.getSchoolId());
		model.addAttribute("list", list);
		return "high/Expenditureitemses";
	}
	
	/**
	 * 删除支出项目
	 * @param expenditureitemsId
	 * @return
	 */
	@RequestMapping("delExpenditureitemses.html")
	@ResponseBody
	public Object DelExpenditureitemses(@RequestParam int expenditureitemsId) {
		HashMap<String, String> map = new HashMap<String, String>();
		if(expenditureitemsService.delExpenditureitems(expenditureitemsId) == 1) {
			map.put("del", "1");
		}else {
			map.put("del", "0");
		}
		return JSONArray.toJSONString(map);
	}
	
	/**
	 * 添加支出项目
	 * @param expenditureitemsName
	 * @param category
	 * @return
	 */
	@RequestMapping("addExpenditureitemses.html")
	@ResponseBody
	public Object AddExpenditureitemses(@RequestParam String expenditureitemsName,@RequestParam String category) {
		HashMap<String, String> map = new HashMap<String, String>();
		User user = (User) session.getAttribute("user");
		if(expenditureitemsService.addExpenditureitems(expenditureitemsName, category,user.getSchoolId()) == 1) {
			map.put("add", "1");
		}else {
			map.put("add", "0");
		}
		return JSONArray.toJSONString(map);
	}
	
	/**
	 * 查询所有的教师
	 * @param model
	 * @return
	 */
	@RequestMapping("Teacher.html")
	public String Teacher(Model model) {
		User u = (User) session.getAttribute("user");
		List<Teacher> teacher = teacherService.selectTeacher(Integer.parseInt(u.getSchoolId()));
		List<TeacherType> teacherType = teacherTypeService.selectTeacherType();
		model.addAttribute("teacher", teacher);
		model.addAttribute("teacherType", teacherType);
		return "high/Teacher";
	}
	
	/**
	 * 删除教师
	 * @return
	 */
	@RequestMapping("delTeacher.html")
	@ResponseBody
	public Object delTeacher(@RequestParam Integer teacherId) {
		User user = (User) session.getAttribute("user");
		HashMap<String, String> map = new HashMap<String, String>();
		if(teacherService.delTeacher(teacherId) == 1) {
			if(teacherDictionService.delTeacherDiction(Integer.parseInt(user.getSchoolId()), teacherId) == 1) {
				map.put("del", "1");
			}else {
				map.put("del", "0");
			}
		}else {
			map.put("del", "0");
		}
		return JSONArray.toJSONString(map);
	}
	
	/**
	 * 修改教师
	 * @return
	 */
	@RequestMapping("updateTeacher.html")
	@ResponseBody
	public Object updateTeacher(@RequestParam String teacherName,@RequestParam String telephone,@RequestParam String remarks,@RequestParam String loginPassword,@RequestParam Integer teacherTypeId,@RequestParam Integer teacherId) {
		Teacher teacher = new Teacher();
		teacher.setLoginPassword(loginPassword);
		teacher.setTeacherName(teacherName);
		teacher.setTeacherTypeId(teacherTypeId);
		teacher.setRemarks(remarks);
		teacher.setTelephone(telephone);
		teacher.setFeeCategory(2);
		teacher.setTeacherId(teacherId);
		HashMap<String, String> map = new HashMap<String, String>();
		if(teacherService.updateTeacher(teacher) == 1) {
			map.put("update", "1");
		}else {
			map.put("update", "0");
		}
		return JSONArray.toJSONString(map);
	}
	
	/**
	 * 添加教师
	 * @return
	 */
	@RequestMapping("addTeacher.html")
	@ResponseBody
	public Object addTeacher(@RequestParam String teacherName,@RequestParam String telephone,@RequestParam String remarks,@RequestParam Integer teacherTypeId,@RequestParam String loginPassword) {
		Teacher teacher = new Teacher();
		User user = (User) session.getAttribute("user");
		teacher.setFeeCategory(2);
		teacher.setTeacherName(teacherName);
		teacher.setLoginPassword(loginPassword);
		teacher.setRemarks(remarks);
		teacher.setTelephone(telephone);
		teacher.setTeacherTypeId(teacherTypeId);
		HashMap<String, String> map = new HashMap<String, String>();
		if(teacherService.addTeacher(teacher) == 1) {
			Teacher teachers = teacherService.selectTeachers(teacher);
			if(teacherDictionService.addTeacherDiction(Integer.parseInt(user.getSchoolId()), teachers.getTeacherId()) == 1) {
				map.put("add", "1");
			}else {
				map.put("add", "0");
			}
		}else {
			map.put("add", "0");
		}
		return JSONArray.toJSONString(map);
	}
}
