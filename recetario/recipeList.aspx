<%@ Page Title="" Language="C#" MasterPageFile="~/maestra.Master" AutoEventWireup="true" CodeBehind="recipeList.aspx.cs" Inherits="recetario.RecipeList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenido" runat="server">
    <h1>My Recipes </h1>
    <asp:Label runat="server" ID="msg" />
    <asp:DataGrid id="gridRecetas" runat="server" 
            Font-Names="Arial"
            OnEditCommand="gridEditar"
            OnItemCommand="Grid_Comando" 
            AutoGenerateColumns="False"
            BackColor="White" BorderColor="#6600CC" BorderStyle="None" BorderWidth="1px" CellPadding="9" OnSelectedIndexChanged="grid_SelectedIndexChanged">

            <AlternatingItemStyle BackColor="#F7F7F7" />

            <Columns>
                <asp:BoundColumn DataField="id_receta" HeaderText="ID Receta" SortExpression="ID Receta" />
                <asp:BoundColumn DataField="nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundColumn DataField="id_autor" HeaderText="ID Autor" SortExpression="ID Autor" />
                <asp:BoundColumn DataField="preparacion" HeaderText="Preparación" SortExpression="Preparación" />

            <asp:EditCommandColumn 
                EditText="Editar"
                HeaderText="Editar"                
                >
                
                <ItemStyle Wrap="False" />
                <HeaderStyle Wrap="False" />

            </asp:EditCommandColumn>
            <asp:ButtonColumn
                HeaderText="Eliminar"
                ButtonType="LinkButton"
                Text="Eliminar"
                CommandName="eliminar"/>
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" Mode="NumericPages" />
            <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
</asp:DataGrid>
</asp:Content>
