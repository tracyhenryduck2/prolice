package com.zt.police.action;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.zt.police.bean.NoteBean;
import com.zt.police.bean.PoliceBean;
import com.zt.police.dao.NoteDAO;
import com.zt.police.dao.PoliceDAO;
import com.common.Common;
import com.common.BaseActionSupport;
import com.common.OpenMasClient;
import com.common.Transaction;

/**
 * 信息
 * @author xin.chou
 *
 */
public class NoteAction extends BaseActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    private NoteDAO dao = new NoteDAO(); 
    private NoteBean noteBean = new NoteBean(); 
    private PoliceDAO policeDao = new PoliceDAO(); 
    private PoliceBean policeBean = new PoliceBean(); 
    private final String tableDesc = "信息";
    private Long noteId;
    /**    
     * 转向添加页面  
     * @return  
     */    
    public String toAddNote() {
        if ("1".equals(oper)) {   
    	    noteBean = dao.select(NoteBean.class,noteBean.getId());  
    	}    
        policeBean=policeDao.select(PoliceBean.class, policeBean.getId());
    	return "toAddNote";    
    } 
 
    /**    
     * 新增
     */    
    public String addNote() {  
        try {   
            showMessage = "新增留言"; 
            boolean result = true;  
            if ("1".equals(oper)) {    
                showMessage = "编辑"+tableDesc;  
                result = dao.update(noteBean); 
            } else { 
            	policeBean=policeDao.select(PoliceBean.class, policeBean.getId());
            	noteBean.setPoliceId(policeBean.getId());
                result = new Transaction() {
    				public void run() {
    					noteId=dao.save(noteBean); 
    					String[] phones= new String[1];
    					phones[0] =policeBean.getPhone();
    					try{
    						OpenMasClient.sendMsg(phones, "姓名："+noteBean.getName()+" 手机号："+noteBean.getPhone()+"  留言内容："+noteBean.getContent());
    		    		}
    		    		catch(Exception e)
    		    		{
    		    			e.printStackTrace();
    		    		}
    				}
                }.start();
            }
            if (result) {  
                showMessage += "成功";  
                new Thread1().start();
                return success; 
            } else {
                showMessage += "失败";  
                return "my_error";   
            }  
        } catch (Exception e) {    
            showMessage = "数据异常，操作失败";   
            return "my_error";  
        } 
    } 
 
    /**    
     * 编辑部分字段专用
     * @return
     */
    public String addTest2(){
        showMessage = "编辑2"+tableDesc;
        String[] param={
            "id","policeId","content","name","phone"
        };
        boolean result=dao.update(noteBean,param);
        if (result) { 
            showMessage += "成功";
            return reload_success;
        } else {
            showMessage += "失败"; 
           return error; 
        }
    }
    /**    
     * 删除操作 
     */    
    public String delNote() {  
    	try {
    		boolean result = dao.delete(NoteBean.class,noteBean.getId());  
    		if (result) {
    		    showMessage = "删除"+tableDesc+"成功"; //reload   
    		    return reload_success;  
    		} else {
    		    showMessage = "删除"+tableDesc+"失败";  
    		    return error; 
    		}  
    	} catch (Exception e) {  
    		return exception; 
    	}    
    } 
 
 
    /**    
     * 删除操作 
     */    
    public String delNotes() { 
    	try {
    		String[] idArr = request.getParameterValues("idArr");   
    		String ids = Common.array2String(idArr);   
    		boolean result = dao.deletes(NoteBean.class,ids);
    		if (result) {
    		    showMessage = "删除"+tableDesc+"成功"; //reload   
    		    return reload_success;  
    		} else {
    		    showMessage = "删除"+tableDesc+"失败";  
    		    return error; 
    		}  
    	} catch (Exception e) {  
    		return exception; 
    	}    
    } 
    public String search() {
        return "search"; 
    }
 
    /**    
     * 查询列表页面  
     * @return  
     */    
    public String list() {
    	page.execute(request, "ID", "desc");
    	List<Map<String, Object>> list = dao.getPageList(page, noteBean);
    	request.setAttribute("list", list);   
    	return "list";    
    } 
 
    
    public String unReadList(){
    	Map<String,Object> content=dao.getUnRead(policeBean.getId());
    	request.setAttribute("content", content);
    	policeBean=policeDao.select(PoliceBean.class, policeBean.getId());
    	return "unReadList";
    }
    public void getResult() throws IOException{
    	response.setHeader("Access-Control-Allow-Origin", "*");
		response.setContentType("text/html;charset=utf-8");
		out=response.getWriter();
    	String sql="select cnt,id from police a left join "+
    		"(select count(*) cnt,police_id from note "+
    		"where content2 is not null and is_read=0 "+
    		"group by police_id "+
    		") b on a.id=b.police_id";
    	List<Map<String, Object>> list=dao.j.queryForList(sql);
    	JSONArray obj=JSONArray.fromObject(list);
		out.print(obj);
		out.close();
    }
    public NoteBean getNoteBean() { 
    	return noteBean;    
    } 
 
    public void setNoteBean(NoteBean noteBean) {   
    	this.noteBean = noteBean;
    }

	public PoliceBean getPoliceBean() {
		return policeBean;
	}

	public void setPoliceBean(PoliceBean policeBean) {
		this.policeBean = policeBean;
	} 
    class Thread1 extends Thread{
    	public void run(){
    		try {
				Thread.sleep(1000*60*2);
    			//Thread.sleep(3000);
				dao.getContent2(noteId);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
    	}
    }
}
