package com.aaron.springconfigserver;

import static java.util.Objects.nonNull;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.config.server.EnableConfigServer;

@EnableConfigServer
@SpringBootApplication
public class SpringConfigServerApplication
{
    public static void main(String[] args)
    {
        if(nonNull(System.getProperty("jasypt.encryptor.password")))
        {
            SpringApplication.run(SpringConfigServerApplication.class, args);
        }
        else
        {
            System.err.println("jasypt.encryptor.password must be set");
        }
    }
}
