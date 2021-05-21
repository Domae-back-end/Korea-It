package com.user.service;

import java.util.HashMap;
import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class MemberCertifiedPnum {
	
	 public void mempnumCheck(String phoneNumber, String cerNum) {

	        String api_key = "NCSH1SZDOPUMQAWJ";
	        String api_secret = "8NETIXNPJJGGAHMJXB9HXUKJNDPWJSBE";
	        Message coolsms = new Message(api_key, api_secret);

	        HashMap<String, String> params = new HashMap<String, String>();
	        params.put("to", phoneNumber);
	        params.put("from", "010-2075-4220");
	        params.put("type", "SMS");
	        params.put("text", "영화관 회원가입 본인인증 메시지 : 인증번호는" + "["+cerNum+"]" + "입니다.");
	        params.put("app_version", "test app 1.2"); 

	        try {
	            JSONObject obj = (JSONObject) coolsms.send(params);
	            System.out.println(obj.toString());
	        } catch (CoolsmsException e) {
	            System.out.println(e.getMessage());
	            System.out.println(e.getCode());
	        }

	    }
}
