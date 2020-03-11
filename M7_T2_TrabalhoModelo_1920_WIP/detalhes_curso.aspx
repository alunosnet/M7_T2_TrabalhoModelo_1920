<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="detalhes_curso.aspx.cs" Inherits="M7_T2_TrabalhoModelo_1920_WIP.detalhes_curso" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Disciplinas do curso escolhido</h1>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDisciplinas">
        <Columns>
            <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome"></asp:BoundField>
            <asp:BoundField DataField="nrmodulos" HeaderText="nrmodulos" SortExpression="nrmodulos"></asp:BoundField>
            <asp:BoundField DataField="curso" HeaderText="curso" SortExpression="curso"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDisciplinas" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [nome], [nrmodulos], [curso] FROM [disciplinas] WHERE ([curso] = @curso)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="q" Name="curso" Type="String"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
