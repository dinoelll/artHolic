package kr.co.two.main.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class MainConfig {

	@Bean
	public PasswordEncoder getPasswordEncoder() {
		
		
		return new BCryptPasswordEncoder(); // 암호화 인코더를 사용하기위한 빈 등록
	}
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		
		// 기본적인 기능(로그인 페이지로 이동하는것)을 사용하지 않겠다는 빈 등록
		// csrf 토큰 기능을 disable 처리 해 줘야 403(권한 에러)가 생기지 않는다.
		// csrf(Cross Site Request Forgery) *요청을 위조* : 다른 사이트에서 내가 요청하지 않은 내용이 요청되는 해킹 방법(공격 방법)
		// ex) : Fishing 사이트에 들어갔다가 어떤 js 가 받아졌는데, 이게 버튼에 어떤 명령어를 심어 원치않는 동작을 하게 됨
		// 이걸 방지하기 위해 csrf 토큰을 발행해 변조된 페이지 인지 확인하게 된다.
		
		return http.httpBasic().disable().csrf().disable().build(); 
		
	}
}
