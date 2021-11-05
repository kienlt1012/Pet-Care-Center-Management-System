package com.petcarecenter.security;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.petcarecenter.util.SecurityUtils;

@Component
public class CustomSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
	
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException {
		String targetUrl = determineTargetUrl(authentication);
		if (response.isCommitted()) {
			return;
		}
		redirectStrategy.sendRedirect(request, response, targetUrl);
	}

	public RedirectStrategy getRedirectStrategy() {
		return redirectStrategy;
	}
	
	public void setRedirectStrategy(RedirectStrategy redirectStrategy) {
		this.redirectStrategy = redirectStrategy;
	}
	
	private String determineTargetUrl(Authentication authentication) {
		String url = "";
		List<String> roles = SecurityUtils.getAuthorities();
		if (isAdmin(roles)) {
			url = "/admin";
		} else if (isCustomer(roles)) {
			url = "/customer";
		} else if (isStaff(roles)) {
			url = "/staff";
		} else if (isVet(roles)) {
			url = "/vet";
		}
		return url;
	}
	
	private boolean isAdmin(List<String> roles) {
		if (roles.contains("Admin")) {
			return true;
		}
		return false;
	}
	
	private boolean isCustomer(List<String> roles) {
		if (roles.contains("Customer")) {
			return true;
		}
		return false;
	}
	
	private boolean isStaff(List<String> roles) {
		if (roles.contains("Staff")) {
			return true;
		}
		return false;
	}
	
	private boolean isVet(List<String> roles) {
		if (roles.contains("Vet")) {
			return true;
		}
		return false;
	}
}
