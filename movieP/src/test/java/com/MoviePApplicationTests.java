package com;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import javax.annotation.Resource;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import com.model.DbMapper;
import com.model.MovieInfoDTO;
import com.model.MovieTimeDTO;

@SpringBootTest
class MoviePApplicationTests {
	
	
	@Resource
	DbMapper mm;
	
	@Test
	void listTest() {
		List<MovieTimeDTO> res = mm.movieTime();
		System.out.println("listTest() : "+res);
		assertNotNull(res);
	}
	
	@Test
	void detailTest() {
		MovieInfoDTO res = mm.movieDetail(1);
		System.out.println("detailTest() : "+res);
		assertNotNull(res);
	}

	@Test
	void insertTest() {
		MovieTimeDTO dto = new MovieTimeDTO();
		mm.insertMovieTime(dto);
		System.out.println("insertTest() : "+dto);
		assertNotNull(dto);
	}
	@Test
	void updateTest() {
		MovieTimeDTO dto = new MovieTimeDTO();
		Object res = mm.updatemovielist(dto);
		System.out.println("updateTest() : "+res);
		assertNotNull(res);
	}
	@Test
	void deleteTest() {
		//MovieTimeDTO dto = new MovieTimeDTO();
		//Object res = mm.deletemovie(dto);
		//System.out.println("deleteTest() : "+res);
		//assertNotNull(res);
	}
	
	
	
	
	
	
	
	
	
	

}
