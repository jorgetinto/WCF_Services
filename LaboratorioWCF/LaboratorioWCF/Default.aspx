<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LaboratorioWCF._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <button onclick="doWork(); return false;">DoWork</button>
        <button onclick="doSquare(); return false;">DoSquare</button>
        <input type="text" id="squareValue"/>
        <button onclick="doAddValues(); return false;">DoAddValues</button>
        <input type="text" id="addValue1" style="width:100px;"/>
        <input type="text" id="addValue2" style="width:100px;"/>
    </div>   

    <script type="text/javascript">
        function doWork() {
            console.info("Hello");

            $.ajax({
                url: "Service/Service1.svc/DoWork",
                type: "Get",
                dataType: "json",
                success: function (result) {
                    console.info(result);
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
                },
                error: function (error) {
                    console.info("ERROR:")
                    console.error(error);
                }
            });
        }
    </script>
</asp:Content>
