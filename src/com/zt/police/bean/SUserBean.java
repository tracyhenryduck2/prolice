package com.zt.police.bean;

import com.avatar.db.annotation.*;
import com.common.*;

/**
 * 用户列表
 * @author xin.chou
 *
 */
@Table(name="s_user")
public class SUserBean {

	/**
	 *  
	*/
	@Column(name="id",primaryKey=true,generatorType=GeneratorType.AUTO_INCREMENT)
	private Long id;

	/**
	 * 管理员账号 
	*/
	@Column(name="username")
	private String username;

	/**
	 * 密码 
	*/
	@Column(name="password")
	private String password;

	/**
	 * 名称 
	*/
	@Column(name="nickname")
	private String nickname;

	/**
	 * 电话 
	*/
	@Column(name="tel")
	private String tel;

	/**
	 * 邮箱 
	*/
	@Column(name="email")
	private String email;

	/**
	 *  
	*/
	@Column(name="state")
	private String state;

	/**
	 *  
	*/
	@Column(name="comments")
	private String comments;
    	
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
     * 管理员账号
     * @return 
     */ 
    public String getUsername() {
    	return username;
    }
    
    /** 
     * 管理员账号
     * @param 
     */ 
    public void setUsername(String username) {
    	this.username = username;
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
    	
    /** 
     * 名称
     * @return 
     */ 
    public String getNickname() {
    	return nickname;
    }
    
    /** 
     * 名称
     * @param 
     */ 
    public void setNickname(String nickname) {
    	this.nickname = nickname;
    }
    	
    /** 
     * 电话
     * @return 
     */ 
    public String getTel() {
    	return tel;
    }
    
    /** 
     * 电话
     * @param 
     */ 
    public void setTel(String tel) {
    	this.tel = tel;
    }
    	
    /** 
     * 邮箱
     * @return 
     */ 
    public String getEmail() {
    	return email;
    }
    
    /** 
     * 邮箱
     * @param 
     */ 
    public void setEmail(String email) {
    	this.email = email;
    }
    	
    /** 
     * 
     * @return 
     */ 
    public String getState() {
    	return state;
    }
    
    /** 
     * 
     * @param 
     */ 
    public void setState(String state) {
    	this.state = state;
    }
    	
    /** 
     * 
     * @return 
     */ 
    public String getComments() {
    	return comments;
    }
    
    /** 
     * 
     * @param 
     */ 
    public void setComments(String comments) {
    	this.comments = comments;
    }
}