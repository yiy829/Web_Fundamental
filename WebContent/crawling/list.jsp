<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.FileWriter"%>

<%@ page pageEncoding="utf-8"%>
<%@ include file="../inc/header.jsp"%>

<%
FileWriter fw = null;
BufferedWriter bw = null;
PrintWriter pw = null;
String url = "https://coinmarketcap.com/currencies/bitcoin/historical-data/?start=20171101&end=20191203";
Document doc = null;
try {
	doc = Jsoup.connect(url).get();
} catch (IOException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

Elements elements = doc.select(".cmc-table__table-wrapper-outer table tbody tr");

%>
<!-- breadcrumb start-->
<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">Home</a></li>
		<li class="breadcrumb-item active" aria-current="page">Library</li>
	</ol>
</nav>
<!-- breadcrumb end-->
<!-- main start -->
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<h3>
				Crawling
			</h3>
			<div class="table-responsive-lg">
				<table class="table table-hover">
					<colgroup>
						<col width="10%" />
						<col width="15%" />
						<col width="15%" />
						<col width="15%" />
						<col width="15%" />
						<col width="15%" />
						<col width="15%" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">Date</th>
							<th scope="col">Open</th>
							<th scope="col">High</th>
							<th scope="col">Low</th>
							<th scope="col">Close</th>
							<th scope="col">Volume</th>
							<th scope="col">Market Cap</th>
						</tr>
					</thead>
					<tbody>
					<%
					for (int i = 0; i < elements.size(); i++) {
						Element trElement = elements.get(i);
					%>
					<tr>
						<td><%String date = (trElement.child(0).text()).replaceAll(",",""); out.print(date);%></td>
						<td><%Double open = Double.parseDouble((trElement.child(1).text()).replaceAll(",",""));%></td>
						<td><%Double high = Double.parseDouble((trElement.child(2).text()).replaceAll(",",""));%></td>
						<td><%Double low = Double.parseDouble((trElement.child(3).text()).replaceAll(",",""));%></td>
						<td><%Double close = Double.parseDouble((trElement.child(4).text()).replaceAll(",",""));%></td>
						<td><%long volume = Long.parseLong((trElement.child(5).text()).replaceAll(",",""));%></td>
						<td><%long cap = Long.parseLong((trElement.child(6).text()).replaceAll(",",""));%></td>
					</tr>
						<%
					}%>
						<tr>
							<td colspan="6">데이터가 존재하지 않습니다.</td>
						</tr>

					</tbody>
				</table>

				<%-- <nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<%
							if (currentBlock == 1) {
						%>
						<li class="page-item disabled"><a class="page-link" href="#"
							tabindex="-1" aria-disabled="true">Previous</a></li>
						<%
							} else {
						%>
						<li class="page-item"><a class="page-link"
							href="list.jsp?page=<%=startPage - 1%>">Previous</a></li>
						<%
							}
						%>
						<%
							for (int i = startPage; i <= endPage; i++) {
						%>
						<li class="page-item <%if (cPage == i) {%>active<%}%>"><a
							class="page-link" href="list.jsp?page=<%=i%>"><%=i%></a></li>
						<%
							}
						%>
						<%
							if (currentBlock == totalBlock) {
						%>
						<li class="page-item disabled"><a class="page-link" href="#"
							tabindex="-1" aria-disabled="true">Next</a></li>
						<%
							} else {
						%>
						<li class="page-item"><a class="page-link"
							href="list.jsp?page=<%=endPage + 1%>">Next</a></li>
						<%
							}
						%>
					</ul>
				</nav> --%>
			</div>
			<div class="form-group col-md-4">
      <label for="inputState">State</label>
      <select id="inputState" class="form-control">
        <option selected>Choose...</option>
        <option>...</option>
      </select>
    </div>
		</div>
	</div>
</div>
<!-- main end -->
<%@ include file="../inc/footer.jsp"%>