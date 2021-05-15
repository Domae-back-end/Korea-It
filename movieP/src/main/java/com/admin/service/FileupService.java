package com.admin.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
public class FileupService {
	@Value("${app.upload.dir:${user.home}}")
	private String uploadDir;	
	public void fileup(MultipartFile multipartFiles[],HttpServletRequest request,String movietitle) {
		System.out.println("fileUp 실행해요."+multipartFiles.length);
		String foldername= request.getRealPath("moviedata")+"/"+movietitle;
		File makefolder = new File(request.getRealPath("moviedata")+"/"+movietitle);		
		if(!makefolder.exists()) {
			makefolder.mkdir(); 
		}
		
		for (MultipartFile multipartFile : multipartFiles) {
			
			//Path copyOfLocation = Paths.get(uploadDir + File.separator + StringUtils.cleanPath(multipartFile.getOriginalFilename()));
			Path copyOfLocation= Paths.get(request.getRealPath("moviedata")+"/"+movietitle+"/"+multipartFile.getOriginalFilename());
			System.out.println("주소 어딘가요."+copyOfLocation);
			try {
				Files.copy(multipartFile.getInputStream(), copyOfLocation, StandardCopyOption.REPLACE_EXISTING);
				
				
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	     
	}
	
}
