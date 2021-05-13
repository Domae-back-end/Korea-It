package com.model;

import java.util.Date;

import lombok.Data;

@Data
public class MovieTimeDTO {

	Integer m_index,sectorno;
	String movietitle;
	Date starttime,endtime,reg_date;
}
