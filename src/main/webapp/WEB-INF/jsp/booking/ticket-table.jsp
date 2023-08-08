<%@ page import="team3.meowie.ticket.model.Ticket" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <c:set var="contextRoot" value="${pageContext.request.contextPath}"/>

    <link href="css/owl.carousel.css" rel="stylesheet" type="text/css" media="all">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name=""/>
    <script type="application/x-javascript">
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0); }, false);
        function hideURLbar() {
            window.scrollTo(0, 1);  }
    </script>
    <link href="${contextRoot}/css/bootstrap.css" rel="stylesheet" type="text/css"  media="all"/>
    <link href="${contextRoot}/css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${contextRoot}/css/easy-responsive-tabs.css" rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" type="text/css" href="${contextRoot}/css/zoomslider.css"/>
    <link rel="stylesheet" type="text/css" href="${contextRoot}/css/table-style.css"/>
    <link rel="stylesheet" type="text/css" href="${contextRoot}/css/basictable.css"/>
    <link rel="stylesheet" type="text/css" href="${contextRoot}/css/zoomslider.css" />
    <link rel="stylesheet" type="text/css" href="${contextRoot}/css/style.css" />
    <link rel="stylesheet" href="${contextRoot}/css/list.css" type="text/css" media="all"/>
    <link href="${contextRoot}/css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${contextRoot}/css/easy-responsive-tabs.css" rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" type="text/css" href="${contextRoot}/css/zoomslider.css"/>
    <link rel="stylesheet" type="text/css" href="${contextRoot}/css/style.css"/>
    <link href="${contextRoot}/css/font-awesome.css" rel="stylesheet">
    <script type="text/javascript" src="${contextRoot}/js/modernizr-2.6.2.min.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Tangerine:400,700' rel='stylesheet' type='text/css'>
    <link href="http://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700'  rel='stylesheet' type='text/css'>

    <title>座位表</title>

    <link href="${contextRoot}/css/tickettable.css" rel="stylesheet" type="text/css" media="all"/>
    <script>
        var tickets = [
            <c:forEach var="ticket" items="${tickets}" varStatus="status">
            {
                "ticketId": ${ticket.ticketid},
                "row-seat": `${ticket.row}-${ticket.seatNumber}`,
                "payed": ${ticket.payed},
                "selected": false
            }
            <c:if test="${status.index != tickets.size() - 1}">,
            </c:if>
            </c:forEach>
        ];
        var ticketsJson = JSON.stringify(tickets);
        var parsedTickets = JSON.parse(ticketsJson);
        console.log(parsedTickets);
    </script>
    <style>
        body {
            background-image: linear-gradient(to bottom, #333333, #00A287);
        }

    </style>
</head>
<body>
<div style="min-height: 130px
;border-bottom: #0b0b0b, solid, 2px">
<jsp:include page="../layout/LoginModal.jsp"></jsp:include>
<jsp:include page="../layout/NewNav.jsp"></jsp:include>
</div>
<div class="row">
    <div class="col-lg-8">
<section>
<script src="${contextRoot}/js/bootstrap.js"></script>
<div class="row justify-content-center"><div class="col-md-12 text-center">
    </div></div>
<script>
    var selectedtickeditems = 0;
    var firstrow = null;
    var selectedseatNumbers = [];

    function toggleSeat(row, seat) {
        var seatId = row + "-" + seat;
        var seatElement = document.getElementById("seat-" + seatId);
        var areaElement = document.getElementById("area-" + seatId);
        var selectedTicketsInput = document.getElementById("selectedTicketsInput");
        var ticket = parsedTickets.find(ticket => ticket["row-seat"] === seatId);

        if (ticket.selected) {
            var index = selectedseatNumbers.indexOf(seat);
            if (index !== -1) {
                if (index > 0 && index < selectedseatNumbers.length - 1) {
                    alert("您只能取消選擇在兩端的座位");
                    return;
                }

                seatElement.src = "${contextRoot}/images/icon/seaticon.png";
                areaElement.style.backgroundColor = "#81e798";
                ticket.selected = false;
                selectedtickeditems--;
                selectedseatNumbers.splice(index, 1);
                if (selectedseatNumbers.length === 0) {
                    firstrow = null;
                }
            }
        } else {
            if (selectedtickeditems === 0 || (row === firstrow && (seat === selectedseatNumbers[selectedseatNumbers.length - 1] + 1 || seat === selectedseatNumbers[selectedseatNumbers.length - 1] - 1))) {
                if (!ticket.payed) {
                    areaElement.style.backgroundColor = "#f5a623";
                    ticket.selected = true;
                    selectedtickeditems++;
                    firstrow = row;
                    selectedseatNumbers.push(seat);
                    selectedseatNumbers.sort((a, b) => a - b);
                } else {
                    alert("此座位已被訂走");
                }
            } else {
                alert("你只能選擇相鄰的座位");
            }
        }

        selectedTicketsInput.value = JSON.stringify(parsedTickets.filter(ticket => ticket.selected).map(ticket => ticket.ticketId));
        console.log(selectedTicketsInput.value);
    }

    document.getElementById('bookingForm').addEventListener('submit', function(event) {
        if (selectedtickeditems === 0) {
            event.preventDefault();
            alert('請選擇座位再進行提交');
        }
    });
</script>
<div class="inner-header-agile">
</div>

<h4 >螢幕方向<br><hr></h4>
<% for (int rowler = 1; rowler <= 15; rowler++) {%>
<div class="row-custom" style="justify-content: center;justify-self: auto;height:65px;">
    <% for (int seat = 1; seat <= 10; seat++) { %>
    <div style="border: 1px solid black;margin: 5px; padding:5px; background-color:#81e798;justify-content: center;justify-self: auto;display:none;"
         id="area-<%out.print(rowler+"-"+seat);%>" onclick="toggleSeat(<%out.print(rowler);%>, <%out.print(seat);%>)">
        <img src="${contextRoot}/images/icon/seaticon.png" style="width: 40px;height: auto;"
             id="seat-<%out.print(rowler+"-"+seat);%>">
        <span style="align-self: end;font-size:18px;"><%out.print(rowler + "-" + seat);%></span>
    </div>
    <%} %>
</div>
<%} %>
<c:forEach var="ticket" items="${tickets}">
    <script>
        <c:if test="${ticket.payed==false}">
        document.getElementById("area-${ticket.row}-${ticket.seatNumber}").style = "width:100px;height : 55px;border: 1px solid black;margin: 5px; padding:5px; background-color:#81e798;justify-content: center;justify-self: auto;display:block;";
        </c:if>
        <c:if test="${ticket.payed==true}">
        document.getElementById("area-${ticket.row}-${ticket.seatNumber}").style = "width:100px;height : 55px;border: 1px solid black;margin: 5px; padding:5px; background-color:#ff0000;justify-content: center;justify-self: auto;display:block;";
        </c:if>
    </script>
    <c:if test="${ticket.payed==true}">
        <script>
            document.getElementById("seat-${ticket.row}-${ticket.seatNumber}").src = "${contextRoot}/images/icon/seaticon-disable.png";
            document.getElementById("area-${ticket.row}-${ticket.seatNumber}").style = "width:100px;height : 55px;border: 1px solid black;margin: 5px; padding:5px; background-color:#ff6666;justify-content: center;justify-self: auto;display:block";
            console.log(document.getElementById("area-${ticket.row}-${ticket.seatNumber}"));
        </script>
    </c:if>
</c:forEach>
    </div>

<div class="col-lg-4">
<div style="text-align:center; margin: 0 auto;">
    <form id="bookingForm" method="post" action="${contextRoot}/booking/confirm-ticket">
        <input type="hidden" name="selectedTickets" id="selectedTicketsInput">
        <button type="submit" class="btn btn-primary">確認預定</button>
    </form>
    <h3 style="color:#dddddd; text-align: left" >電影名稱:${show.movie.name}</h3>
    <h3 style="color:#dddddd;text-align: left">電影時間:${show.time}</h3>
    <h3 style="color:#dddddd;text-align: left">電影廳:${show.cinema}</h3>
    <img src="${contextRoot}/img/${show.movie.name}.jpg" style="width: 70%; height: auto; float: left;">

</div>
</div>
</div>
</section>
</body>
</html>
