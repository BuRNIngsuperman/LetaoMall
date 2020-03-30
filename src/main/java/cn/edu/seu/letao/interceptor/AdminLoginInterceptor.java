package cn.edu.seu.letao.interceptor;


import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 后台管理系统身份认证拦截器
 */
@Component
public class AdminLoginInterceptor implements HandlerInterceptor {

    //在Controller之前验证用户是否登录
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String url = request.getRequestURI();
        if(url.startsWith("/admin") && request.getSession().getAttribute("loginUser") == null){
            request.getSession().setAttribute("errorMsg","请登录");
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return false;

        }else {
            request.getSession().removeAttribute("errorMsg");
            return true;
        }


    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
