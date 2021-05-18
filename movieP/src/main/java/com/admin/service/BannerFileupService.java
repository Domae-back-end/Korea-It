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

import com.model.BannerDTO;
import com.model.DbMapper;
import com.model.MimgDTO;

@Service
public class BannerFileupService {
	//@Value("${app.upload.dir:${user.home}}")
	//private String uploadDir;	


	@Resource
	DbMapper db;
		
	public void fileup2(MultipartFile[] ffs,String[] still,HttpServletRequest request) {
		System.out.println("fileUp 실행해요."+ffs.length);
		String foldername= request.getRealPath("banner");
		File makefolder = new File(foldername);		
		if(!makefolder.exists()) {
			makefolder.mkdir(); 
			System.out.println("존재하지 않으므로 폴더생성.");
		}
		//일단 1~5까지 돌리면서 없는놈만 삭제후 dbUpdate조지기.
		
		//없는놈 갯수를 뽑는다.
		
		
		for (MultipartFile multipartFile : ffs) {
			//foreach보다 다른것이 낫겠다...
			//Path copyOfLocation = Paths.get(uploadDir + File.separator + StringUtils.cleanPath(multipartFile.getOriginalFilename()));
			Path copyOfLocation= Paths.get(foldername+"/"+multipartFile.getOriginalFilename());
			System.out.println("주소 어딘가요."+copyOfLocation);
			BannerDTO bandto= new BannerDTO();
			

			System.out.println("1");
			System.out.println("2");
			
			//.movieimgin(imgdto);
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
