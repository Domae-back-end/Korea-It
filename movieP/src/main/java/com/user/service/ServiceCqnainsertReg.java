package com.user.service;

import java.io.File;
import java.io.FileOutputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.model.AlterDTO;
import com.model.DbMapper;
import com.model.ServiceFullDTO;
import com.model.ServiceNoticePageDTO;

@Service
public class ServiceCqnainsertReg implements ServiceCservice {//빈 창고에 등록이되는데.

	@Resource
	DbMapper db;

	
	
	@Override
	public Object execute(ServiceNoticePageDTO npDTO, ServiceFullDTO sfDTO, HttpSession session, HttpServletRequest request, MultipartFile file) {
		System.out.println("빈 이름 serviceCqnainsertReg 소환됨");

		System.out.println("파일이름: "+file.getOriginalFilename());
		
		
		
		if (!file.getOriginalFilename().isEmpty()) { //파일이 선택되었을때
			
			String path = request.getRealPath("persupload");
			path = "C:\\Users\\안정화\\git\\movieProj\\movieP\\src\\main\\webapp\\views\\user\\img\\persupload";
			//경로 어떻게?
			//C:\Users\안정화\git\movieProj\movieP\src\main\webapp\persupload\pic1.png
			
			
			int pos = file.getOriginalFilename().lastIndexOf("."); //.앞까지 asdfasdf.png ->8
			String fname = file.getOriginalFilename(); //찐이름
			String domain = fname.substring(0,pos); //0~8 ->파일이름추출
			String ext = fname.substring(pos); //그뒤 확장자명
			int no = 0; //중복갯수
			
			try {
				File ff = new File(path+"\\"+fname); //파일이있다면
				while (ff.exists()) { //파일이있다면
					no++;
					fname = domain+"_"+no+ext;
					ff = new File(path+"\\"+fname);
				}
				FileOutputStream fos = new FileOutputStream(ff);
				
				sfDTO.setPersimg(sfDTO.getFile().getOriginalFilename());
				fos.write(file.getBytes());
				
				fos.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		sfDTO.setPersid((String)session.getAttribute("sessionId"));
		db.insertPersQna(sfDTO);
		

		
		AlterDTO ad = new  AlterDTO();
		ad.setMsg("1대1 문의가 등록되었습니다!");
		ad.setUrl("/user/serviceC/servicePersonal");
		
		return ad;
		
	}

	
}
