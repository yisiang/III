package com.dinero.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.NOT_FOUND)
public class ActNotFoundException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public ActNotFoundException() {
	}
	
	public ActNotFoundException(String msg) {
		super(msg);
	}

}
