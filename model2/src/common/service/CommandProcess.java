package common.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// service 클래스가 공통적으로 구현해야 할 인터페이스.
public interface CommandProcess {
	String requestPro(HttpServletRequest request, HttpServletResponse response);
}
