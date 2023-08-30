package com.dinero.util;

import javax.servlet.http.HttpServletRequest;

public class SiteUtility {
	public static String getSiteURL(HttpServletRequest request) {
		String siteURL = request.getRequestURL().toString();
		return siteURL.replace(request.getServletPath(),"");
	}
}
