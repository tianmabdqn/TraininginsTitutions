package cn.huizhi.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.huizhi.pojo.User;

/**
 * 登录Mapper
 * 
 * @author wye
 *
 */
public interface UserMapper {

	/**
	 * 登录方法根据登录名密码学校进行查询
	 * 
	 * @param loginName
	 * @param loginPassword
	 * @return
	 */
	public User selectUserByLogin(@Param("loginName") String loginName, @Param("loginPassword") String loginPassword);

	/**
	 * 添加用户方法
	 * 
	 * @param user
	 * @return
	 */
	public Integer insertUser(User user);

	/**
	 * 根据登录名校验账户是否存在
	 * 
	 * @param loginName
	 * @return
	 */
	public User selectUserByUserName(@Param("loginName") String loginName);

	/**
	 * 根据班级科别查询所有教师
	 */
	public List<User> selectUserByDpId(@Param("dpId") Integer dpId, @Param("schoolId") Integer schoolId);

	/**
	 * 查询全部管理员
	 * 
	 * @return
	 */
	public List<User> selectListAll(@Param("uId") String uId);

	/**
	 * 修改操作员信息
	 * 
	 * @param user
	 * @return
	 */
	public Integer updateUser(User user);

	/**
	 * 删除用户信息
	 * 
	 * @param uId
	 * @return
	 */
	public Integer deleteUser(@Param("uId") Integer uId);
}
