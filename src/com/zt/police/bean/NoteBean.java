package com.zt.police.bean;

import com.avatar.db.annotation.*;
import com.common.*;

/**
 * 信息
 * @author xin.chou
 *
 */
@Table(name="note")
public class NoteBean {

	/**
	 *  
	*/
	@Column(name="id",primaryKey=true,generatorType=GeneratorType.AUTO_INCREMENT)
	private Long id;

	/**
	 * 民警id 
	*/
	@Column(name="police_id")
	private Long policeId;

	/**
	 * 短信内容 
	*/
	@Column(name="content")
	private String content;

	/**
	 * 短信回复内容 
	*/
	@Column(name="content2")
	private String content2;

	
	/**
	 * 是否已读 
	*/
	@Column(name="is_read")
	private Long is_read;	
	
	/**
	 * 姓名 
	*/
	@Column(name="name")
	private String name;

	/**
	 * 手机号 
	*/
	@Column(name="phone")
	private String phone;
    	
	
	/**
	 *提交时间 
	*/
	@Column(name="submit_time")
	private Long submit_time;

	/**
	 * 响应时间
	*/
	@Column(name="reply_time")
	private Long reply_time;

	
	
	
    public Long getSubmit_time() {
		return submit_time;
	}

	public void setSubmit_time(Long submit_time) {
		this.submit_time = submit_time;
	}

	public Long getReply_time() {
		return reply_time;
	}

	public void setReply_time(Long reply_time) {
		this.reply_time = reply_time;
	}

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
     * 民警id
     * @return 
     */ 
    public Long getPoliceId() {
    	return policeId;
    }
    
    /** 
     * 民警id
     * @param 
     */ 
    public void setPoliceId(Long policeId) {
    	this.policeId = policeId;
    }
    	
    /** 
     * 短信内容
     * @return 
     */ 
    public String getContent() {
    	return content;
    }
    
    /** 
     * 短信内容
     * @param 
     */ 
    public void setContent(String content) {
    	this.content = content;
    }
    	
    /** 
     * 姓名
     * @return 
     */ 
    public String getName() {
    	return name;
    }
    
    /** 
     * 姓名
     * @param 
     */ 
    public void setName(String name) {
    	this.name = name;
    }
    	
    /** 
     * 手机号
     * @return 
     */ 
    public String getPhone() {
    	return phone;
    }
    
    /** 
     * 手机号
     * @param 
     */ 
    public void setPhone(String phone) {
    	this.phone = phone;
    }

	public Long getIs_read() {
		return is_read;
	}

	public void setIs_read(Long is_read) {
		this.is_read = is_read;
	}

	public String getContent2() {
		return content2;
	}

	public void setContent2(String content2) {
		this.content2 = content2;
	}

}