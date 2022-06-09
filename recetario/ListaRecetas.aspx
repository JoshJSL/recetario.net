<%@ Page AutoEventWireup="true" CodeBehind="ListaRecetas.aspx.cs" Inherits="recetario.ListaRecetas" Language="C#" MasterPageFile="~/maestra.Master" Title="" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="contenido">
  <div>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" OnRowDeleting="Eliminar" OnRowEditing="Editar">
            <Columns>
                <asp:BoundField DataField="id_receta" HeaderText="ID Receta" SortExpression="ID Receta" />
                <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="id_autor" HeaderText="ID Autor" SortExpression="ID Autor" />
                <asp:BoundField DataField="preparacion" HeaderText="Preparación" SortExpression="Preparación" />
                <asp:CommandField HeaderText="Acciones" ShowDeleteButton="true" ShowEditButton="true"/>
            </Columns>
        </asp:GridView>
        </div>
</asp:Content>