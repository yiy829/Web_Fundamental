<%@ page pageEncoding = "utf-8"%>

<%!
	private String name;
	private String id; // 멤버변수라 private 사용 가능
	
	public int plus(int a, int b){ //메서드도 가능 
		//out.println("a+b"); 여기선 안됌
		return a+b;
	} // 유틸을 만들어서 쓰지 이렇게 직접 메서드를 쓰진 않는다.
%>

<%
	out.println("1 + 2 = "+plus(1,2)); // 많이 쓰임
%><br>

1 + 2 = <%= plus(1,2) %>,<br> <% out.println(plus(1,2)); %><br>
