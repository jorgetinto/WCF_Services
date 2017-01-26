<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LaboratorioWCF._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<script src="Scripts/Shared/Default.js" type="text/javascript"></script>

<div class="container">
  <h3>Ejercicio 1.</h3>
    <div class="form-group">
      <input type="text" class="form-control" id="result1" placeholder="Respuesta Web Service">
    </div>
    <button onclick="doWork(); return false;" class="btn btn-default">Enviar</button>
</div>
<hr />
<div class="container">
  <h3>Ejercicio 2.</h3>
    <div class="form-group">
      <input type="text" class="form-control" id="squareValue" placeholder="Ingrese un número para multiplicarlo por el mismo">
    </div>
    <button onclick="doSquare(); return false;" class="btn btn-default">Enviar</button>
</div>
<hr />
<div class="container">
  <h3>Ejercicio 3.</h3>
    <div class="form-group">
      <input type="text" class="form-control" id="addValue1" placeholder="Ingrese valor 1">
    </div>
    <div class="form-group">
      <input type="text" class="form-control" id="addValue2" placeholder="Ingrese valor 2">
    </div>
    <div class="form-group">
      <input type="text" class="form-control" id="addValueResult" placeholder="Resultado">
    </div>
    <button onclick="doAddValues(); return false;" class="btn btn-default">Enviar</button>
</div>



<script type="text/javascript">
    function doWork() {
    console.info("Hello");

    $.ajax({
        url: "Service/Service1.svc/DoWork",
        type: "Get",
        dataType: "json",
        success: function (result) {
            //console.info(result);
            $("#result1").val(result);
        }
    });
}

function doSquare() {
    var value = $("#squareValue").val();

    $.ajax({
        url: "Service/Service1.svc/DoSquare",
        type: "POST",
        data: JSON.stringify(value),
        dataType: "json",
        contentType: "application/json",
        success: function (result) {
            console.info(result);
            $("#squareValue").val("El resultado es: " + result);
        }
    });
}

function doAddValues() {
    var addValues = {
        "Value1": $("#addValue1").val(),
        "Value2": $("#addValue2").val()
    };

    $.ajax({
        url: "Service/Service1.svc/DoAddValues",
        type: "POST",
        data: JSON.stringify(addValues),
        dataType: "json",
        contentType: "application/json",
        success: function (result) {
            console.info(result);
            $("#addValueResult").val("El resultado es: " + result);
        },
        error: function (error) {
            console.info("ERROR:")
            console.error(error);
        }
    });
}
</script>
</asp:Content>
