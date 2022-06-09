<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="recetario.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView runat="server" ID="gridRes" AutoGenerateColumns="true">

            </asp:GridView>
            <hr />
            <asp:GridView runat="server" ID="gridChe" AutoGenerateColumns="true">

            </asp:GridView>
            <hr />
            <asp:GridView runat="server" ID="gridIng" AutoGenerateColumns="true">

            </asp:GridView>
            <hr />
            <asp:GridView runat="server" ID="gridTipo" AutoGenerateColumns="true">

            </asp:GridView>
            <asp:Label runat="server" ID="label"></asp:Label>
        </div>
    </form>
</body>
</html>
