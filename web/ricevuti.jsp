<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Orlando
  Date: 07/07/2017
  Time: 11:28
  To change this template use File | Settings | File Templates.
--%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>



<html>
<head>
    <link rel="stylesheet" type="text/css" href="ricevuti.css">

    <title>Messaggi Ricevuti</title>
</head>
<body>


<div class="container">
    <hr />
    <div class="row">
        <div class="col-sm-3 col-md-2">
            <a href="/nuovo.do" class="btn btn-danger btn-sm btn-block" role="button">Scrivi</a>
            <hr />
            <ul class="nav nav-pills nav-stacked">

                <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                                   url = "jdbc:mysql://localhost/mydb"
                                   user = "root"  password = "ghiaccio"/>

                <sql:query dataSource = "${snapshot}" var = "result">
                    SELECT count(idmessaggio) as countid
                    FROM messaggio,destinatario
                    WHERE FKdestinatario = ${id} AND FKmittente != ${id} AND idmessaggio = FKmessaggio;
                </sql:query>


                <li class="active"><a href="#"><span class="badge pull-right">
                    <c:forEach var = "row" items = "${result.rows}">
                        <c:out value = "${row.countid}"/>
                    </c:forEach>
                </span>

                </span>Email ricevute</a></li>
                <li ><a href="/inviati.do">Email inviate</a></li>
                <li>
                    <button type="button" onclick="history.go()" class="btn btn-default" data-toggle="tooltip" title="Refresh">
                       <span class="glyphicon glyphicon-refresh"></span> 
                          
                    </button>
                </li>
            </ul>
        </div>
        <div class="col-sm-9 col-md-8">
            <div class="panel-group" id="accordion">
                <c:forEach items = "${View}" var = "bean">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#${bean.idmessaggio}-collapse">${bean.mittente}  </a>
                            <fmt:formatDate type = "both"  value = "${bean.datainvio}" />

                            <a href="/nuovo.do" class=" pull-right">
                                <span class="glyphicon glyphicon-send" ></span>
                            </a>
                        </h4>
                    </div>
                    <div id="${bean.idmessaggio}-collapse" class="panel-collapse collapse in">
                        <div class="panel-body"><b>Oggetto:${bean.oggetto}</b><br>
                            <i>${bean.testo}</i>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
      </div>
</div>
</div>
</body>
</html>