package kr.co.two.main.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component // service 이전에 있던 것, service 라고 하기에는 애매한 class 에 붙여준다.
public class LoginCheck implements HandlerInterceptor{
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	// preHandler : Controller 전에 이곳을 지나친다.
	// true : Controller 접근 허용 / false : Controller 접근 불가
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("pre Handler!! :"+request.getRequestURI());
		
		boolean pass = true;
		
		HttpSession session = request.getSession();
		if(session.getAttribute("loginId") == null ) {
			response.sendRedirect("/");
			pass = false;
		}
		
		return pass;
	}

	// postHandler : Controller 를 지나간 이후에 이곳에 들린다.
	// request / response 객체에 추가로 무언가 담을 때
	// ***ModelAndView 에 무언가 추가할 때
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView mav) throws Exception {
		logger.info("post Handler!");
		
		String loginId = (String)request.getSession().getAttribute("loginId");
		String content = "<div>안녕하세요 "+loginId+" 님<a href='logout.do'>로그아웃</a></div>";
		
		mav.addObject("loginBox",content);
	}

}
