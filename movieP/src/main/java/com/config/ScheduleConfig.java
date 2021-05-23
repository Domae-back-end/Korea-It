package com.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class ScheduleConfig {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Scheduled(cron="0 0 5 * * *")
	//자바 크론식
	// 초 분 시 일 월 요일 연도
	public void sample1() {
		logger.info("50분마다 스케쥴 실행됨");
		logger.info("쉬\n세\n요\n");
	}
}
