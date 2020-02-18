<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="gerir.aspx.cs" Inherits="M7_T2_TrabalhoModelo_1920_WIP.Admin.Alunos.gerir" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Alunos</h1>
    Nome:<asp:TextBox CssClass="form-control" PlaceHolder="VAmos almoçar!!!" ID="TextBox1" runat="server"></asp:TextBox><asp:Button ID="Button1" runat="server" Text="Button" />
    <br />
    <asp:GridView ID="GridView1" runat="server"></asp:GridView>
</asp:Content>
