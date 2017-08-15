package com.zt.police.app;

import java.util.List;
import java.util.Map;

import com.common.BaseDAO;
import com.common.LoginUser;

public class IndexDao extends BaseDAO {
	
	
	public List<Map<String, Object>> policeList(Long id) {
		String sql="select * from police where dep_id="+id+" order by sort_id";
		return j.queryForList(sql);
	}
	
	public List<Map<String, Object>> policeList2(Long unitid) {
		String sql="select a.*,b.unit_id from police a left join department b on a.dep_id = b.id where b.unit_id="+unitid+" order by a.name";
		return j.queryForList(sql);
	}
	
	public List<Map<String, Object>> getdepartment(Long unitId) {
		String sql="select * from department where unit_id="+unitId+" order by sort_id";
		return j.queryForList(sql);
	}
	
	
	

	public List<Map<String, Object>> getunreadList(Long id) {
    	String sql="select cnt,id from police a left join "+
		"(select count(*) cnt,police_id from note "+
		"where content2 is not null and is_read=0 "+
		"group by police_id "+
		") b on a.id=b.police_id where a.dep_id="+id;
		return j.queryForList(sql);
	}
	
	public Long getcodeCnt(String code) {
    	String sql="select Count(*) from code a where a.code='"+code+"'";
		return j.queryForLong(sql);
	}
	
	/**
	 * 获取登录用户
	 * 
	 * @return
	 */
	public LoginUser selectPolice(String phone, String password) {
		Object[] params = { phone, password };
		return j.queryForBean(
						LoginUser.class,
						"SELECT * from police WHERE phone=? and password=? ",
						params);
	}
	/*修改警员登录密码
	 * */
	public boolean ChaPwd(String password,Long Id)

	{
		String sql = " update police set password=? where Id=?";
		Object[] params = {password,Id };		
		return j.execute(sql, params);
		
	}
	
	public List<Map<String, Object>> getNoticeList() {
    	String sql="select * from notice order by date desc";
		return j.queryForList(sql);
	}
	
	public Map<String,Object> getNoiceDetail(Long id){
    	String sql="select * from notice where id="+id;
		return j.queryForMap(sql);
	}
	
}
