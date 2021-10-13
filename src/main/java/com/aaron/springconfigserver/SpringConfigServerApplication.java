package com.aaron.springconfigserver;

import java.io.IOException;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.config.server.EnableConfigServer;

@EnableConfigServer
@SpringBootApplication
public class SpringConfigServerApplication
{
    public static void main(String[] args) throws IOException
    {
        if(args.length >= 1)
        {
            System.setProperty("jasypt.encryptor.password", args[0]);
            SpringApplication.run(SpringConfigServerApplication.class, args);
        }
        else
        {
            System.err.println("Jasypt password required as java args[0]");
        }
    }
}
