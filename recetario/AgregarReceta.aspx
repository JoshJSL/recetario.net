<%@ Page AutoEventWireup="true" CodeBehind="AgregarReceta.aspx.cs" Inherits="recetario.AgregarReceta" Language="C#" MasterPageFile="~/maestra.Master" Title="" %>
<asp:Content    id="casd" runat="server" ContentPlaceHolderID="head">
    <style>
        .preparacion{
            resize:none;
            width:100%;
            height:300px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="contenido">
    <div>
        <asp:Label runat="server" ID="titulo"><h1>New Recipe Form</h1></asp:Label>
        <asp:Label runat="server" ID="msg" />
        <br />

            <asp:Label runat="server" ID="idRec" Text  =""></asp:Label>
            <p>Name:</p>
            <asp:TextBox runat="server" id="txtName" />
            <p>Ingredients:</p>
        <asp:Table id="ingTab" runat="server"
        GridLines="Both"
        CellPadding="10"
        CellSpacing="5"
        >
            <asp:TableHeaderRow runat="server">
            <asp:TableHeaderCell Text="Categoria" />
            <asp:TableHeaderCell Text="Ingrediente" />
            <asp:TableHeaderCell Text="Cantidad" />
            <asp:TableHeaderCell Text="Acción" Width="10%"/>
        </asp:TableHeaderRow >   
        
        </asp:Table>
        <br />

        <asp:DropDownList ID="categorias" runat="server" OnSelectedIndexChanged="sel_cat" AutoPostBack="true">
                        <asp:ListItem Value="Categoria"></asp:ListItem>
                    </asp:DropDownList>
        <asp:DropDownList ID="ingredientes" runat="server">
            <asp:ListItem Value="Ingrediente"></asp:ListItem>
            </asp:DropDownList>
        <asp:TextBox runat="server" Id="txtCan" placeholder="Cantidad"></asp:TextBox>
        <asp:Button runat="server" Id="agrIng" Text="✅" OnClick="Btn_AgregarIng"/>
       <br />
        <asp:Button runat="server" Text="Crear nuevo ingrediente" OnClick="btn_nuevoIng"/>
            
            
           
            <p>Preparación</p>
            <asp:TextBox CssClass="preparacion" textMode="MultiLine" runat="server" ID="txtPreparacion" />
<br />
        <asp:Button runat="server" id="btn_Guardar" Text="Guardar" OnClick="btn_guardar_receta"/>
        </div>
</asp:Content>