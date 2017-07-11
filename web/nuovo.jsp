<%--
  Created by IntelliJ IDEA.
  User: Orlando
  Date: 11/07/2017
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<body>
<div class="container">

    <div class="row">
        <div class="col-sm-3 col-md-2">

            <ul class="nav nav-pills nav-stacked">
                <li ><a href="/ricevuti.do"><span class="badge pull-right"></span>Email Ricevute</a></li>
                <li ><a href="/inviati.do"><span class="badge pull-right"></span>Email Inviate</a></li>
                <li>
                    <button type="button" onclick="history.go()" class="btn btn-default" data-toggle="tooltip" title="Refresh">
                           <span class="glyphicon glyphicon-refresh"></span>   
                    </button>
                </li>
            </ul>
        </div>
        <div class="col-sm-5 col-md-6">
            <form name="form" ng-submit="vm.login()" role="form" action="/nuovo.do">

                <div class="form-group" ng-class="{ 'has-error': form.mittente.$dirty && form.mittente.$error.required }">
                    <label for="mittente">Mittente</label>
                    <input type="email" value="${login.user}" name="mittente" id="mittente" class="form-control" ng-model="vm.mittente" readonly />
                </div>
                <div class="form-group" ng-class="{ 'has-error': form.destinatario.$dirty && form.destinatario.$error.required }">
                    <label for="destinatario">Destinatario</label>
                    <input type="email" name="destinatario" id="destinatario" class="form-control" ng-model="vm.destinatario" required/>
                    <span ng-show="form.destinatario.$dirty && form.destinatario.$error.required" class="help-block">Mittente richiesto</span>
                </div>
                <div class="form-group" ng-class="{ 'has-error': form.oggetto.$dirty && form.username.$error.required }">
                    <label for="oggetto">Oggetto</label>
                    <input type="text" name="oggetto" id="oggetto" class="form-control" ng-model="vm.oggetto" required />
                    <span ng-show="form.oggetto.$dirty && form.oggetto.$error.required" class="help-block">Oggetto dell'email richiesto</span>
                </div>
                <div class="form-group">
                    <label for="testo">Testo</label>
                    <textarea cols="50" rows="15" name="testo" id="testo" class="form-control" ng-model="vm.testo"></textarea>
                </div>

                <div class="form-actions">
                    <button type="submit" ng-disabled="form.$invalid || vm.dataLoading" class="btn btn-primary">Login</button>
                </div>

            </form>
        </div>
    </div>
</div>
</body>
</html>