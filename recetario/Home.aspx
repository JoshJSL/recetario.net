<%@ Page AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="recetario.Home" Language="C#" MasterPageFile="~/maestra.Master" Title="" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
     <title>Home</title>
    <style>
        .container{
            width: 100%;
            background-color: azure;
            display: flex;
            flex-wrap: wrap;
        }

        .caja{
            width: 200px;
            height: 160px;
            border: solid 1px black;
            text-align: center;
            line-height: 60px;
            margin: 10px;
        }

        .imagen{
            width: 90px;
            height: 90px;
            position: center;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="contenido">
     <div>
            <h1>Check the trends</h1>
            <asp:Label Text="User Name" runat="server" />
            <asp:Panel runat="server" ID="panel">

            </asp:Panel>

            <h1>Watch our video tutorial</h1>
        </div>
</asp:Content>