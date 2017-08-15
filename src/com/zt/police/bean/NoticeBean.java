package com.zt.police.bean;

import com.avatar.db.annotation.*;
import com.common.*;

/**
 * 通知公告
 * @author xin.chou
 *
 */
@Table(name="notice")
public class NoticeBean {

	/**
	 *  
	*/
	@Column(name="id",primaryKey=true,generatorType=GeneratorType.AUTO_INCREMENT)
	private Long id;

	/**
	 *  
	*/
	@Column(name="title")
	private String title;

	/**
	 *  
	*/
	@Column(name="content")
	private String content;

	/**
	 *  
	*/
	@Column(name="date")
	private Long date;

	/**
	 *  
	*/
	@Column(name="file_url")
	private String fileUrl;
    	
    /** 
     * 
     * @return 
     */ 
    public Long getId() {
    	return id;
    }
    
    /** 
     * 
     * @param 
     */ 
    public void setId(Long id) {
    	this.id = id;
    }
    	
    /** 
     * 
     * @return 
     */ 
    public String getTitle() {
    	return title;
    }
    
    /** 
     * 
     * @param 
     */ 
    public void setTitle(String title) {
    	this.title = title;
    }
    	
    /** 
     * 
     * @return 
     */ 
    public String getContent() {
    	return content;
    }
    
    /** 
     * 
     * @param 
     */ 
    public void setContent(String content) {
    	this.content = content;
    }
    	
    /** 
     * 
     * @return 
     */ 
    public Long getDate() {
    	return date;
    }
    
    /** 
     * 
     * @param 
     */ 
    public void setDate(Long date) {
    	this.date = date;
    }
    	
    /** 
     * 
     * @return 
     */ 
    public String getFileUrl() {
    	return fileUrl;
    }
    
    /** 
     * 
     * @param 
     */ 
    public void setFileUrl(String fileUrl) {
    	this.fileUrl = fileUrl;
    }
}