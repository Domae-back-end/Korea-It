package com.model;

import java.util.List;

import lombok.Data;

@Data
public class SalesListDTO {
	List<SalesDTO> salist;
	SalesDTO sadto;
	SalesPageDTO pdto;
}
