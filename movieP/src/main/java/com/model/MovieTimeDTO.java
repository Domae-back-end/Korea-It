package com.model;

import java.util.Date;

import lombok.Data;

@Data
public class MovieTimeDTO {

	Integer m_index;
	String movietitle,sectorno,starttime1,reg_date1;
	Date starttime,endtime,reg_date;
}
