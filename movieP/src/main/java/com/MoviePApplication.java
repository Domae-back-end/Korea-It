package com;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class MoviePApplication {

	public static void main(String[] args) {
		SpringApplication.run(MoviePApplication.class, args);
	}

}
