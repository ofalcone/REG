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

    <form name="form" ng-submit="vm.vendita()" role="form" action="/vendita.do">
        <div class="form-group" ng-class="{ 'has-error': form.firstName.$dirty && form.firstName.$error.required }">
            <label for="cf">Codice fiscale del paziente</label>
            <input type="text" pattern="[a-zA-Z]{6}[0-9]{2}[a-zA-Z][0-9]{2}[a-zA-Z][0-9]{3}[a-zA-Z]" name="cf" id="cf" class="form-control" ng-model="vm.cf" placeholder="es.FLCRND..."
                   data-error="Compila questo campo"required />
            <span ng-show="form.cf.$dirty && form.cf.$error.required" class="help-block"></span>
        </div>
    </form>

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

        <div class="form-group" ng-class="{ 'has-error': form.cr.$dirty && form.cr.$error.required }">
            <label for="cr">Codice ricetta</label>
            <input type="text" name="cr" id="cr" class="form-control" ng-model="vm.cr" placeholder="es.12345ABV"
                   data-error="Codice ricetta obbligarorio"required />
            <span ng-show="form.cr.$dirty && form.cr.$error.required" class="help-block"></span>
        </div>


        <div class="form-group" ng-class="{ 'has-error': form.nomemedico.$dirty && form.nomemedico.$error.required }">
            <label for="nomemedico">Nominativo medico</label>
            <input type="text" name="cr" id="nomemedico" class="form-control" ng-model="vm.nomemedico" placeholder="es.Dott.Mario Rossi"
                   data-error="Nominativo del medico obbligatorio"required />
            <span ng-show="form.nomemedico.$dirty && form.nomemedico.$error.required" class="help-block"></span>
        </div>

    </form>

    <div class="form-actions">
        <button type="submit"  ng-disabled="form.$invalid || vm.dataLoading" class="btn btn-primary">Registrazione paziente</button>
    </div>
</div>
</body>
</html>
