<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarUsuario.aspx.cs" Inherits="recetario.AgregarUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label runat="server" ID="Id"/>
            <h1>Register</h1>
            <p>Nombre</p>
            <asp:TextBox runat="server" id="txtNombre" />
            <p>Apellido Paterno</p>
            <asp:TextBox runat="server" ID="txtApaterno" />
            <p>Apellido Materno</p>
            <asp:TextBox runat="server" ID="txtAmaterno" />
            <p>Password:</p>
            <asp:TextBox runat="server" id="txtPassword" TextMode="Password"/> <br /><br />
            <asp:Button runat="server" id="btn_Guardar" Text="Guardar" OnClick="btn_guardar_usuario"/>
            <p>¿Ya tienes cuenta?</p>
            <asp:Button runat="server" id="btn_login" Text="Logear" OnClick="btn_logear_usuario"/>
        </div>
    </form>
</body>
</html>