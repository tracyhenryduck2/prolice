package com.zt.police.bean;

import com.avatar.db.annotation.*;
import com.common.*;

/**
 * 民警表
 * @author xin.chou
 *
 */
@Table(name="police")
public class PoliceBean {

	/**
	 *  
	*/
	@Column(name="id",primaryKey=true,generatorType=GeneratorType.AUTO_INCREMENT)
	private Long id;

	/**
	 * 姓名 
	*/
	@Column(name="name")
	private String name;

	/**
	 * 警号 
	*/
	@Column(name="code")
	private String code;

	/**
	 * 职位 
	*/
	@Column(name="position")
	private String position;

	/**
	 * 手机号 
	*/
	@Column(name="phone")
	private String phone;

	/**
	 *  
	*/
	@Column(name="image")
	private String image;
	
	/**
	 * 部门id 
	*/
	@Column(name="dep_id")
	private Long depId;

	/**
	 * 排序 
	*/
	@Column(name="sort_id")
	private Long sortId;

	/**
	 * 密码 
	*/
	@Column(name="password")
	private String password;
    	
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
     * 警号
     * @return 
     */ 
    public String getCode() {
    	return code;
    }
    
    /** 
     * 警号
     * @param 
     */ 
    public void setCode(String code) {
    	this.code = code;
    }
    	
    /** 
     * 职位
     * @return 
     */ 
    public String getPosition() {
    	return position;
    }
    
    /** 
     * 职位
     * @param 
     */ 
    public void setPosition(String position) {
    	this.position = position;
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
    	
    /** 
     * 
     * @return 
     */ 
    public String getImage() {
    	return image;
    }
    
    /** 
     * 
     * @param 
     */ 
    public void setImage(String image) {
    	this.image = image;
    }
    
    /** 
     * 部门id
     * @return 
     */ 
    public Long getDepId() {
    	return depId;
    }
    
    /** 
     * 部门id
     * @param 
     */ 
    public void setDepId(Long depId) {
    	this.depId = depId;
    }
    	
    /** 
     * 排序
     * @return 
     */ 
    public Long getSortId() {
    	return sortId;
    }
    
    /** 
     * 排序
     * @param 
     */ 
    public void setSortId(Long sortId) {
    	this.sortId = sortId;
    }
    	
    /** 
     * 密码
     * @return 
     */ 
    public String getPassword() {
    	return password;
    }
    
    /** 
     * 密码
     * @param 
     */ 
    public void setPassword(String password) {
    	this.password = password;
    }
}