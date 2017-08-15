package com.zt.police.dao;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.common.BaseDAO;
import com.common.Page;
import com.zt.police.bean.NoticeBean;
                        
/**                     
 *                      
 * 通知公告 <br>          
 *                      
 * @author   <br>   
 * @taskId   <br>   
 */                     
public class NoticeDAO extends BaseDAO { 
    /**                 
     * 分页查询         
     * @param page      
     * @param           
     * @return          
     */                 
    public List<Map<String,Object>> getPageList(Page page, NoticeBean noticeBean) {   
    	String sql ="select a.* from notice a "; 
    	List<Object> objectList = new ArrayList<Object>();
    	String sqlWhere = " where 1=1 ";  
    	if(noticeBean!=null) { 
    		if(noticeBean.getId() != null) { 
    			objectList.add(noticeBean.getId());
    			sqlWhere += " AND a.id = ? ";
    		} 
    		if(noticeBean.getTitle() != null && noticeBean.getTitle().trim().length()>0) { 
    			objectList.add(noticeBean.getTitle());
    			sqlWhere += " AND a.title = ? ";
    		} 
    		if(noticeBean.getContent() != null && noticeBean.getContent().trim().length()>0) { 
    			objectList.add(noticeBean.getContent());
    			sqlWhere += " AND a.content = ? ";
    		} 
    		if(noticeBean.getDate() != null) { 
    			objectList.add(noticeBean.getDate());
    			sqlWhere += " AND a.date = ? ";
    		} 
    		if(noticeBean.getFileUrl() != null && noticeBean.getFileUrl().trim().length()>0) { 
    			objectList.add(noticeBean.getFileUrl());
    			sqlWhere += " AND a.file_url = ? ";
    		} 
    	}                 
    	sql = sql + sqlWhere; 
    	Object[] pram = objectList.toArray(); 
    	if(page.getSortname()!=null && page.getSortorder()!=null) {   
    		sql += " order by "+page.getSortname()+" " +page.getSortorder(); 
    	}                 
    	page.setTotalRows(j.queryForInteger("select count(*) from notice a "+sqlWhere, pram));
    	List<Map<String,Object>> list=j.queryForPageList(sql, page.getPageNo(),page.getPageSize(),pram);  
    	return list;      
    }                   
}                       
