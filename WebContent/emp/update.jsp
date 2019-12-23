<%@page import="kr.co.acorn.dto.MemberDto"%>
<%@page import="kr.co.acorn.dao.MemberDao"%>
<%@ page pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String phone = request.getParameter("phone");
	String tempPage = request.getParameter("page");
	
	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = new MemberDto(name, email, password, phone, null);
	boolean isSuccess = dao.update(dto);
	if (isSuccess) {
%>
<script>
	alert('회원정보가 수정되었습니다.');
	location.href= "view.jsp?page= <%=tempPage%> & email= <%=email%>";
</script>
<%
	} else {
%>
<script>
	alert('DB Error');
	history.back(-1);
</script>
<%
	}
%>

