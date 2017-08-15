package com.common;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.Random;

import javax.servlet.http.HttpSession;

public class ValidateImage {
	public static BufferedImage getImg(HttpSession session) {
		int width = 120;  
        int height = 30;  
          
        //创建一张内存中的缓存图片  
        BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);  
        Random random = new Random();  
        ///背景色  
        //通过graphics绘制图像  
        Graphics graphics = bufferedImage.getGraphics(); 
        //设置颜色  
        graphics.setColor(Color.yellow);  
        //填充  
        graphics.fillRect(0, 0, width, height);  
          
        ///画边框  
        graphics.setColor(Color.blue);  
        graphics.drawRect(0, 0, width-1, height-1);  
          
        //写字母  
        String content = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcedfghijklmnopqrstuvwxyz1234567890";  
        //设置字体颜色  
        graphics.setColor(Color.red);  
        //设置字体及大小  
        graphics.setFont(new Font("宋体", Font.BOLD, 20));  
        int x=20;  
        int y=20;  
        String vcode="";
        for(int i = 0; i < 4; i++)  
        {  
            int index = random.nextInt(content.length());  
            char letter = content.charAt(index); 
            vcode+=letter;
            graphics.drawString(letter+" ", x, y);  
            x = x+20;  
        }  
        session.setAttribute("vcode", vcode);
        //绘制干扰线  
        int x1;  
        int x2;  
        int y1;  
        int y2;  
        graphics.setColor(Color.LIGHT_GRAY);  
        for(int i = 0;i <10;i++)  
        {  
            x1=random.nextInt(width);  
            x2=random.nextInt(width);  
            y1=random.nextInt(height);  
            y2=random.nextInt(height);  
            graphics.drawLine(x1, y1, x2, y2);  
        }  
          
        //将图片输出到浏览器  
        return bufferedImage;
	}
}
