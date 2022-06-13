<%@ Page AutoEventWireup="true" CodeBehind="NuevoIngrediente.aspx.cs" Inherits="recetario.NuevoIngrediente" Language="C#" MasterPageFile="~/maestra.Master" Title="" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="contenido">
<div>
                <h1>Ingredients </h1>
    <asp:Label runat="server" ID="msg" />
    <asp:DataGrid id="gridIng" runat="server" 
            Font-Names="Arial"
            
            OnItemCommand="Grid_Comando"
            

            AutoGenerateColumns="False"
            BackColor="White" BorderColor="#6600CC" BorderStyle="None" BorderWidth="1px" CellPadding="9" >

            <AlternatingItemStyle BackColor="#F7F7F7" />

            <Columns>
                <asp:BoundColumn DataField="nomCat" HeaderText="ID Receta" SortExpression="ID Receta" />
                <asp:BoundColumn DataField="nomIng" HeaderText="Nombre" SortExpression="Nombre" />

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


            <h1>New Ingredient Form</h1>
            <p>Name</p>
            <asp:TextBox runat="server" id="txtIng" />
            <p>Category</p>
            <asp:DropDownList ID="categorias" runat="server">
                        <asp:ListItem Value="Categoria"></asp:ListItem>
            </asp:DropDownList>

            <asp:Button runat="server" id="Button1" Text="Guardar" OnClick="btn_guardar_ingrediente"/>
    <br />
      <asp:Button runat="server" id="reg" Text="Regresar a nueva receta" OnClick="btn_regresar"/>
        </div>
</asp:Content>