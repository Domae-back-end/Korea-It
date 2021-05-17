package com.admin.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.model.DbMapper;
import com.model.MimgDTO;

@Service
public class FileupService {
	//@Value("${app.upload.dir:${user.home}}")
	//private String uploadDir;	


	@Resource
	DbMapper db;
		
	public void fileup(MultipartFile multipartFiles[],HttpServletRequest request,String movietitle,int  m_index) {
		System.out.println("fileUp 실행해요."+multipartFiles.length);
		String foldername= request.getRealPath("moviedata")+"/"+movietitle;
		File makefolder = new File(request.getRealPath("moviedata")+"/"+movietitle);		
		if(!makefolder.exists()) {
			makefolder.mkdir(); 
			System.out.println("존재하지 않으므로 폴더생성.");
		}
		
		
		for (MultipartFile multipartFile : multipartFiles) {
			
			//Path copyOfLocation = Paths.get(uploadDir + File.separator + StringUtils.cleanPath(multipartFile.getOriginalFilename()));
			Path copyOfLocation= Paths.get(foldername+"/"+multipartFile.getOriginalFilename());
			System.out.println("주소 어딘가요."+copyOfLocation);
			MimgDTO imgdto= new MimgDTO();
			imgdto.setImgname(movietitle+"/"+multipartFile.getOriginalFilename());
			imgdto.setM_index(m_index);
			System.out.println("1"+movietitle);
			System.out.println("2"+imgdto);
			
			db.movieimgin(imgdto);
			System.out.println("3");
			
			try {
				Files.copy(multipartFile.getInputStream(), copyOfLocation, StandardCopyOption.REPLACE_EXISTING);
				
				
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	     
	}
	
}
