package cn.bgs.itcast;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class HandlerInterceptor1 implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 从request中获取session
        HttpSession session = request.getSession();
        // 从session中获取username
        Object user = session.getAttribute("user");
        // 判断username是否为null
        if(user != null){
            // 如果不为空,则放行
            return true;
        }else{
            // 如果为空则跳转到登录页面
            response.sendRedirect(request.getContextPath() + "/jsps/login.jsp");
            return false;
        }




    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("HandlerInterceptor1...postHandle");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        System.out.println("HandlerInterceptor1...afterCompletion");
    }
}
