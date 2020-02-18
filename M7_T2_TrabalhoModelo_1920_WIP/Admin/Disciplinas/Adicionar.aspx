<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Adicionar.aspx.cs" Inherits="M7_T2_TrabalhoModelo_1920_WIP.Admin.Disciplinas.Adicionar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Adicionar disciplina</h1>
    <asp:FormView Width="100%" DefaultMode="Insert" runat="server" ID="FormView1" DataSourceID="SqlDisciplinas" DataKeyNames="id">
        <EditItemTemplate>
            id:
            <asp:Label Text='<%# Eval("id") %>' runat="server" ID="idLabel1" /><br />
            nome:
            <asp:TextBox Text='<%# Bind("nome") %>' runat="server" ID="nomeTextBox" /><br />
            nrmodulos:
            <asp:TextBox Text='<%# Bind("nrmodulos") %>' runat="server" ID="nrmodulosTextBox" /><br />
            curso:
            <asp:TextBox Text='<%# Bind("curso") %>' runat="server" ID="cursoTextBox" /><br />
            <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Nome:
            <asp:TextBox MaxLength="40" PlaceHolder="Insira o nome da disciplinas" 
                CssClass="form-control" Text='<%# Bind("nome") %>' runat="server" ID="nomeTextBox" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                ControlToValidate="nomeTextBox"
                CssClass="alert-danger" Display="Dynamic"
                ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidator1" runat="server" 
                ErrorMessage="O nome deve ter pelo menos 2 letras"
                ControlToValidate="nomeTextBox"
                CssClass="alert-danger" Display="Dynamic"
                OnServerValidate="CustomValidator1_ServerValidate"
                ></asp:CustomValidator>
            <br />
            Nº módulos:
            <asp:TextBox TextMode="Number" PlaceHolder="Insira o número de módulos" 
                CssClass="form-control" Text='<%# Bind("nrmodulos") %>' runat="server" ID="nrmodulosTextBox" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                ControlToValidate="nrmodulosTextBox"
                CssClass="alert-danger" Display="Dynamic"
                ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" 
                 CssClass="alert-danger" Display="Dynamic"
                ErrorMessage="O número de módulos deve estar entre 1 e 20"
                ControlToValidate="nrmodulosTextBox" Type="Integer"
                MinimumValue="1" MaximumValue="20"
                ></asp:RangeValidator>
            <br />
            Curso:
            <asp:TextBox MaxLength="40" PlaceHolder="Insira o nome do curso" 
                CssClass="form-control" Text='<%# Bind("curso") %>' runat="server" ID="cursoTextBox" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                ControlToValidate="cursoTextBox"
                CssClass="alert-danger" Display="Dynamic"
                ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidator2" runat="server" 
                ErrorMessage="O nome deve ter pelo menos 2 letras"
                ControlToValidate="cursoTextBox"
                CssClass="alert-danger" Display="Dynamic"
                OnServerValidate="CustomValidator1_ServerValidate"
                ></asp:CustomValidator>
            <br />
            <asp:LinkButton runat="server" CssClass="btn btn-danger" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton CssClass="btn btn-info" runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
        </InsertItemTemplate>
        <ItemTemplate>
            id:
            <asp:Label Text='<%# Eval("id") %>' runat="server" ID="idLabel" /><br />
            nome:
            <asp:Label Text='<%# Bind("nome") %>' runat="server" ID="nomeLabel" /><br />
            nrmodulos:
            <asp:Label Text='<%# Bind("nrmodulos") %>' runat="server" ID="nrmodulosLabel" /><br />
            curso:
            <asp:Label Text='<%# Bind("curso") %>' runat="server" ID="cursoLabel" /><br />
            <asp:LinkButton runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource runat="server" ID="SqlDisciplinas" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' InsertCommand="INSERT INTO disciplinas(nome, nrmodulos, curso) VALUES (@nome, @nrmodulos, @curso)" SelectCommand="select * from disciplinas">
        <InsertParameters>
            <asp:Parameter Name="nome"></asp:Parameter>
            <asp:Parameter Name="nrmodulos"></asp:Parameter>
            <asp:Parameter Name="curso"></asp:Parameter>
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
