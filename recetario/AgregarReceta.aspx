<%@ Page AutoEventWireup="true" CodeBehind="AgregarReceta.aspx.cs" Inherits="recetario.AgregarReceta" Language="C#" MasterPageFile="~/maestra.Master" Title="" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="contenido">
    <div>
            <h1>New Recipe Form</h1>
            <p>Id Receta</p>
            <asp:TextBox runat="server" id="txtId" />
            <p>Id Chef</p>
            <asp:TextBox runat="server" ID="txtIdChef" />
            <p>Name:</p>
            <asp:TextBox runat="server" id="txtName" />
            <p>Ingredients:</p>
            Categoria
            <asp:DropDownList ID="categoria" runat="server" OnSelectedIndexChanged="sel_cat" AutoPostBack="true"
>
                <asp:ListItem Value="Categoria"></asp:ListItem>
            </asp:DropDownList>
            Ingrediente
            <asp:DropDownList ID="ingredientes" runat="server">
                <asp:ListItem Value=""></asp:ListItem>
            </asp:DropDownList>
            <p>Measure</p>
            <asp:TextBox runat="server" ID="txtMeasure" />
            <p>Quantity</p>
            <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" />
            <p>Preparación</p>
            <asp:TextBox runat="server" ID="txtPreparacion" />
            <asp:Label Text="text" runat="server" id="lbl"/>
            <asp:Button runat="server" id="btn_Guardar" Text="Guardar" OnClick="btn_guardar_receta"/>
        </div>
</asp:Content>