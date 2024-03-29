package com.buddi;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;


@SpringBootApplication
@EnableScheduling
public class BuddiApplication {

	public static void main(String[] args) {
		SpringApplication.run(BuddiApplication.class, args);
	}
	
	   //@Profile({"dev", "test"})  //  배포시에는 주석제거
    @Bean
    public ServerEndpointExporter serverEndpointExporter() {
        return new ServerEndpointExporter();
    }

}
