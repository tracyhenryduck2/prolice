package com.zt.police.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;
import com.zt.police.bean.PoliceBean;
import com.zt.police.dao.PoliceDAO;
import com.common.Common;
import com.common.BaseActionSupport;

/**
 * 民警表
 * @author xin.chou
 *
 */
public class PoliceAction extends BaseActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    private PoliceDAO dao = new PoliceDAO(); 
    private PoliceBean policeBean = new PoliceBean();    
    private final String tableDesc = "民警表";
    String fileFileName;
    File file;
    
    /**    
     * 转向添加页面  
     * @return  
     */    
    public String toAddPolice() {
    	List<Map<String, Object>> depList = dao.getdepList();
        request.setAttribute("depList", depList);
        if ("1".equals(oper)) {   
    	    policeBean = dao.select(PoliceBean.class,policeBean.getId());  
    	}    
    	return "toAddPolice";    
    } 
 
    /**    
     * 新增
     */    
    public String addPolice() {  
        try {   
            showMessage = "新增"+tableDesc; 
            boolean result = true;  
            if ("1".equals(oper)) {    
                showMessage = "编辑"+tableDesc;  
                //result = dao.updateu(policeBean.getId(),policeBean.getName(),policeBean.getCode(),policeBean.getPosition(),policeBean.getPhone(),policeBean.getImage()); 
              	result=dao.update(policeBean);
               
            } else {
            	policeBean.setPassword("123456");
                result = dao.insert(policeBean); 
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
            "id","name","code","position","phone","image"
        };
        boolean result=dao.update(policeBean,param);
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
    public String delPolice() {  
    	try {
    		boolean result = dao.delete(PoliceBean.class,policeBean.getId());  
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
    public String delPolices() { 
    	try {
    		String[] idArr = request.getParameterValues("idArr");   
    		String ids = Common.array2String(idArr);   
    		boolean result = dao.deletes(PoliceBean.class,ids);
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
    	List<Map<String, Object>> list = dao.getPageList(page, policeBean);
    	request.setAttribute("list", list);   
    	return "list";    
    } 
 

    public void importFile() throws Exception{
    	response.setContentType("text/html;charset=utf-8");
    	out=response.getWriter();
    	InputStream in=new FileInputStream(file);
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
		String path = file.getParentFile().getAbsolutePath()+"/photo/";
		File f = new File(path);
		if(!f.exists()) {
			f.mkdirs();
		}
		return path;
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
	
	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}
	
    public PoliceBean getPoliceBean() { 
    	return policeBean;    
    } 
 
    public void setPoliceBean(PoliceBean policeBean) {   
    	this.policeBean = policeBean;
    } 
	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	} 
}
