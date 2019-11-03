package com.wework.workman.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.wework.workman.mypage.model.vo.Mypage;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		 HttpSession session = request.getSession(); 
		 Mypage loginMan = (Mypage)session.getAttribute("loginMan");
		 
		 if(loginMan == null){
			 //session.setAttribute("error", "로그인 후 이용하세요.");
			 request.setAttribute("error", "로그인 후 이용하세요.");
			 request.getRequestDispatcher("/index.jsp").include(request, response);
			 return false;
		 }
		 
		return true;
		
//		if(session == null) {
//			session.setAttribute("error", "로그인 후 이용하세요.");
//			response.sendRedirect("loginPage.wo"); 
//			return false;
//		}else {
//			Mypage loginMan = (Mypage)session.getAttribute("loginMan");
//			if(loginMan == null) {
//				session.setAttribute("error", "로그인 후 이용하세요.");
//				response.sendRedirect("loginPage.wo"); 
//				return false;
//			}
//		}
//		 
//		 return true;

	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}

}
