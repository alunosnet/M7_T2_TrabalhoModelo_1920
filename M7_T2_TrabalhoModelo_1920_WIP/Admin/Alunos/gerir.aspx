﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="gerir.aspx.cs" Inherits="M7_T2_TrabalhoModelo_1920_WIP.Admin.Alunos.gerir" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Alunos</h1>
    Nome:<asp:TextBox CssClass="form-control" PlaceHolder="Nome do aluno a pesquisar" ID="TextBox1" runat="server"></asp:TextBox><asp:Button CssClass="btn btn-info" ID="Button1" runat="server" Text="Pesquisar" />
    <br />
    <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="nprocesso" DataSourceID="SqlAlunos">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="nprocesso" DataNavigateUrlFormatString="editarAluno.aspx?nprocesso={0}" Text="Editar" HeaderText="Editar"></asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="nprocesso" DataNavigateUrlFormatString="apagarAluno.aspx?nprocesso={0}" Text="Apagar" HeaderText="Apagar"></asp:HyperLinkField>
            <asp:BoundField DataField="nprocesso" HeaderText="nprocesso" ReadOnly="True" InsertVisible="False" SortExpression="nprocesso"></asp:BoundField>
            <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome"></asp:BoundField>
            <asp:ImageField ControlStyle-Width="200px" DataImageUrlField="nprocesso" DataImageUrlFormatString="~/Public/Imagens/{0}.jpg" HeaderText="Fotografia"></asp:ImageField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlAlunos" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [nprocesso], [nome] FROM [alunos] WHERE ([nome] LIKE '%' + @nome + '%')">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="nome" Type="String"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
