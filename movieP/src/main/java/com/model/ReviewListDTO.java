package com.model;

import java.util.List;

import lombok.Data;

@Data
public class ReviewListDTO {
	List<MovieReviewDTO> mrd;
	MoviepageDTO pdto;
	
}
