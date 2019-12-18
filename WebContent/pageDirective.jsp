<%-- pageDirective.jsp --%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar" %>
<%@ page contentType = "text/html;charset=utf-8" %>
<%@ page pageEncoding = "utf-8"%>
<%@ page session="true" %>
<%@ page buffer = "10kb" %>
<%@ page autoFlush = "true" %>
<%@ page isThreadSafe = "true" %>
<%@ page info ="jsp 페이지 입니다." %>
<%@ page errorPage = "/error/error.jsp" %>
<%@ page isELIgnored = "false" %> <%-- $표현 쓸꺼냐 --%> 

<%
	Calendar c = Calendar.getInstance(); //Ctrl+Space도 가능
	SimpleDateFormat s = new SimpleDateFormat();
	
	session.setAttribute("aa", "aa");
	
	//int a = Integer.parseInt("123a");
	String id = request.getParameter("id");
	out.println(id);
	
	
%>
${param.id }

