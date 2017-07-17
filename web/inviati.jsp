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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Messaggi Inviati</title>
</head>
<body>
<div class="container">

    <hr />
    <div class="row">
        <div class="col-sm-3 col-md-2">
            <a href="/nuovo.do" class="btn btn-danger btn-sm btn-block" role="button">Scrivi</a>
            <hr />
            <ul class="nav nav-pills nav-stacked">
                <li><a href=/ricevuti.do>Email Ricevute</a></li>
                <li class="active"><a href="#"><span class="badge pull-right">42</span>Email Inviate</a></li>
                <li>
                    <button type="button" onclick="history.go()" class="btn btn-default" data-toggle="tooltip" title="Refresh">
                           <span class="glyphicon glyphicon-refresh"></span>   
                    </button>
                </li>
            </ul>
        </div>

        <div class="col-sm-9 col-md-8">
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">ciao${a.destinatario}</a>
                            <a href="/nuovo.do">
                                <span class="glyphicon glyphicon-send"></span>
                            </a>
                        </h4>
                    </div>
                    <div id="collapse1" class="panel-collapse collapse in">
                        <div class="panel-body"><b>a.oggetto</b><br>
                            <i>a.testo</i>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">${a.mittente}</a>
                            <a href="/nuovo.do">
                                <span class="glyphicon glyphicon-send"></span>
                            </a>
                        </h4>
                    </div>
                    <div id="collapse2" class="panel-collapse collapse in">
                        <div class="panel-body"><b>a.oggetto</b><br>
                            <i>a.testo</i>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
</div>
</body>
</html>