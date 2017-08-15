package com.zt.police.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import com.zt.police.bean.NoticeBean;
import com.zt.police.dao.NoticeDAO;
import com.common.Common;
import com.common.BaseActionSupport;

/**
 * 通知公告
 * @author xin.chou
 *
 */
public class NoticeAction extends BaseActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    private NoticeDAO dao = new NoticeDAO(); 
    private NoticeBean noticeBean = new NoticeBean();    
    private final String tableDesc = "通知公告";
    File file;
    String fileFileName;


	/**    
     * 转向添加页面  
     * @return  
     */    
    public String toAddNotice() {
        if ("1".equals(oper)) {   
    	    noticeBean = dao.select(NoticeBean.class,noticeBean.getId());  
    	    if(noticeBean.getFileUrl()!=null&&noticeBean.getFileUrl().trim().length()>0){
        	    String fileName=noticeBean.getFileUrl().substring(13, noticeBean.getFileUrl().length());
        	    request.setAttribute("msg", fileName);
        	}
    	}    
    	return "toAddNotice";    
    } 
 
    /**    
     * 新增
     */    
    public String addNotice() {  
        try {   
            showMessage = "新增"+tableDesc; 
            boolean result = true; 
            noticeBean.setDate(new Date().getTime()/1000);
            if ("1".equals(oper)) {    
                showMessage = "编辑"+tableDesc;  
                result = dao.update(noticeBean); 
            } else { 
                result = dao.insert(noticeBean); 
            }
            if (result) {  
                showMessage += "成功";  
                return reload_success; 
            } else {
                showMessage += "失败";  
                return error;   
            }  
        } catch (Exception e) {    
            showMessage = "数据异常，操作失败";   
            return error;  
        } 
    } 
 
    /**    
     * 编辑部分字段专用
     * @return
     */
    public String addTest2(){
        showMessage = "编辑2"+tableDesc;
        String[] param={
            "id","title","content","date","fileUrl"
        };
        boolean result=dao.update(noticeBean,param);
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
    public String delNotice() {  
    	try {
    		boolean result = dao.delete(NoticeBean.class,noticeBean.getId());  
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
    public String delNotices() { 
    	try {
    		String[] idArr = request.getParameterValues("idArr");   
    		String ids = Common.array2String(idArr);   
    		boolean result = dao.deletes(NoticeBean.class,ids);
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
 
    public void importFile() throws Exception{
    	response.setContentType("text/html;charset=utf-8");
    	out=response.getWriter();
    	InputStream in=new FileInputStream(file);
    	//System.out.println(fileFileName);
    	String fileName=new Date().getTime()+fileFileName;
    	FileOutputStream fs=new FileOutputStream(getUploadPath()+fileName);
    	int byteread=0;
    	int bytesum=0;
    	byte[] buffer=new byte[1024];
    	while((byteread=in.read(buffer))!=-1){
    		bytesum+=byteread;
    		fs.write(buffer, 0, byteread);
    	}
    	fs.close();
    	in.close();
    	out.print(fileName);
    	out.close();
    }
    
    private String getUploadPath() {
    	File file=new File(request.getSession().getServletContext().getRealPath(""));
		return file.getParentFile().getAbsolutePath()+"/upload/";
	}

	public void removeFile() throws IOException{
		out=response.getWriter();
    	String fileName=request.getParameter("fileName");
    	File file=new File(getUploadPath()+fileName);
    	boolean flag=true;
    	if(file.isFile()&&file.exists()){
    		flag=file.delete();
    	}
    	out.print(flag);
    	out.close();
    }
    
    /**    
     * 查询列表页面  
     * @return  
     */    
    public String list() {
    	page.execute(request, "ID", "desc");
    	List<Map<String, Object>> list = dao.getPageList(page, noticeBean);
    	request.setAttribute("list", list);   
    	return "list";    
    } 
 
    public NoticeBean getNoticeBean() { 
    	return noticeBean;    
    } 
 
    public void setNoticeBean(NoticeBean noticeBean) {   
    	this.noticeBean = noticeBean;
    } 
    
    public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	
	
	 public static void main(String[] args) {
         String test ="dsdsa";
         String test2 ="dsdsa";
         String result = stringToAscii(test);
         String result2 = stringToAscii(test2);
         
         BigDecimal b1 = new BigDecimal(result);
         BigDecimal b2 = new BigDecimal(result2);
         int totalresult = b1.compareTo(b2);
         System.out.println(totalresult);
     }
	 
		public static String stringToAscii(String value)  
		{  
		    StringBuffer sbu = new StringBuffer();  
		    char[] chars = value.toCharArray();   
		    for (int i = 0; i < chars.length; i++) {  
		        if(i != chars.length - 1)  
		        {  
		            sbu.append((int)chars[i]).append("");  
		        }  
		        else {  
		            sbu.append((int)chars[i]);  
		        }  
		    }  
		    return sbu.toString();  
		} 
		
		public static String asciiToString(String value)  
		{  
		    StringBuffer sbu = new StringBuffer();  
		    String[] chars = value.split(",");  
		    for (int i = 0; i < chars.length; i++) {  
		        sbu.append((char) Integer.parseInt(chars[i]));  
		    }  
		    return sbu.toString();  
		} 
}
