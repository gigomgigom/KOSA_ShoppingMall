package com.mycompany.javajavajo.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		log.info("실패");
		
		//로그인 실패 후 리다이렉트로 이동할 경로 설정
		setDefaultFailureUrl("/auth/signin");
		
		//로그인 실패 후 리다이렉트로 이동할 경로 설정
		super.onAuthenticationFailure(request, response, exception);
	}

}
