package cn.edu.seu.letao.controller.mall;

import com.google.code.kaptcha.util.Config;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.util.Properties;


@Controller
public class IndexController {


    @GetMapping({"/index", "/", "/index.html"})
    public String indexPage(){
        return "mall/index";
    }

    @GetMapping({"/login"})
    public String login(){
        return "mall/user_login";
    }
    @GetMapping({"/register"})
    public String register(){
        return "mall/user_register";
    }


    @GetMapping("/mall/kaptcha")
    public void mallKaptcha(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        com.google.code.kaptcha.impl.DefaultKaptcha newBeeMallLoginKaptcha = new com.google.code.kaptcha.impl.DefaultKaptcha();
        Properties properties = new Properties();
        properties.put("kaptcha.border", "no");
        properties.put("kaptcha.textproducer.font.color", "27,174,171");
        properties.put("kaptcha.noise.color", "20,33,42");
        properties.put("kaptcha.textproducer.font.size", "30");
        properties.put("kaptcha.image.width", "110");
        properties.put("kaptcha.image.height", "40");
        properties.put("kaptcha.session.key", "mallVerifyCode");
        properties.put("kaptcha.textproducer.char.space", "2");
        properties.put("kaptcha.textproducer.char.length", "6");
        Config config = new Config(properties);
        newBeeMallLoginKaptcha.setConfig(config);
        byte[] captchaOutputStream = null;
        ByteArrayOutputStream imgOutputStream = new ByteArrayOutputStream();
        try {
            //生产验证码字符串并保存到session中
            String verifyCode = newBeeMallLoginKaptcha.createText();
            httpServletRequest.getSession().setAttribute("mallVerifyCode", verifyCode);
            BufferedImage challenge = newBeeMallLoginKaptcha.createImage(verifyCode);
            ImageIO.write(challenge, "jpg", imgOutputStream);
        } catch (IllegalArgumentException e) {
            httpServletResponse.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        captchaOutputStream = imgOutputStream.toByteArray();
        httpServletResponse.setHeader("Cache-Control", "no-store");
        httpServletResponse.setHeader("Pragma", "no-cache");
        httpServletResponse.setDateHeader("Expires", 0);
        httpServletResponse.setContentType("image/jpeg");
        ServletOutputStream responseOutputStream = httpServletResponse.getOutputStream();
        responseOutputStream.write(captchaOutputStream);
        responseOutputStream.flush();
        responseOutputStream.close();
    }
}
