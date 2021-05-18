package com.admin.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.regex.Pattern;

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
		System.out.println("BannerfileUp ");
		if(still==null) {
			still= new String[] {};
		}
		
		String foldername= request.getRealPath("banner");
		File makefolder = new File(foldername);		
		if(!makefolder.exists()) {
			makefolder.mkdir(); 
			System.out.println("존재하지 않으므로 폴더생성.");
		}
		// 1~5까지. still에 없는거를 담는다.ArrayList에 ..
		ArrayList<Integer> arr= new ArrayList<>();
		HashMap<String, Object> map= new HashMap<String, Object>();
		
		
		for (int i = 0; i < still.length; i++) {
			arr.add(i, Integer.parseInt(still[i]));			
		}
		System.out.println("변경 안할애들:"+arr);
		int mfindex=0;
		for (int i = 1; i <= ffs.length+ still.length; i++) {
				if(!arr.contains(i)) {
					System.out.println(i+"containimg");
					
					BannerDTO bdto=new BannerDTO();
					bdto.setBannerindex(i);
					MultipartFile newone= ffs[mfindex];
					String url="poster"+i+"."+newone.getOriginalFilename().split("\\.")[1];
					bdto.setImgurl(url);//					
					db.changeBanner(bdto);
					Path copyOfLocation= Paths.get(foldername+"/"+url);
					try {
						Files.copy(newone.getInputStream(), copyOfLocation, StandardCopyOption.REPLACE_EXISTING);
						
						
						
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}					
					mfindex++;
					System.out.println("bdto:" +bdto);
					
				}else {
					System.out.println(i+"그대로간다. not contain");
				}

			
		}
		
		
		// still 이랑. mul이 날라온다.
		
		
		
		
		
		
		
		
		
	
	     
	}
	
}
