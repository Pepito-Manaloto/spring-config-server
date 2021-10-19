package com.aaron.springconfigserver;

import static java.util.Objects.nonNull;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.config.server.EnableConfigServer;

@EnableConfigServer
@SpringBootApplication
public class SpringConfigServerApplication
{
    private static final String JASYPT_PASSWORD_PROPERTY = "jasypt.encryptor.password";

    public static void main(String[] args)
    {
        if(nonNull(System.getProperty(JASYPT_PASSWORD_PROPERTY)))
        {
            SpringApplication.run(SpringConfigServerApplication.class, args);
        }
        else
        {
            System.err.println(JASYPT_PASSWORD_PROPERTY + " must be set"); //NOSONAR
        }
    }
}
