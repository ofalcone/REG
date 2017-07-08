<%--
  Created by IntelliJ IDEA.
  User: Orlando
  Date: 07/07/2017
  Time: 11:28
  To change this template use File | Settings | File Templates.
--%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Messaggi Inviati</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-9 col-md-10">
            <button type="button" onclick="history.go()" class="btn btn-default" data-toggle="tooltip" title="Refresh">
                   <span class="glyphicon glyphicon-refresh"></span>   
            </button>

            <div class="pull-right">
                <span class="text-muted"><b>1</b>–<b>50</b> of <b>277</b></span>
                <div class="btn-group btn-group-sm">
                    <button type="button" class="btn btn-default">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </button>
                    <button type="button" class="btn btn-default">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <hr />
    <div class="row">
        <div class="col-sm-3 col-md-2">
            <a href="/nuovo.do" class="btn btn-danger btn-sm btn-block" role="button">Scrivi</a>

            <hr />
            <ul class="nav nav-pills nav-stacked">
                <li ><a href="/ricevuti.do">Email Ricevute</a></li>
                </li>
                <li class="active"><a href="#"><span class="badge pull-right">42</span> Inviate </a>


            </ul>
        </div>
        <div class="col-sm-9 col-md-10">
            <div class="tab-content">
                <div class="tab-pane fade in active" id="home">
                    <div class="list-group">
                        <a href="#" class="list-group-item">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox">
                                </label>
                            </div>
                            <span class="glyphicon glyphicon-star-empty"></span><span class="name" style="min-width: 120px;
                                display: inline-block;">Bhaumik Patel</span> <span class="">This is big title</span>
                            <span class="text-muted" style="font-size: 11px;">- Hi hello how r u ?</span> <span
                                class="badge">12:10 AM</span> <span class="pull-right"><span class="glyphicon glyphicon-paperclip">
                                </span></span></a><a href="#" class="list-group-item">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox">
                            </label>
                        </div>
                        <span class="glyphicon glyphicon-star-empty"></span><span class="name" style="min-width: 120px;
                                        display: inline-block;">Bhaumik Patel</span> <span class="">This is big title</span>
                        <span class="text-muted" style="font-size: 11px;">- Hi hello how r u ?</span> <span
                            class="badge">12:10 AM</span> <span class="pull-right"><span class="glyphicon glyphicon-paperclip">
                                        </span></span></a><a href="#" class="list-group-item read">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox">
                            </label>
                        </div>
                        <!-- dentro i messaggi!-->
                        <span class="glyphicon glyphicon-star"></span><span class="name" style="min-width: 120px;
                                                display: inline-block;">Bhaumik Patel</span> <span class="">This is big title</span>
                        <span class="text-muted" style="font-size: 11px;">- Hi hello how r u ?</span> <span
                            class="badge">12:10 AM</span> <span class="pull-right"><span class="glyphicon glyphicon-paperclip">
                                                </span></span></a>
                    </div>
                </div>
                <div class="tab-pane fade in" id="profile">
                    <div class="list-group">
                        <div class="list-group-item">
                            <span class="text-center">This tab is empty.</span>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade in" id="messages">
                    ...</div>
                <div class="tab-pane fade in" id="settings">
                    This tab is empty.</div>
            </div>
        </div>
    </div>
</div>
</body>
</html>