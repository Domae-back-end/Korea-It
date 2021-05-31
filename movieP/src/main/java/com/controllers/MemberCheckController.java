package com.controllers;

import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

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
		
		return res.execute(dto,null,null);
	}
	
	@ResponseBody
	@RequestMapping(value = "/memberRecord", method = RequestMethod.POST)
	public Object purchasechek(@RequestBody MemberDTO dto) {
		
		MemberAction res = pr.getContext().getBean("membermypage", MemberAction.class);

		return res.execute(dto,null,null);
	}
	
	@ResponseBody
	@RequestMapping(value = "/membermodify", method = RequestMethod.POST)
	public Object modify(@RequestBody MemberDTO dto) {
		
		MemberAction res = pr.getContext().getBean("membermodify", MemberAction.class);
		
		return res.execute(dto,null, null);
	}
	
	@ResponseBody
	@RequestMapping(value = "/memberdelete", method = RequestMethod.POST)
	public Object delete(@RequestBody MemberDTO dto) {
		
		MemberAction res = pr.getContext().getBean("memberdelete", MemberAction.class);
		
		return res.execute(dto,null, null);
	}
	
	@ResponseBody
	@RequestMapping("/memberpnumCheckSNS")
	public String pnumchek(String phoneNumber) {
		
		Random rand  = new Random();
        String chknum = "";
        for(int i=0; i<4; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            chknum+=ran;
        }
        
    	MemberCertifiedPnum certifiedPnum = new MemberCertifiedPnum();
        
        System.out.println("수신자 번호 : " + phoneNumber);
        System.out.println("인증번호 : " + chknum);
        certifiedPnum.mempnumCheck(phoneNumber,chknum);
        
        return chknum;
	}
} 
