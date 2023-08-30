package com.dinero.util;

public class DineroException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public DineroException() {
		super();
	}

	public DineroException(String message) {
		super(message);
		
	}

	public DineroException(Throwable cause) {
		super(cause);
	}
	
	
	
}
