<%@page import="java.util.Calendar"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@ page pageEncoding="utf-8"%>
<%@ include file="../inc/header.jsp"%>
<!-- JQuery start-->
<!DOCTYPE html>
<html>
<head>

    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>

	<link rel="stylesheet" href="/css/jquery-ui.min.css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>

    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

    <script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>




 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">

    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>

    <script src="/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>



    <script type='text/javascript'>

    $(function(){

        $('.input-group.date').datepicker({

            calendarWeeks: false,

            todayHighlight: true,

            autoclose: true,

            format: "yyyymmdd",

            language: "kr"

        });

    });

    </script>

</head>
</html>
<!-- JQuery end -->
<%
	int year = Calendar.getInstance().get(Calendar.YEAR);
	int month = Calendar.getInstance().get(Calendar.MONTH);
	int day = Calendar.getInstance().get(Calendar.DAY_OF_MONTH);
	String zero = "0";

	String bcoin = request.getParameter("coin");
	if (bcoin == null) {
		bcoin = "bitcoin";
	}
	String sDate = request.getParameter("startDate");
	String sYear = request.getParameter("startYear");
	if (sYear == null) {
		sYear = year + "";
	}
	String sMonth = request.getParameter("startMonth");
	if (sMonth == null) {
		sMonth = "1";
	}
	String sDay = request.getParameter("startDay");
	if (sDay == null) {
		sDay = "1";
	}
	String eDate = request.getParameter("endDate");
	String eYear = request.getParameter("endYear");
	if (eYear == null) {
		eYear = year + "";
	}
	String eMonth = request.getParameter("endMonth");
	if (eMonth == null) {
		eMonth = month + "";
	}
	String eDay = request.getParameter("endDay");
	if (eDay == null) {
		eDay = day + "";
	}
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
			<h3>Crawling</h3>
			<form name="f" method="post" action="list.jsp">
				<div class="form-group row">
					<label for="no" class="col-sm-3 col-form-label">코인선택</label>
					<div class="form-group col-sm-9">
						<select id="coin" name="coin" class="form-control">
							<option selected>Coin...</option>
							<option value="bitcoin" <%if (bcoin.equals("bitcoin")) {%> <%}%>>비트코인</option>
							<option value="ethereum" <%if (bcoin.equals("ethereum")) {%>
								<%}%>>이더리움</option>
							<option value="xrp" <%if (bcoin.equals("xrp")) {%> <%}%>>리플</option>
							<option value="bitcoin-cash"
								<%if (bcoin.equals("bitcoin-cash")) {%> <%}%>>비트코인캐쉬</option>
							<option value="litecoin" <%if (bcoin.equals("litecoin")) {%>
								<%}%>>라이트코인</option>
						</select>
					</div>
				</div>
				<html>
				<body>
					<script type="text/javascript">
						$(function() {
							$('#datepicker1').datepicker(function() {
								f.submit();
							});
						});
					</script>
					<p>
						시작날짜 : <input type="text" id="datepicker1" />
					</p>
					<p>
						끝날짜 : <input type="text" id="datepicker1" />
					</p>
				</body>
				</html>
				<div class="text-right">
					<button id="searchCoin" class="btn btn-outline-success">검색</button>
				</div>
			</form>

			<script>
				$(function() {
					$("#searchCoin").click(function() {
						f.submit();
					});
				});
			</script>
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
							String url = "https://coinmarketcap.com/currencies/" + bcoin + "/historical-data/?start=" + sDate + "&end="
									+ eDate + "01";

							Document doc = null;
							try {
								doc = Jsoup.connect(url).get();
							} catch (IOException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							Elements elements = doc.select(".cmc-table__table-wrapper-outer table tbody tr");
							for (int i = 0; i < elements.size(); i++) {
								Element trElement = elements.get(i);
						%>
						<tr>
							<td>
								<%
									String date = (trElement.child(0).text()).replaceAll(",", "");
										out.print(date);
								%>
							</td>
							<td>
								<%
									Double open = Double.parseDouble((trElement.child(1).text()).replaceAll(",", ""));
										out.print(open);
								%>
							</td>
							<td>
								<%
									Double high = Double.parseDouble((trElement.child(2).text()).replaceAll(",", ""));
										out.print(high);
								%>
							</td>
							<td>
								<%
									Double low = Double.parseDouble((trElement.child(3).text()).replaceAll(",", ""));
										out.print(low);
								%>
							</td>
							<td>
								<%
									Double close = Double.parseDouble((trElement.child(4).text()).replaceAll(",", ""));
										out.print(close);
								%>
							</td>
							<td>
								<%
									long volume = Long.parseLong((trElement.child(5).text()).replaceAll(",", ""));
										out.print(volume);
								%>
							</td>
							<td>
								<%
									long cap = Long.parseLong((trElement.child(6).text()).replaceAll(",", ""));
										out.print(cap);
								%>
							</td>
						</tr>
						<%
							}
						%>
						<tr>
							<td colspan="6">데이터가 존재하지 않습니다.</td>
						</tr>

					</tbody>
				</table>
			</div>

		</div>
	</div>
</div>
<!-- main end-->
<%-- <html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Date', 'Open', 'High', 'Low', 'Close', 'Volume', 'Market Cap'],
          <%
           for (int i = 0; i < elements.size(); i++) {
				Element trElement = elements.get(i);
				out.println("[" + date, open, high, low, clow, volume, cap + "],");
          
          %>
        ]);

        var options = {
          title: 'Company Performance',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    <div id="curve_chart" style="width: 900px; height: 500px"></div>
  </body>
</html>
 --%>



<!-- main end -->

<%@ include file="../inc/footer.jsp"%>