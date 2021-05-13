package com.model;

import java.util.Date;

import lombok.Data;

@Data
public class MovieTimeDTO {

	Integer m_index;
	String movietitle,sectorno;
	Date starttime,endtime,reg_date;
}
