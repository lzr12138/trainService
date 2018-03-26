package rml.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpSession;  
  
import rml.model.User;  

public class LoginInterceptor implements HandlerInterceptor {  
	  
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,  
            Object handle) throws Exception {  
          
        HttpSession session =request.getSession();  
        
        //无需登录，允许访问的地址  
        String[] allowUrls =new String[]{"/login","/register"};
        
        //获取请求地址  
        String url =request.getRequestURL().toString();  
          
        //获得session中的用户  
        User user =(User) session.getAttribute("user");  
      
        for (String strUrl : allowUrls) {  
            if(url.contains(strUrl))  
            {  
                return true;  
            }  
        }  
          
        if(user==null)  
        {  
        	response.sendRedirect(request.getContextPath()+"/login.jsp");
        }  
            return true;  
    }  
  
    @Override  
    public void postHandle(HttpServletRequest request,HttpServletResponse response, Object handler,  
            ModelAndView modelAndView) throws Exception {  
          
    }  
  
    @Override  
    public void afterCompletion(HttpServletRequest request,HttpServletResponse response, Object handler, Exception ex)  
            throws Exception {  
          
    }
}  