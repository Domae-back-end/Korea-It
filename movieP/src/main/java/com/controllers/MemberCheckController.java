package com.controllers;

import java.util.Random;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.admin.service.Provider;
import com.model.DbMapper;
import com.model.MemberAction;
import com.model.MemberDTO;
import com.user.service.MemberCertifiedPnum;

@Controller
public class MemberCheckController {

	@Resource
	Provider pr;
	
	@ResponseBody
	@RequestMapping(value = "/memberCheck", method = RequestMethod.POST)
	public Object loginchek(@RequestBody MemberDTO dto) {
		
		MemberAction res = pr.getContext().getBean("memberCheck", MemberAction.class);
		
		return res.execute(dto);
	}
	
	@ResponseBody
	@RequestMapping("/memberpnumCheckSNS")
	public String pnumchek(@RequestBody String userpnum) {
		
		Random rand  = new Random();
        String chknum = "";
        for(int i=0; i<4; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            chknum+=ran;
        }
        
    	MemberCertifiedPnum certifiedPnum = new MemberCertifiedPnum();
        
        System.out.println("수신자 번호 : " + userpnum);
        System.out.println("인증번호 : " + chknum);
        //certifiedPnum.mempnumCheck(userpnum,chknum);
        
        return chknum;
	}
} 
