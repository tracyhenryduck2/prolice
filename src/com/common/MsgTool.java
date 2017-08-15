package com.common;

import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.AlibabaAliqinFcSmsNumSendRequest;
import com.taobao.api.response.AlibabaAliqinFcSmsNumSendResponse;

public class MsgTool {
	public static String SendURL="http://gw.api.taobao.com/router/rest";
	public static String AppKey="23334143";
	public static String Secret="8cd95229cd4a108885b714e18eca61c9";
	public static void sendMsg(String recNum,String signName,String code,String para) throws ApiException{
		TaobaoClient client = new DefaultTaobaoClient(SendURL, AppKey, Secret);
		AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
		req.setExtend("123456");
		req.setSmsType("normal");
		req.setSmsFreeSignName(signName);
		req.setSmsParamString(para);
		req.setRecNum(recNum);
		req.setSmsTemplateCode(code);
		AlibabaAliqinFcSmsNumSendResponse rsp = client.execute(req);
		System.out.println(rsp.getBody());
	}

	public static void main(String[] args) throws ApiException{
		//submit success
		sendMsg("13382060209","平安桃源","SMS_6935131","{\"name\":\"张三\",\"note\":\"有人抢我钱了，帮我处理一下。\"}");
		sendMsg("13382060209","平安桃源","SMS_6940101","{\"name\":\"张三\",\"note\":\"有人抢我钱了，帮我处理一下。\"}");
		
		//reply（正式ID：SMS_7265416，目前审批中，等审批通过了，就会发送成功了）
		sendMsg("13382060209","平安桃源","SMS_7265416","{\"name\":\"李警官\",\"note\":\"先报案，然后搜集证据。\"}");
		
	}
	

}
