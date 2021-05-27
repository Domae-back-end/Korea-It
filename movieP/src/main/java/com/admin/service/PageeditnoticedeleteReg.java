package com.admin.service;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.model.AlterDTO;
import com.model.DbMapper;
import com.model.ServiceFullDTO;
import com.model.ServiceNoticePageDTO;

import edu.emory.mathcs.backport.java.util.Arrays;

//Service단
@Service
public class PageeditnoticedeleteReg implements PageeditService {
   

   @Resource
   DbMapper db;
   
   @Override
   public Object execute(Object obj) {
      System.out.println("빈 이름 PageeditnoticedeleteGo 소환됨");
      
      HashMap<String, Object> orimap = (HashMap)obj;
      ServiceNoticePageDTO npDTO = (ServiceNoticePageDTO)orimap.get("npDTO");
      ServiceFullDTO sfDTO = (ServiceFullDTO)orimap.get("sfDTO");
      HttpServletRequest request = (HttpServletRequest)orimap.get("request");
      
      
      
      
      
      String [] arr = request.getParameterValues("checkArr[]");
      System.out.println("삭제할 것: "+Arrays.toString(arr));
      
      
      AlterDTO al = new AlterDTO();   
      al.setMsg("삭제 실패");
      
      int res = 0;
      int noId = 0;
      
      if (arr != null) {            
         for (String i : arr) {
            noId = Integer.parseInt(i);
            sfDTO.setNoticeindex(noId);
            db.noticedelete(sfDTO);
         }
         res = 1;
         al.setMsg("삭제 성공");
      }
      
      System.out.println("결과: "+res);
      

      al.setUrl("/admin/pageedit/noticelist");

      return al;
   }

   
}