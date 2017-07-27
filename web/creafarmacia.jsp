<c:if test="${session.role != 'REG'}">
<script languaguage="javascript">
  window.location = "/accessdenied.jsp";
</script>
</c:if>
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
    <link rel="stylesheet" type="text/css" href="CSS/inviati.css">

    <title>Creazione nuova farmacia</title>
</head>
<body>

<div class="col-md-6 col-md-offset-3">
    <h2>Nuova farmacia</h2>
    <form name="form" ng-submit="vm.creafarmacia()" role="form" method="post" action="/creafarmacia.do">

        <div class="form-group" ng-class="{ 'has-error': form.nomeTF.$dirty && form.nomeTF.$error.required }">
            <label for="nomeTF">Nome</label>
            <input type="text" name="nomeTF" id="nomeTF" class="form-control" ng-model="vm.nomeTF" required />
            <span ng-show="form.nomeTF.$dirty && form.nomeTF.$error.required" class="help-block"></span>
        </div>
        <div class="form-group" ng-class="{ 'has-error': form.cognomeTF.$dirty && form.cognomeTF.$error.required }">
            <label for="cognomeTF">Cognome</label>
            <input type="text" name="cognomeTF" id="cognomeTF" class="form-control" ng-model="vm.cognomeTF" required />
            <span ng-show="form.cognomeTF.$dirty && form.cognomeTF.$error.required" class="help-block"></span>
        </div>
        <div class="form-group" ng-class="{ 'has-error': form.emailTF.$dirty && form.emailTF.$error.required }">
            <label for="emailTF">Email</label>
            <input type="emailTF" name="emailTF" id="emailTF" class="form-control" ng-model="vm.emailTF" required />
            <span ng-show="form.emailTF.$dirty && form.emailTF.$error.required" class="help-block"></span>
        </div>
        <div class="form-group" ng-class="{ 'has-error': form.password.$dirty && form.password.$error.required }">
            <label for="password">Password</label>
            <input type="password" name="password" id="password" class="form-control" ng-model="vm.password" required />
            <span ng-show="form.password.$dirty && form.password.$error.required" class="help-block"></span>
        </div>

        <div class="form-group" ng-class="{ 'has-error': form.nome.$dirty && form.nome.$error.required }">
            <label for="nome">Nome farmacia</label>
            <input type="text" name="nome" id="nome" class="form-control" ng-model="vm.nome" required />
            <span ng-show="form.nome.$dirty && form.nome.$error.required" class="help-block"></span>
        </div>

        <div class="form-group" ng-class="{ 'has-error': form.indirizzo.$dirty && form.indirizzo.$error.required }">
            <label for="indirizzo">Indirizzo</label>
            <input type="text" name="indirizzo" id="indirizzo" class="form-control" ng-model="vm.indirizzo" required />
            <span ng-show="form.indirizzo.$dirty && form.indirizzo.$error.required" class="help-block"></span>
        </div>

        <div class="form-group" ng-class="{ 'has-error': form.telefono.$dirty && form.telefono.$error.required }">
            <label for="telefono">Telefono</label>
            <input type="text" name="telefono" id="telefono" class="form-control" ng-model="vm.telefono" required />
            <span ng-show="form.telefono.$dirty && form.telefono.$error.required" class="help-block"></span>
        </div>

        <div class="form-actions">
            <button type="submit" ng-disabled="form.$invalid || vm.dataLoading" class="btn btn-primary">Crea Farmacia</button>
        </div>

    </form>
</div>



</body>
</html>