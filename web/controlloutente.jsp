<%--
  Created by IntelliJ IDEA.
  User: Orlando
  Date: 27/07/2017
  Time: 22:10
  To change this template use File | Settings | File Templates.
--%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css">


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Controllo utente</title>
</head>
<body>

<div class="col-md-6 col-md-offset-3">

<c:if test="${vendita.controllo == '1'}">
    <form name="form" ng-submit="vm.paziente()" role="form" action="/vendita.do">
        <div class="form-group">
        <label for="cf">Codice fiscale</label>
        <input type="cf" value="${vendita.cf}" name="cf"  class="form-control" ng-model="vm.cf" readonly />
    </div>

        <div class="form-group" ng-class="{ 'has-error': form.firstName.$dirty && form.firstName.$error.required }">
            <label for="name">Nome paziente</label>
            <input type="text" name="name" id="name" class="form-control" ng-model="vm.name" placeholder="es.Mario"
                   data-error="Nome paziente obbligatorio "required />
            <span ng-show="form.name.$dirty && form.name.$error.required" class="help-block"></span>
        </div>
        <div class="form-group" ng-class="{ 'has-error': form.cognome.$dirty && form.cognome.$error.required }">
            <label for="cognome">Cognome paziente</label>
            <input type="text" name="cognome" id="cognome" class="form-control" ng-model="vm.cognome" placeholder="es.Rossi"
                   data-error="Cognome paziente obbligatorio" required />
            <span ng-show="form.cognome.$dirty && form.cognome.$error.required" class="help-block"></span>
        </div>

        <form method="post">
            <div class="form-group form-group-sm">
                <label class="control-label requiredField" for="data">Date<span class="asteriskField"></span>
                </label>
                <div class="input-group">
                    <div class="input-group-addon">
                        <i class="fa fa-calendar">
                        </i>
                    </div>
                    <input class="form-control" id="data" name="date" placeholder="MM/DD/YYYY" type="text"/>
                </div>
            </div>
            <script src="/javascript/datepicker.js"></script>
        </form>

    </form>

    <div class="form-actions">
        <button type="submit"  ng-disabled="form.$invalid || vm.dataLoading" class="btn btn-primary">Registrazione paziente</button>
    </div>
</c:if>
</div>
</body>
</html>
