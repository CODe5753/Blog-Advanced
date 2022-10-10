package com.wfc.blogadvanced;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@EnableJpaAuditing
@SpringBootApplication
public class BlogAdvancedApplication {

	public static void main(String[] args) {
		SpringApplication.run(BlogAdvancedApplication.class, args);
	}

}
