<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="adicionar.aspx.cs" Inherits="M7_T2_TrabalhoModelo_1920_WIP.Admin.Notas.adicionar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h1>Adicionar notas</h1>
    <asp:FormView DefaultMode="Insert" ID="FormView1" runat="server" DataKeyNames="id" DataSourceID="SqlNotas">
        <EditItemTemplate>
            id:
            <asp:Label Text='<%# Eval("id") %>' runat="server" ID="idLabel1" /><br />
            id_disciplina:
            <asp:TextBox Text='<%# Bind("id_disciplina") %>' runat="server" ID="id_disciplinaTextBox" /><br />
            nprocesso:
            <asp:TextBox Text='<%# Bind("nprocesso") %>' runat="server" ID="nprocessoTextBox" /><br />
            valor:
            <asp:TextBox Text='<%# Bind("valor") %>' runat="server" ID="valorTextBox" /><br />
            data:
            <asp:TextBox Text='<%# Bind("data") %>' runat="server" ID="dataTextBox" /><br />
            nrmodulo:
            <asp:TextBox Text='<%# Bind("nrmodulo") %>' runat="server" ID="nrmoduloTextBox" /><br />
            <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
        </EditItemTemplate>
        <InsertItemTemplate>
            id_disciplina:
            <asp:DropDownList ID="id_disciplinaTextBox2" runat="server" SelectedValue='<%# Bind("id_disciplina") %>' DataSourceID="SqlDisciplinas" DataTextField="nome" DataValueField="id"></asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="SqlDisciplinas" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [id], [nome] FROM [disciplinas] ORDER BY [nome]"></asp:SqlDataSource>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                CssClass="alert-danger" Display="Dynamic"
                ControlToValidate="id_disciplinaTextBox2"
                ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
            <br />
            nprocesso:
            <asp:DropDownList ID="nprocessoTextBox2" runat="server" SelectedValue='<%# Bind("nprocesso") %>' DataSourceID="SqlAlunos" DataTextField="nome" DataValueField="nprocesso"></asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="SqlAlunos" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [nprocesso], [nome] FROM [alunos] ORDER BY [nome]"></asp:SqlDataSource>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                CssClass="alert-danger" Display="Dynamic"
                ControlToValidate="nprocessoTextBox2"
                ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
            <br />
            Valor:
            <asp:TextBox TextMode="Number" Text='<%# Bind("valor") %>' runat="server" ID="valorTextBox" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                CssClass="alert-danger" Display="Dynamic"
                ControlToValidate="valorTextBox"
                ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" 
                ErrorMessage="A nota deve estar entre 0 e 20"
                CssClass="alert-danger" Display="Dynamic"
                ControlToValidate="valorTextBox"
                Type="Integer" MinimumValue="0" MaximumValue="20"
                ></asp:RangeValidator>
            <br />
            Data:
            <asp:TextBox TextMode="Date" Text='<%# Bind("data") %>' runat="server" ID="dataTextBox" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                CssClass="alert-danger" Display="Dynamic"
                ControlToValidate="dataTextBox"
                ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
            <br />
            Nº módulo:
            <asp:TextBox TextMode="Number" Text='<%# Bind("nrmodulo") %>' runat="server" ID="nrmoduloTextBox" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                CssClass="alert-danger" Display="Dynamic"
                ControlToValidate="nrmoduloTextBox"
                ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
            <br />
            <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
        </InsertItemTemplate>
        <ItemTemplate>
            id:
            <asp:Label Text='<%# Eval("id") %>' runat="server" ID="idLabel" /><br />
            id_disciplina:
            <asp:Label Text='<%# Bind("id_disciplina") %>' runat="server" ID="id_disciplinaLabel" /><br />
            nprocesso:
            <asp:Label Text='<%# Bind("nprocesso") %>' runat="server" ID="nprocessoLabel" /><br />
            valor:
            <asp:Label Text='<%# Bind("valor") %>' runat="server" ID="valorLabel" /><br />
            data:
            <asp:Label Text='<%# Bind("data") %>' runat="server" ID="dataLabel" /><br />
            nrmodulo:
            <asp:Label Text='<%# Bind("nrmodulo") %>' runat="server" ID="nrmoduloLabel" /><br />
            <asp:LinkButton runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource runat="server" ID="SqlNotas" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' InsertCommand="INSERT INTO notas(id_disciplina, nprocesso, valor, data, nrmodulo) VALUES (@id_disciplina, @nprocesso, @valor, @data, @nrmodulo)" SelectCommand="SELECT * FROM [notas]">
        <InsertParameters>
            <asp:Parameter Name="id_disciplina"></asp:Parameter>
            <asp:Parameter Name="nprocesso"></asp:Parameter>
            <asp:Parameter Name="valor"></asp:Parameter>
            <asp:Parameter Name="data" DbType="Date"></asp:Parameter>
            <asp:Parameter Name="nrmodulo"></asp:Parameter>
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
