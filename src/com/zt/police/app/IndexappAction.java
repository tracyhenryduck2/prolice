package com.zt.police.app;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.common.BaseActionSupport;
import com.common.LoginUser;
import com.common.MsgTool;
import com.common.OpenMasClient;
import com.common.Transaction;
import com.zt.police.bean.NoteBean;
import com.zt.police.bean.PoliceBean;
import com.zt.police.dao.NoteDAO;
import com.zt.police.dao.PoliceDAO;
import com.common.Transaction;
import com.common.Base64;

public class IndexappAction extends BaseActionSupport {
	
	/**
	 * 
	 */
	 private NoteDAO notedao = new NoteDAO(); 
	 private NoteBean noteBean = new NoteBean(); 
     private IndexDao indexdao = new IndexDao(); 
	private static final long serialVersionUID = 1L;
	private String username;
	private String password;
    private Long noteId;
    
    
    
	/**
	 * 用户登录获取基本信息
	 * http://SERVER[:PORT]/PROJECTNAME/app/Index!login.action?uname=XX&password=XX
	 * @return
	 */
	public void index(){
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		Map<String,Object> map=notedao.login(username,password);
		outPrintJSONObject(map);
	}
    
	/**
	 * 登录
	 * @return
	 */
	public String index2(){
		String result="error";
		if(session.get("user")!=null){
			return "success";
		}
		if(username!=null&&password!=null){
			if(username.length()>0&&password.length()>0){
				 
				LoginUser user=indexdao.selectPolice(username,password);
				if(user!=null){
					session.put("user", user);
					result="success";
				}else{
					showMessage="用户名密码错误或该账户被停用！";
				}
			}else{
				showMessage="请正确填写用户名和密码！";
			}
		}else{
			showMessage=null;
		}
		return result;
	}
	/**
	 * 登出
	 * @return
	 */
	public String logout(){
		if(session.get("user")!=null){
			session.remove("user");
		}
		return "logout";
	}
	
	/**
	 * 用户修改密码
	 * http://SERVER[:PORT]/PROJECTNAME/app/Index!modPassword.action?uId=XX&newPassword=XX
	 * @return
	 */
	public void modPassword(){
		boolean result = false;
		
		String Id=request.getParameter("Id");
		String OPassword=request.getParameter("oldPassword");
		String NPassword=request.getParameter("newPassword");
		System.out.println(OPassword);
		System.out.println(NPassword);
		int result2=notedao.checkp(OPassword,Id);
		if(result2>0){
			result=notedao.Chanq(NPassword,Id);
		outPrintJSON(result);}
		else{
           
			outPrintJSON(result2);	
		}
		
	}
	  
	 
	    /**    
	     * 查询列表页面  
	     * @return  
	     */    
	    public void listapp() {
	    	page.execute(request, "ID", "desc");
	    	String PoliceId = request.getParameter("policeid");
	    	List<Map<String, Object>> list = notedao.getPageApp(page, PoliceId);	
	    
	    	for(Map<String,Object> map:list)
	    	{
	    		String d =  map.get("content2").toString();
	    		System.out.print(d);
	    		byte[] srtbyte = Base64.decode(d);
	    		System.out.print(srtbyte);
	    		String res;
				try {
					res = new String(srtbyte,"UTF-8");
		    		System.out.print(res);
		    		map.put("content2", res);
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

	    	}
	    	outPrintJSON(list);
	    } 
	    
	    /*点击列表
	     * */
	    public void listclock(){
	    	page.execute(request, "ID", "desc");
	    	String NoteId= request.getParameter("noteid");
	    	
	    	notedao.read(NoteId);
	    	//List<Map<String,Object>> list=notedao.notepl(NoteId);
	    	 //List<Map<String, Object>> list2 = notedao.noteRp(page, noteBean.getId());
            List<Map<String, Object>> list2 = notedao.noteRp(page, NoteId);
	    	for(Map<String,Object> map:list2)
	    	{
	    		String d =  map.get("msg").toString();
	    		System.out.print(d);
	    		byte[] srtbyte = Base64.decode(d);
	    		System.out.print(srtbyte);
	    		String res;
				try {
					res = new String(srtbyte,"UTF-8");
		    		System.out.print(res);
		    		map.put("msg", res);
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

	    	}
            //list.addAll(list2); 
            outPrintJSON(list2);
	    }
	    
	    /*
	     * 回复
	     * */
	    public void replay(){

	    	boolean length_is_ok = false;
	    	final String NoteId= request.getParameter("noteid");
	    	final String Name= request.getParameter("name");
	    	String Phone = request.getParameter("notephone");
	    	final String Msg= request.getParameter("msg");
	    	final Long date=new Date().getTime()/1000;
	    	System.out.print("短信内容");
	    	System.out.print(Msg);
      	
	    	final String[] phones= new String[1];
			phones[0] =Phone;
    		byte[] srtbyte = Base64.decode(Msg);
    		String Msg2 ="";
   		 try {
			Msg2 = new String(srtbyte,"UTF-8");
			if(Msg2.length()<=15){
				length_is_ok = true;
			}
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	    	
		   if(length_is_ok){
		        boolean result = new Transaction() {
					public void run() {
						try{
							
						
				    		byte[] srtbyte = Base64.decode(Msg);
				    		
				    		 
				    		 String Msg2 = new String(srtbyte,"UTF-8");
				    		 String Msg3 = "";
				    		 if(Msg2.length()>15){
				    			 Msg3 = Msg2.substring(0,13)+"..";
				    		 }else{
				    			 Msg3 = Msg2;
				    		 }
							//OpenMasClient.sendMsg(phones, "姓名："+Name +" 留言内容："+Msg);
							MsgTool.sendMsg(phones[0],"平安桃源","SMS_7265416","{\"name\":\""+Name+"\",\"note\":\""+Msg3+"\"}");
							notedao.replay(NoteId,Msg,date);
							notedao.replay2(NoteId,Msg,date);
						}
						catch(Exception e)
			    		{
			    			e.printStackTrace();
			    		}
						

					}
		        }.start();
		        Map<String,Object> map = new HashMap<String,Object>();
		        if(result){
		        	map.put("result", "1");
			        map.put("submit_time", date);
		        }
		        else{
		        	map.put("result", "0");
		        }	

		    	 outPrintJSONObject(map);
		   }else{
			   Map<String,Object> map = new HashMap<String,Object>();
			   map.put("result", "0");
		    	outPrintJSONObject(map);
		   }
		

	        

	    	
	    }
	    
	    
	    public void noticeList(){
	    	List<Map<String,Object>> list = indexdao.getNoticeList();
	    	outPrintJSON(list);
	    }
	    
	    public void noticeDetail(){
	    	Long NoteId= Long.parseLong(request.getParameter("noticeid")+"");
	    	Map<String,Object> map = indexdao.getNoiceDetail(NoteId);
	    	outPrintJSONObject(map);
	    }
	    
	    
	    public NoteBean getNoteBean() { 
	    	return noteBean;    
	    } 
	 
	    public void setNoteBean(NoteBean noteBean) {   
	    	this.noteBean = noteBean;
	    }
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
    class Thread1 extends Thread{
    	public void run(){
    		try {
				Thread.sleep(1000*60*2);
    			//Thread.sleep(3000);
				notedao.getContent2(noteId);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
    	}
    }
}
