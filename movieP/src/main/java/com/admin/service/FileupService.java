package com.admin.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.model.DbMapper;
import com.model.MimgDTO;

@Service
public class FileupService {
	//@Value("${app.upload.dir:${user.home}}")
	//private String uploadDir;	
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired private ResourceLoader resourceLoader;
	@Autowired private ServletContext servletContext;


	@Resource
	DbMapper db;
	// 파일업로드 여기서 관리.	
	public void fileup(MultipartFile multipartFiles[],HttpServletRequest request,String movietitle,int  m_index){
		logger.debug("fileUp 실행 : {}",multipartFiles.length);
		//String folderName =request.getsessi;
		String foldername= request.getRealPath("moviedata")+"\\"+movietitle;
		foldername=request.getSession().getServletContext().getRealPath("/resources/static/moviedata");
	
		System.out.println("folder:"+foldername);
		System.out.println("서블릿컨텍스트:"+servletContext.getRealPath("/"));
		
		
		File makefolder = new File(request.getRealPath("moviedata")+"/"+movietitle);		
		if(!makefolder.exists()) {
			makefolder.mkdir(); 
			System.out.println("존재하지 않으므로 폴더생성.");
		}
		//getClass().getResource("/static/moviedata");
		
		for (MultipartFile multipartFile : multipartFiles) {
		
			Path copyOfLocation= Paths.get(foldername+"/"+multipartFile.getOriginalFilename());
			System.out.println("주소 어딘가요."+copyOfLocation);
			MimgDTO imgdto= new MimgDTO();
			imgdto.setImgname(movietitle+"/"+multipartFile.getOriginalFilename());
			imgdto.setM_index(m_index);db.movieimgin(imgdto);
			try {
				Files.copy(multipartFile.getInputStream(), copyOfLocation, StandardCopyOption.REPLACE_EXISTING);
				
				
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	     
	}
	
}
