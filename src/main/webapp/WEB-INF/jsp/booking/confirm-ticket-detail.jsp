<%@ page import="team3.meowie.ticket.model.Ticket" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <title>Meowie </title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${contextRoot}/js/updatePrice.js"></script>
    <link href="css/owl.carousel.css" rel="stylesheet" type="text/css" media="all">
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name=""/>
    <script type="application/x-javascript">
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <link href="${contextRoot}/css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${contextRoot}/css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${contextRoot}/css/easy-responsive-tabs.css" rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" type="text/css" href="${contextRoot}/css/zoomslider.css"/>
    <link rel="stylesheet" type="text/css" href="${contextRoot}/css/table-style.css"/>
    <link rel="stylesheet" type="text/css" href="${contextRoot}/css/basictable.css"/>
    <link rel="stylesheet" type="text/css" href="${contextRoot}/css/zoomslider.css"/>
    <link rel="stylesheet" type="text/css" href="${contextRoot}/css/style.css"/>
    <link rel="stylesheet" href="${contextRoot}/css/list.css" type="text/css" media="all"/>
    <link href="${contextRoot}/css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${contextRoot}/css/easy-responsive-tabs.css" rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" type="text/css" href="${contextRoot}/css/zoomslider.css"/>
    <link rel="stylesheet" type="text/css" href="${contextRoot}/css/style.css"/>
    <link href="${contextRoot}/css/font-awesome.css" rel="stylesheet">
    <script type="text/javascript" src="${contextRoot}/js/modernizr-2.6.2.min.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Tangerine:400,700' rel='stylesheet' type='text/css'>
    <link href="http://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <jsp:include page="../layout/LoginModal.jsp"></jsp:include>
</head>
<body>

<div id="demo-1" class="banner-inner">
    <div class="banner-inner-dott">
        <!--/header-w3l-->
        <div class="header-w3-agileits" id="home">
            <div class="inner-header-agile part2">
                <jsp:include page="../layout/NewNav.jsp"></jsp:include>
            </div>

        </div>
        <!--//header-w3l-->
    </div>
</div>
<form method="post" action="${contextRoot}/booking/confirm-ticket/OK">
    <div class="row justify-content-center fa-align-center" style="height:80px;">
        <div class="col-6 text-center">
            <c:forEach items="${tickets}" var="ticket">
                <input type="hidden" name="ticketIdList" value="${ticket.ticketid}" />
                <input type="hidden" name="ticketPriceList" value="${ticket.price}" />

            </c:forEach>
            <div class="col-6 text-center">
                <h3>總金額: <span id="totalAmount">0</span></h3>
            </div>
            <button type="submit" class="btn btn-primary">提交</button>

        </div>
    </div>
    <div class="row d-flex justify-content-center">
        <% int i = 1; %>
        <c:forEach items="${tickets}" var="ticket">
            <div class="col-md-2">
                <div class="card border-primary mb-3" style="max-width: 18rem; margin: 20px; border: 2px black solid;">
                    <div class="card-header">第 <% out.print(i);
                        i++; %> 張票
                    </div>
                    <div class="card-body text-primary">
                        <img src="${contextRoot}/img/${ticket.show.movie.name}.jpg" class="card-img-top"
                             style="max-width: 100%;" alt="...">
                        <p class="card-text">電影名稱: ${ticket.show.movie.name}</p>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">座位: ${ticket.row} - ${ticket.seatNumber}</li>
                            <li class="list-group-item">日期: <span
                                    id="time${ticket.ticketid}">${ticket.show.time}</span></li>
                            <p class="card-text">票價: <span id="ticketPrice_${ticket.ticketid}">${ticket.price}</span>
                            </p>
                            <input type="radio" id="fullTicket_${ticket.ticketid}" name="ticketType_${ticket.ticketid}" value="full" checked data-ticketid="${ticket.ticketid}">
                            <label for="fullTicket_${ticket.ticketid}">全票</label>
                            <input type="radio" id="childTicket_${ticket.ticketid}" name="ticketType_${ticket.ticketid}" value="child" data-ticketid="${ticket.ticketid}">
                            <label for="childTicket_${ticket.ticketid}">兒童票</label>
                        </ul>

                        <script>

                                function updateTotalAmount() {
                                var total = 0;
                                var ticketPriceElements = document.querySelectorAll("[id^='ticketPrice_']");
                                ticketPriceElements.forEach(function(ticketPriceElement) {
                                total += Number(ticketPriceElement.textContent);
                            });
                                document.getElementById('totalAmount').textContent = total;
                            }
                                function updatePrice(ticketId) {
                                var ticketType;
                                if (document.getElementById('fullTicket_' + ticketId).checked) {
                                ticketType = 'full';
                            } else if (document.getElementById('childTicket_' + ticketId).checked) {
                                ticketType = 'child';
                            }
                                fetch('${contextRoot}/tickets/update-price', {
                                method: 'POST',
                                headers: {
                                'Content-Type': 'application/json',
                            },
                                body: JSON.stringify({
                                ticketId: ticketId,
                                ticketType: ticketType
                            }),
                            })
                                .then(function(response) {
                                if (response.ok) {
                                return response.json();
                            } else {
                                throw new Error('Something went wrong ;')
                            }
                            })
                                .then(function(data) {
                                document.getElementById('ticketPrice_' + ticketId).textContent = data.newPrice;
                                updateTotalAmount();
                            })
                                .catch(function(error) {
                                alert(error.message);
                            });
                            }
                        </script>
                        </script>



                        </ul>
                    </div>
                </div>
            </div>
        </c:forEach>
        </script>
        </ul>
    </div>
    </div>
    </div>
    <script>var i = 0;
    var idList = [];</script>
    <c:set var="idList" value=""/>
    <c:forEach items="${tickets}" var="ticket" varStatus="loop">
        <c:set var="idList" value="${idList}${ticket.ticketid}"/>
        <c:if test="${!loop.last}"><c:set var="idList" value="${idList},"/></c:if>
    </c:forEach>
    <script>
        var tickets = document.querySelectorAll("input[name^='ticketType_']");
        tickets.forEach(function (ticket) {
            ticket.addEventListener('change', function () {
                var ticketId = ticket.id.substring(ticket.id.lastIndexOf('_') + 1);
                updatePrice(ticketId);
            });
        });
    </script>
    </div>
    <input type="hidden" name="idList" value="${idList}">
</form>
</body>
</html>
