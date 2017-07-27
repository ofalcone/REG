<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: Orlando
  Date: 26/07/2017
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css">
<script src="/javascript/datepicker.js"></script>
<script src="javascript/checkPaziente.js"></script>
<script src="javascript/checkRicetta.js"></script>

<input type="hidden" name="code" value="<bean:write name="controllo" property="vendita.controllo"/>" />

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Vendita</title>
    <style>
        #toShow{display: none;}
        #toShow1{display:none;}
    </style>
</head>
<body>
${vendita.controllo}
<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                   url = "jdbc:mysql://localhost/mydb"
                   user = "root"  password = "ghiaccio"/>

<sql:query dataSource = "${snapshot}" var = "result">
    SELECT farmaco.nome,prezzo,qnt,ricetta FROM farmacia, magazzino, farmaco
    WHERE idfarmacia = ${idfarmacia}  AND idfarmacia=magazzino.FKFArmacia AND FKFArmaco=idFarmaco;
</sql:query>

<div class="col-md-6 col-md-offset-3">
    <table id="tablefarmaci" class="table table-striped" data-click-to-select="true">
        <thead>
        <tr>
            <th data-field="state" data-checkbox="true"></th>
            <th>Nome</th>
            <th>Prezzo</th>
            <th>Quantita</th>
            <th>Ricetta</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var = "row" items = "${result.rows}">
        <tr>
            <td class="bs-checkbox"> <input data-index="0" name="btSelectItem" type="checkbox" value="${nome}" >
            <td id="nome"> <c:out  value = "${row.nome}"/></td>
            <td id="prezzo"> <c:out value = "${row.prezzo}"/></td>
            <td id="qnt"> <c:out value = "${row.qnt}"/></td>
            <td> <span class="ricetta"><c:out value = "${row.ricetta}"/></span></td>
        </tr>
        </c:forEach>
    </table>
    <div class="form-actions">
        <button type="submit" onclick="checkRicetta()" ng-disabled="form.$invalid || vm.dataLoading" class="btn btn-primary">Seleziona prodotti</button>
    </div>


<div id="toShow">
    <div class="col-md-6 col-md-offset-3">

    <%--Aggiungo riferimento a ricetta--%>
        <form name="form" ng-submit="vm.paziente()" role="form" action="/vendita.do">
            <div class="form-group" ng-class="{ 'has-error': form.cr.$dirty && form.cr.$error.required }">
                <label for="cr">Codice ricetta</label>
                <input type="text" name="cr" id="cr" class="form-control" ng-model="vm.cr" placeholder="es.12345ABV"
                       data-error="Codice ricetta obbligarorio"required />
                <span ng-show="form.cr.$dirty && form.cr.$error.required" class="help-block"></span>
            </div>

            <form method="post">
                <div class="form-group form-group-sm">
                    <label class="control-label requiredField" for="date">Data ricetta<span class="asteriskField"></span>
                    </label>
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="fa fa-calendar">
                            </i>
                        </div>
                        <input class="form-control" id="date" name="date" placeholder="MM/DD/YYYY" type="text"/>
                    </div>
                </div>

            </form>

            <form name="form" ng-submit="vm.paziente()" role="form" action="/vendita.do">
                <div class="form-group" ng-class="{ 'has-error': form.nomemedico.$dirty && form.nomemedico.$error.required }">
                    <label for="nomemedico">Nominativo medico</label>
                    <input type="text" name="cr" id="nomemedico" class="form-control" ng-model="vm.nomemedico" placeholder="es.Dott.Mario Rossi"
                           data-error="Nominativo del medico obbligatorio"required />
                    <span ng-show="form.nomemedico.$dirty && form.nomemedico.$error.required" class="help-block"></span>
                </div>


                <form name="form" ng-submit="vm.vendita()" role="form" action="/vendita.do">
                    <div class="form-group" ng-class="{ 'has-error': form.firstName.$dirty && form.firstName.$error.required }">
                        <label for="cf">Codice fiscale del paziente</label>
                        <input type="text" pattern="[a-zA-Z]{6}[0-9]{2}[a-zA-Z][0-9]{2}[a-zA-Z][0-9]{3}[a-zA-Z]" name="cf" id="cf" class="form-control" ng-model="vm.cf" placeholder="es.FLCRND..."
                               data-error="Compila questo campo"required />
                        <span ng-show="form.cf.$dirty && form.cf.$error.required" class="help-block"></span>
                    </div>
                    <div class="form-actions">
                        <button type="submit" onclick="myControl()" ng-disabled="form.$invalid || vm.dataLoading" class="btn btn-primary">Controllo CF</button>
                    </div>
                </form>

 <%--<div id="toShow1">--%>
                <%--Aggiungo il paziente--%>
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
                                <label class="control-label requiredField" for="date">Date<span class="asteriskField"></span>
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

</form>
</form>
<%--</div>--%>
</div>
</div>
</div>

</body>
</html>