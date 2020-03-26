package cn.edu.seu.letao;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("cn.edu.seu.letao.mapper")
public class LetaoApplication {
    public static void main(String[] args) {
        SpringApplication.run(LetaoApplication.class, args);
    }
}
