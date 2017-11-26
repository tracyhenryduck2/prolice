package com.zt.police.dao;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.common.BaseDAO;
import com.common.Page;
import com.zt.police.bean.PoliceBean;
                        
/**                     
 *                      
 * 民警表 <br>          
 *                      
 * @author   <br>   
 * @taskId   <br>   
 */                     
public class PoliceDAO extends BaseDAO { 
    /**                 
     * 分页查询         
     * @param page      
     * @param           
     * @return          
     */                 
    public List<Map<String,Object>> getPageList(Page page, PoliceBean policeBean) {   
    	String sql ="select a.*,b.name as dep_name from police a left join department b on a.dep_id=b.id"; 
    	List<Object> objectList = new ArrayList<Object>();
    	String sqlWhere = " where 1=1 ";  
    	if(policeBean!=null) { 
    		if(policeBean.getId() != null) { 
    			objectList.add(policeBean.getId());
    			sqlWhere += " AND a.id = ? ";
    		} 
    		if(policeBean.getName() != null && policeBean.getName().trim().length()>0) { 
    			objectList.add(policeBean.getName());
    			sqlWhere += " AND a.name = ? ";
    		} 
    		if(policeBean.getCode() != null && policeBean.getCode().trim().length()>0) { 
    			objectList.add(policeBean.getCode());
    			sqlWhere += " AND a.code = ? ";
    		} 
    		if(policeBean.getPosition() != null && policeBean.getPosition().trim().length()>0) { 
    			objectList.add(policeBean.getPosition());
    			sqlWhere += " AND a.position = ? ";
    		} 
    		if(policeBean.getPhone() != null && policeBean.getPhone().trim().length()>0) { 
    			objectList.add(policeBean.getPhone());
    			sqlWhere += " AND a.phone = ? ";
    		}    		
    		if(policeBean.getEmail() != null && policeBean.getEmail().trim().length()>0) { 
    			objectList.add(policeBean.getEmail());
    			sqlWhere += " AND a.email = ? ";
    		}  
    	}             
    	sql = sql + sqlWhere; 
    	Object[] pram = objectList.toArray(); 
    	if(page.getSortname()!=null && page.getSortorder()!=null) {   
    		sql += " order by "+page.getSortname()+" " +page.getSortorder(); 
    	}                 
    	page.setTotalRows(j.queryForInteger("select count(*) from police a "+sqlWhere, pram));
    	List<Map<String,Object>> list=j.queryForPageList(sql, page.getPageNo(),page.getPageSize(),pram);  
    	return list;      
    }      
    
    public List<Map<String,Object>> getList(){
    	String sql="select * from police";
    	return j.queryForList(sql);
    }
    
    public List<Map<String,Object>> getdepList(){
    	String sql="select * from department";
    	return j.queryForList(sql);
    }
}                       
