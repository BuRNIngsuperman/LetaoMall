package cn.edu.seu.letao.controller.mall;

import cn.edu.seu.letao.common.Constants;
import cn.edu.seu.letao.common.ServiceResultEnum;
import cn.edu.seu.letao.entity.UsrAccount;
import cn.edu.seu.letao.entity.UsrUser;
import cn.edu.seu.letao.service.mall.IUsrUserService;
import cn.edu.seu.letao.util.MD5Util;
import cn.edu.seu.letao.util.PageResult;
import cn.edu.seu.letao.util.Result;
import cn.edu.seu.letao.util.ResultGenerator;
import com.google.code.kaptcha.util.Config;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.Properties;
import cn.edu.seu.letao.controller.vo.*;


@Controller
public class IndexController {

    @Autowired
    IUsrUserService usrUserService;


    @GetMapping({"/index", "/", "/index.html"})
    public String indexPage() {

        return "mall/index";
    }

    @GetMapping({"/login","/user_login.html"})
    public String loginPage() {
        return "mall/user_login";
    }

    @GetMapping({"/register","/user_register.html"})//响应跳转注册页面
    public String registerPage() {
        return "mall/user_register";
    }

    @PostMapping("/login")
    @ResponseBody
    public Result login(@RequestParam("loginName") String loginName,
                        @RequestParam("verifyCode") String verifyCode,
                        @RequestParam("password") String password,
                        HttpSession httpSession) {
        if (StringUtils.isEmpty(loginName)) {
            return ResultGenerator.genFailResult(ServiceResultEnum.LOGIN_NAME_NULL.getResult());
        }
        if (StringUtils.isEmpty(password)) {
            return ResultGenerator.genFailResult(ServiceResultEnum.LOGIN_PASSWORD_NULL.getResult());
        }
        if (StringUtils.isEmpty(verifyCode)) {
            return ResultGenerator.genFailResult(ServiceResultEnum.LOGIN_VERIFY_CODE_NULL.getResult());
        }
        String kaptchaCode = httpSession.getAttribute(Constants.MALL_VERIFY_CODE_KEY) + "";
        if (StringUtils.isEmpty(kaptchaCode) || !verifyCode.equals(kaptchaCode)) {
            return ResultGenerator.genFailResult(ServiceResultEnum.LOGIN_VERIFY_CODE_ERROR.getResult());
        }
        String loginResult = usrUserService.login(loginName, MD5Util.MD5Encode(password, "UTF-8"), httpSession);
        //登录成功
        if (ServiceResultEnum.SUCCESS.getResult().equals(loginResult)) {
            return ResultGenerator.genSuccessResult();
        }
        //登录失败
        return ResultGenerator.genFailResult(loginResult);
    }



    @PostMapping({"/register"})//响应注册按钮
    @ResponseBody
    public Result register(@RequestParam("loginName") String loginName,
                           @RequestParam("verifyCode") String verifyCode,
                           @RequestParam("password") String password,
                           HttpSession httpSession) {
        if (StringUtils.isEmpty(loginName)) {
            return ResultGenerator.genFailResult(ServiceResultEnum.LOGIN_NAME_NULL.getResult());
        }
        if (StringUtils.isEmpty(password)) {
            return ResultGenerator.genFailResult(ServiceResultEnum.LOGIN_PASSWORD_NULL.getResult());
        }
        if (StringUtils.isEmpty(verifyCode)) {
            return ResultGenerator.genFailResult(ServiceResultEnum.LOGIN_VERIFY_CODE_NULL.getResult());
        }
        String kaptchaCode = httpSession.getAttribute(Constants.MALL_VERIFY_CODE_KEY) + "";
        if (StringUtils.isEmpty(kaptchaCode) || !verifyCode.equals(kaptchaCode)) {
            return ResultGenerator.genFailResult(ServiceResultEnum.LOGIN_VERIFY_CODE_ERROR.getResult());
        }


        String registerResult = usrUserService.register(loginName, password);
        //注册成功
        if (ServiceResultEnum.SUCCESS.getResult().equals(registerResult)) {
            return ResultGenerator.genSuccessResult();
        }
        //注册失败
        return ResultGenerator.genFailResult(registerResult);
    }


    @GetMapping("/mall/kaptcha")//生成验证码
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

   // @GetMapping({"/search", "/search.html"})
    @GetMapping("/search/{keyword}")
    public String searchPage(@PathVariable("keyword") String keyword,HttpServletRequest request) {

        SearchGoodsVO searchGoodsVO = new SearchGoodsVO();
        searchGoodsVO.setGoodsId((long)1);
        searchGoodsVO.setGoodsName("HUAWEI Mate 30 4000万超感光徕卡影像");
        searchGoodsVO.setGoodsIntro("OLED全面屏 8GB+128GB 全网通4G版 （罗兰紫）");
        searchGoodsVO.setGoodsCoverImg("/mall/image/mate30-3.png");
        searchGoodsVO.setSellingPrice(4000);
        ArrayList<SearchGoodsVO> pageList = new ArrayList<>();

        PageResult pageResult = new PageResult();
        for (int i = 0;i<10;i++){
            pageList.add(searchGoodsVO);
        }
        pageResult.setList(pageList);
        request.setAttribute("pageResult", pageResult);
        return "mall/goods_search_result";
    }

    @GetMapping("/goods/detail/{goodsId}")
    public String detailPage(@PathVariable("goodsId") Long goodsId, HttpServletRequest request) {

        GoodsDetailVO goodsDetailVO = new GoodsDetailVO();
        goodsDetailVO.setGoodsId((long)1);
        goodsDetailVO.setGoodsName("HUAWEI Mate 30 4000万超感光徕卡影像");
        goodsDetailVO.setGoodsIntro("OLED全面屏 8GB+128GB 全网通4G版 （罗兰紫）");
        goodsDetailVO.setGoodsCoverImg("/mall/image/mate30-3.png");
        goodsDetailVO.setSellingPrice(4000);
        goodsDetailVO.setOriginalPrice(3000);
        goodsDetailVO.setGoodsDetailContent("华为 ！！！");

        request.setAttribute("goodsDetail", goodsDetailVO);
        return "mall/goods_detail";
    }

}
