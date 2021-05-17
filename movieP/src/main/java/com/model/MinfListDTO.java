package com.model;

import java.util.List;

import lombok.Data;

@Data
public class MinfListDTO {
	List<MovieInfoDTO> movielist;
	MovieInfoDTO midto;
	MinfoPageDTO mpdto;
	String posterurl;
}
