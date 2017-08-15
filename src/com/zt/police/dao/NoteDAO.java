package com.zt.police.dao;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.common.BaseDAO;
import com.common.Page;
import com.zt.police.bean.NoteBean;
                        
/**                     
 *                      
 * 信息 <br>          
 *                      
 * @author   <br>   
 * @taskId   <br>   
 */                     
public class NoteDAO extends BaseDAO { 
    /**                 
     * 分页查询         
     * @param page      
     * @param           
     * @return          
     */                 
    public List<Map<String,Object>> getPageList(Page page, NoteBean noteBean) {   
    	String sql ="select a.* from note a "; 
    	List<Object> objectList = new ArrayList<Object>();
    	String sqlWhere = " where 1=1 ";  
    	if(noteBean!=null) { 
    		if(noteBean.getId() != null) { 
    			objectList.add(noteBean.getId());
    			sqlWhere += " AND a.id = ? ";
    		} 
    		if(noteBean.getPoliceId() != null) { 
    			objectList.add(noteBean.getPoliceId());
    			sqlWhere += " AND a.police_id = ? ";
    		} 
    		if(noteBean.getContent() != null && noteBean.getContent().trim().length()>0) { 
    			objectList.add(noteBean.getContent());
    			sqlWhere += " AND a.content = ? ";
    		} 
    		if(noteBean.getName() != null && noteBean.getName().trim().length()>0) { 
    			objectList.add(noteBean.getName());
    			sqlWhere += " AND a.name = ? ";
    		} 
    		if(noteBean.getPhone() != null && noteBean.getPhone().trim().length()>0) { 
    			objectList.add(noteBean.getPhone());
    			sqlWhere += " AND a.phone = ? ";
    		} 
    	}                 
    	sql = sql + sqlWhere; 
    	Object[] pram = objectList.toArray(); 
    	if(page.getSortname()!=null && page.getSortorder()!=null) {   
    		sql += " order by "+page.getSortname()+" " +page.getSortorder(); 
    	}                 
    	page.setTotalRows(j.queryForInteger("select count(*) from note a "+sqlWhere, pram));
    	List<Map<String,Object>> list=j.queryForPageList(sql, page.getPageNo(),page.getPageSize(),pram);  
    	return list;      
    }

	public Map<String,Object> getUnRead(Long id) {
		Map<String,Object> map=new HashMap<String,Object>();
		String sql="select id,content,content2,count(*) count from note where is_read=0 and content2 is not null and police_id="+id+" order by id desc";
		List<Map<String,Object>> list=j.queryForList(sql);
		String content="";
		String content2="";
		if(list!=null&&list.size()>0&&list.get(0).get("id").toString().trim().length()>0){
			content=list.get(0).get("content").toString();
			content2=list.get(0).get("content2").toString();
			String noteId=list.get(0).get("id").toString();
			map.put("content", content);
			map.put("content2", content2);
			map.put("size", list.get(0).get("count")!=null?Long.parseLong(list.get(0).get("count").toString()):0l);
			String _sql="update note set is_read=1 where id="+noteId;
			j.execute(_sql);
		}else{
			map.put("content", "");
			map.put("size", 0l);
		}
		return map;
	}

	public void getContent2(Long noteId) {
		String content2="我已收到您的信息，现在正忙，我会在8个小时内联系您！";
		String sql="update note set content2='"+content2+"' where id="+noteId+" and content2 is null";
		j.execute(sql);
	}     
	/*
	 * app列表
	 * */
    public List<Map<String,Object>> getPageApp(Page page, String Policeid) {   
    	String sql ="select a.* from note a "; 
    	List<Object> objectList = new ArrayList<Object>();
    	String sqlWhere = " where 1=1 ";  
    
    
    			sqlWhere += " AND a.police_id = "+Policeid;
     
    	sql = sql + sqlWhere; 
    	Object[] pram = objectList.toArray(); 
    	if(page.getSortname()!=null && page.getSortorder()!=null) {   
    		sql += " order by submit_time " +page.getSortorder(); 
    	}     
    	page.setTotalRows(j.queryForInteger("select count(*) from note a "+sqlWhere, pram));
    	List<Map<String,Object>> list=j.queryForPageList(sql, page.getPageNo(),page.getPageSize(),pram);  
    	return list;      
    }
    
    
    /*
     * 登录
     * */
	public Map<String, Object> login(String username, String password) {
		Map<String,Object> map=new HashMap<String,Object>();
		String sql="select a.*,b.name as dep_name from police a left join  department b on a.dep_id=b.id" +
				
				" where a.phone=? and a.password=?";
		Object[] param={username,password};
		Map<String,Object> user=j.queryForMap(sql,param);
		if(user!=null){
			map.put("errcode", "106");
			map.put("errmsg", "登录成功");
			map.put("user", user);
		}else{
			map.put("errcode", "104");
			map.put("errmsg", "用户名或密码不正确");
		}
		return map;
	}
    
    /*app详情
     * 
     * */
	public List<Map<String, Object>> notepl(String Id) {
		String sql="select * from note where id =" +Id;
				
		
		return j.queryForList(sql);
	}
    
	/*
	 * 已读
	 * */
	public void read(String NoteId){
		String sql="update note set is_read=1 where id="+NoteId;
		j.execute(sql);
		
	}
	
    /*
     * 回复列表
     * */
    public List<Map<String,Object>> noteRp(Page page, String NoteId) {   
    	String sql ="select a.* from reply a "; 
    	List<Object> objectList = new ArrayList<Object>();
    	String sqlWhere = " where 1=1 ";  
    
    
    			sqlWhere += " AND a.note_id = "+NoteId;
     
    	sql = sql + sqlWhere; 
    	Object[] pram = objectList.toArray(); 
    	if(page.getSortname()!=null && page.getSortorder()!=null) {   
    		sql += " order by a.log_time "; 
    	}     
    	page.setTotalRows(j.queryForInteger("select count(*) from reply a  "+sqlWhere, pram));
    	List<Map<String,Object>> list=j.queryForPageList(sql, page.getPageNo(),page.getPageSize(),pram);  
    	return list;      
    }
    /*
     * 回复
     * */
    public boolean replay(String Noteid,String Msg,Long Date){
    	//String[] sql=new String [2];
    	 //sql[0]="update note set is_read=1,content2="+Msg+",reply_time="+Date+" where id="+Noteid;
    	 String sql="insert into reply(note_id,msg,log_time) values("+Noteid+",'"+Msg+"',"+Date+")";

    	 return j.execute(sql);
    }
    
    public boolean replay2(String Noteid,String Msg,Long Date){
    	
    	String sql ="update note set is_read=1,content2='"+Msg+"',reply_time="+Date+" where id="+Noteid;
    	 

    	 return j.execute(sql);
    }
    
    /*修改密码
     * 
     * */
  public int checkp(String OPassword,String Id){
    	
    	String sql ="select count(*) from police where password="+OPassword+" and Id ="+Id;
    	 

    	 return j.queryForInteger(sql);
    }
  
  
  public boolean Chanq(String NPassword,String Id){
  	
  	String sql ="update  police set  password="+NPassword+" where id ="+Id;
  	 

  	 return j.execute(sql);
  }

  
  
}                       
