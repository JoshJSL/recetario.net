<%@ Page AutoEventWireup="true" CodeBehind="NuevoIngrediente.aspx.cs" Inherits="recetario.NuevoIngrediente" Language="C#" MasterPageFile="~/maestra.Master" Title="" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="contenido">
<div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDeleting="Eliminar">
                <Columns>
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="categoria" HeaderText="Categoria" SortExpression="Categoria" />
                    <asp:CommandField HeaderText="Acciones" ShowDeleteButton="true"/>
                </Columns>
            </asp:GridView>

            <h1>New Ingredient Form</h1>
            <p>Name</p>
            <asp:TextBox runat="server" id="TextBox1" />
            <p>Category</p>
            <asp:TextBox runat="server" id="TextBox2" TextMode="Number" />
            <asp:Button runat="server" id="Button1" Text="Guardar" OnClick="btn_guardar_ingrediente"/>

        </div>
</asp:Content>