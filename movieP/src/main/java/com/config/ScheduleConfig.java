package com.config;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.admin.service.DailysaleAuto;
import com.admin.service.Provider;

@Component
public class ScheduleConfig {
	
	
	@Resource
	Provider pr;

	@Resource
	DailysaleAuto dailysaleAuto;

	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	
	@Scheduled(cron="0 0 5 * * *")
	
	public void sample1() {
		//logger.info("월매출표 update");
		dailysaleAuto.dailysaleDo();
		
		
		
		
		
		
	}
}
