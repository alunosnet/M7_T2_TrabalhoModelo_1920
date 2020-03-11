<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="pesquisar.aspx.cs" Inherits="M7_T2_TrabalhoModelo_1920_WIP.Admin.Alunos.pesquisar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h1>Pesquisa por aluno</h1>
    Nome:<asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"></asp:TextBox><asp:Button CssClass="btn btn-info" ID="Button1" runat="server" Text="Pesquisar" />
    <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="nprocesso" DataSourceID="SqlAlunos">
        <Columns>
            <asp:CommandField ShowSelectButton="True"></asp:CommandField>
            <asp:BoundField DataField="nprocesso" HeaderText="Nº processo" ReadOnly="True" InsertVisible="False" SortExpression="nprocesso"></asp:BoundField>
            <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome"></asp:BoundField>
            <asp:BoundField DataField="morada" HeaderText="Morada" SortExpression="morada"></asp:BoundField>
            <asp:BoundField DataField="cp" HeaderText="Cód. postal" SortExpression="cp"></asp:BoundField>
            <asp:BoundField DataField="data_nascimento" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Data nascimento" SortExpression="data_nascimento"></asp:BoundField>
            <asp:BoundField DataField="genero" HeaderText="Género" SortExpression="genero"></asp:BoundField>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource runat="server" ID="SqlAlunos" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [alunos] WHERE ([nome] LIKE '%' + @nome + '%')">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="nome" Type="String"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:GridView EmptyDataText="Selecione o aluno" CssClass="table" ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlNotas">
        <Columns>
            <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome"></asp:BoundField>
            <asp:BoundField DataField="nrmodulo" HeaderText="Nº módulo" SortExpression="nrmodulo"></asp:BoundField>
            <asp:BoundField DataField="data" DataFormatString="{0:dd-MM-yyyy}"  HeaderText="Data" SortExpression="data"></asp:BoundField>
            <asp:BoundField DataField="valor" HeaderText="Nota" SortExpression="valor"></asp:BoundField>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource runat="server" ID="SqlNotas" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT disciplinas.nome, notas.nrmodulo, notas.data, notas.valor FROM disciplinas INNER JOIN notas ON disciplinas.id = notas.id_disciplina WHERE (notas.nprocesso = @nprocesso)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" PropertyName="SelectedValue" Name="nprocesso"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
