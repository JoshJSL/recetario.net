<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NuevoIngrediente.aspx.cs" Inherits="recetario.NuevoIngrediente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" OnRowDeleting="Eliminar">
                <Columns>
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="categoria" HeaderText="Categoria" SortExpression="Categoria" />
                    <asp:CommandField HeaderText="Acciones" ShowDeleteButton="true"/>
                </Columns>
            </asp:GridView>

            <h1>New Ingredient Form</h1>
            <p>Name</p>
            <asp:TextBox runat="server" id="txtName" />
            <p>Category</p>
            <asp:TextBox runat="server" id="txtCategory" TextMode="Number" />
            <asp:Button runat="server" id="btn_Guardar" Text="Guardar" OnClick="btn_guardar_ingrediente"/>

        </div>
    </form>
</body>
</html>
