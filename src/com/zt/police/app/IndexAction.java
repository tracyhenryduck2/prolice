package com.zt.police.app;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.zt.police.app.IndexDao;
import com.zt.police.bean.NoteBean;
import com.zt.police.bean.PoliceBean;
import com.zt.police.dao.NoteDAO;
import com.zt.police.dao.PoliceDAO;
import com.common.BaseActionSupport;
import com.common.DataUtils;
import com.common.OpenMasClient;
import com.common.Transaction;
import com.common.MsgTool;

public class IndexAction extends BaseActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private IndexDao indexdao=new IndexDao();
    private NoteDAO notedao = new NoteDAO(); 
    private PoliceDAO policeDao = new PoliceDAO();
    private PoliceBean policeBean = new PoliceBean();
	
	public void outPrintJSON(Object obj) {
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Access-Control-Allow-Origin", "*");
		try {
			out = response.getWriter();
			JSONArray rootObject = JSONArray.fromObject(obj);
			out.print(rootObject);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				out.close();
			}
		}
	}
	
	public void outPrintJSONObject(Object obj) {
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Access-Control-Allow-Origin", "*");
		try {
			out = response.getWriter();
			JSONObject rootObject = JSONObject.fromObject(obj);
			out.print(rootObject);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				out.close();
			}
		}
	}
	
	/**
	 * 警察列表
	 * http://SERVER[:PORT]/PROJECTNAME/app/Index!policeList.action?depId=xx
	 * @return
	 */
	public void policeList(){
        
		Long id = Long.parseLong(request.getParameter("depId")+"");
		
		List<Map<String,Object>> list=indexdao.policeList(id);
		outPrintJSON(list);
	}
	
	/**
	 * 全部警察列表
	 * http://SERVER[:PORT]/PROJECTNAME/app/Index!AllpoliceList.action?unitId=xx
	 * @return
	 */
	public void AllpoliceList(){
        
		Long id = Long.parseLong(request.getParameter("unitId")+"");
		
		List<Map<String,Object>> list=indexdao.policeList2(id);
		outPrintJSON(list);
	}
	
	/**
	 * 全部警察分类列表
	 * http://SERVER[:PORT]/PROJECTNAME/app/Index!AllTypedpoliceList.action?unitId=xx
	 * @return
	 */
	public void AllTypedpoliceList(){
        
		Long id = Long.parseLong(request.getParameter("unitId")+"");
		
		List<Map<String,Object>> deplist =indexdao.getdepartment(id);
		List<Map<String,Object>> alllist = new ArrayList<Map<String,Object>>();
		Map<String,Object> map1 = new HashMap<String,Object>();
		map1.put("deptId", -1);
		map1.put("deptName", "所有人员");
		map1.put("policeList", indexdao.policeList2(id));
		alllist.add(map1);
		for(int i=0;i<deplist.size();i++)
		{
			Map<String,Object> map2 = new HashMap<String,Object>();
			Long depid = Long.parseLong(deplist.get(i).get("id")+"");
			List<Map<String,Object>> adlist= indexdao.policeList(depid);
			map2.put("deptId", depid);
			map2.put("deptName", deplist.get(i).get("name")+"");
			map2.put("policeList", adlist);
			alllist.add(map2);
		}
		outPrintJSON(alllist);
	}
	
	
	/**
	 * 提交消息
	 * http://SERVER[:PORT]/PROJECTNAME/app/Index!messageSubmit.action?id=xx&name=xx&phone=xx&content=xx
	 */
	public void messageSubmit(){

		
		Long Id=DataUtils.getLong(request.getParameter("id"));
		String name=request.getParameter("name");
		final String phone=request.getParameter("phone");
		String content=request.getParameter("content");
	    final NoteBean noteBean = new NoteBean(); 
    	noteBean.setPoliceId(Id);
    	noteBean.setName(name);
    	noteBean.setPhone(phone);
    	noteBean.setContent(content);
    	noteBean.setSubmit_time(new Date().getTime()/1000);
    	noteBean.setIs_read(0l);
    	policeBean.setId(Id);
       	policeBean=policeDao.select(PoliceBean.class, policeBean.getId());
        boolean result = new Transaction() {
			public void run() {
				String police_phone =policeBean.getPhone();
				try{
				MsgTool.sendMsg(phone,"平安桃源","SMS_6940101","{\"name\":\""+noteBean.getName()+"\",\"note\":\""+noteBean.getContent()+"\"}");
				MsgTool.sendMsg(police_phone,"平安桃源","SMS_6935131","{\"name\":\""+noteBean.getName()+"\",\"note\":\""+noteBean.getContent()+"\"}");
	    		}
	    		catch(Exception e)
	    		{
	    			e.printStackTrace();
	    		}
	    		indexdao.save(noteBean); 
			}
        }.start();
        Map<String,Object> map = new HashMap<String,Object>();
        if(result){
        	map.put("result", "1");
        }
        else{
        	map.put("result", "0");
        }
        outPrintJSONObject(map);
	}
	
	
	/**
	 * 获取未读消息
	 * http://SERVER[:PORT]/PROJECTNAME/app/Index!unReadList.action
	 */
    public void unReadList(){
		Long Id=DataUtils.getLong(request.getParameter("id"));
    	Map<String,Object> content=notedao.getUnRead(Id);

        outPrintJSONObject(content);
    }
    
    
    
    
	/**
	 * 获取部门列表
	 * http://SERVER[:PORT]/PROJECTNAME/app/Index!departmentList.action
	 */
    public void departmentList(){

        List<Map<String,Object>> list = indexdao.getdepartment(1l);
        outPrintJSON(list);
    }
    
    
	/**
	 * 获取部门下未读信息列表
	 * http://SERVER[:PORT]/PROJECTNAME/app/Index!getResult.action？depId=xx
	 */
    public void getResult() throws IOException{
    	Long id = Long.parseLong(request.getParameter("depId")+"");
    	List<Map<String, Object>> list=indexdao.getunreadList(id);
    	outPrintJSON(list);
    }
    
	/**
	 * 验证是否能退出
	 * http://SERVER[:PORT]/PROJECTNAME/app/Index!LoginOut.action？code=xx
	 */
    public void LoginOut() throws IOException{
    	String code = request.getParameter("code");
    	Long cnt=indexdao.getcodeCnt(code);
    	Map<String,Object> map = new HashMap<String,Object>();
    	map.put("result", cnt);
    	outPrintJSONObject(map);
    }
    
	
}
