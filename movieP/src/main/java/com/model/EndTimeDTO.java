package com.model;

import java.util.Date;

import lombok.Data;

@Data
public class EndTimeDTO {
	String userid;
	Integer m_index;
	String movietitle;
	String sectorno;
	Date sales_time;
	Date endtime=null;

}
