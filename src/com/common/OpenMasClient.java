package com.common;
import java.rmi.RemoteException;

import org.apache.axis2.AxisFault;

import com.chinamobile.openmas.client.Sms;
import com.chinamobile.openmas.entity.SmsMessage;

public class OpenMasClient {
	public static String sendMsg(String[] list,String message ) throws RemoteException{
		Sms sms;
		sms = new Sms("http://nb028.openmas.net:9080/OpenMasService");
		return sms.SendMessage(list, message,"3", "8027001", "wVuBriXgozWe");
	}
	
	public static String getMsg(String msgId) throws RemoteException{
		Sms sms;
		sms = new Sms("http://nb028.openmas.net:9080/OpenMasService");
		 SmsMessage mo = sms.GetMessage(msgId);
        if(mo !=null){
        	System.out.println(mo.toString());
        	return mo.toString();
        }else{
        	return null;
        }
	}
	
	public static void main(String[] args) throws RemoteException{
//		String[] list={"13705749758"};
//		System.out.print(sendMsg(list,"ccesss"));
		System.out.println(getMsg("c2951846-a0ec-4c85-a553-b573483b3d3d"));
	}
}

