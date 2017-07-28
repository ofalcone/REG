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



<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Vendita</title>
    <script src="javascript/checkPaziente.js"></script>
</head>
<body>

<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                   url = "jdbc:mysql://localhost/mydb"
                   user = "root"  password = "ghiaccio"/>

<sql:query dataSource = "${snapshot}" var = "result">
    SELECT farmaco.nome,prezzo,qnt,ricetta FROM farmacia, magazzino, farmaco
    WHERE idfarmacia = ${idfarmacia}  AND idfarmacia=magazzino.FKFArmacia AND FKFArmaco=idFarmaco;
</sql:query>

<div class="col-md-6 col-md-offset-3">
    <form  method="post" action="/vendita.do">
    <table id="tablefarmaci" class="table table-striped" data-click-to-select="true">
        <thead>
        <tr>
            <th data-field="state" data-checkbox="true"></th>
            <th>Nome</th>
            <th>Prezzo</th>
            <th>Quantita</th>
            <th></th>
            <th>Ricetta</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var = "row" items = "${result.rows}">
        <tr>
            <td> <input class="bs-checkbox" name="elencoprodotti[]" type="checkbox" value="${row.nome};0" >
            <td id="nome">              <c:out  value = "${row.nome}"/></td>
            <td id="prezzo">            <c:out value = "${row.prezzo}"/></td>
            <td id="qnt">               <c:out value = "${row.qnt}"/></td>
            <td><input type="number" name="qntnuova" value="0" min="0"></td>
            <td><span class="ricetta">  <c:out value ="${row.ricetta}"/></span></td>
        </tr>
        </c:forEach>
    </table>
    <div class="form-actions">
        <button type="submit" class="btn btn-primary">Seleziona prodotti</button>
    </div>
    </form>



</div>
</body>
</html>