<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListaRecetas.aspx.cs" Inherits="recetario.ListaRecetas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDeleting="Eliminar" OnRowEditing="Editar">
            <Columns>
                <asp:BoundField DataField="id_receta" HeaderText="ID Receta" SortExpression="ID Receta" />
                <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="id_autor" HeaderText="ID Autor" SortExpression="ID Autor" />
                <asp:BoundField DataField="preparacion" HeaderText="Preparación" SortExpression="Preparación" />
                <asp:CommandField HeaderText="Acciones" ShowDeleteButton="true" ShowEditButton="true"/>
            </Columns>
        </asp:GridView>
        </div>
    </form>
</body>
</html>
