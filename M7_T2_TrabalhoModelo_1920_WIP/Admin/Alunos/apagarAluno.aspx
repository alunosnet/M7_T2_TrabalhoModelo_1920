<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="apagarAluno.aspx.cs" Inherits="M7_T2_TrabalhoModelo_1920_WIP.Admin.Alunos.apagarAluno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h1>Tem a certeza que pretende apagar este aluno</h1>
    <a href="gerir.aspx">Voltar</a>
    <asp:FormView Width="100%" ID="FormView1" runat="server" DataKeyNames="nprocesso" DataSourceID="SqlAlunos">
        <EditItemTemplate>
            nprocesso:
            <asp:Label Text='<%# Eval("nprocesso") %>' runat="server" ID="nprocessoLabel1" /><br />
            nome:
            <asp:TextBox Text='<%# Bind("nome") %>' runat="server" ID="nomeTextBox" /><br />
            morada:
            <asp:TextBox Text='<%# Bind("morada") %>' runat="server" ID="moradaTextBox" /><br />
            cp:
            <asp:TextBox Text='<%# Bind("cp") %>' runat="server" ID="cpTextBox" /><br />
            data_nascimento:
            <asp:TextBox Text='<%# Bind("data_nascimento") %>' runat="server" ID="data_nascimentoTextBox" /><br />
            genero:
            <asp:TextBox Text='<%# Bind("genero") %>' runat="server" ID="generoTextBox" /><br />
            <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
        </EditItemTemplate>
        <InsertItemTemplate>
            nome:
            <asp:TextBox Text='<%# Bind("nome") %>' runat="server" ID="nomeTextBox" /><br />
            morada:
            <asp:TextBox Text='<%# Bind("morada") %>' runat="server" ID="moradaTextBox" /><br />
            cp:
            <asp:TextBox Text='<%# Bind("cp") %>' runat="server" ID="cpTextBox" /><br />
            data_nascimento:
            <asp:TextBox Text='<%# Bind("data_nascimento") %>' runat="server" ID="data_nascimentoTextBox" /><br />
            genero:
            <asp:TextBox Text='<%# Bind("genero") %>' runat="server" ID="generoTextBox" /><br />
            <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:Image ImageUrl='<%# Eval("nprocesso","~/Public/Imagens/{0}.jpg") %>' Width="200px" ID="Image1" runat="server" />
            <br />
            Nº processo:
            <asp:Label CssClass="form-control" Text='<%# Eval("nprocesso") %>' runat="server" ID="nprocessoLabel" /><br />
            Nome:
            <asp:Label CssClass="form-control" Text='<%# Bind("nome") %>' runat="server" ID="nomeLabel" /><br />
            Morada:
            <asp:Label CssClass="form-control" Text='<%# Bind("morada") %>' runat="server" ID="moradaLabel" /><br />
            Código postal:
            <asp:Label CssClass="form-control" Text='<%# Bind("cp") %>' runat="server" ID="cpLabel" /><br />
            Data nascimento:
            <asp:Label CssClass="form-control" Text='<%# Bind("data_nascimento","{0:dd-MM-yyyy}") %>' runat="server" ID="data_nascimentoLabel" /><br />
            Género:
            <asp:Label CssClass="form-control" Text='<%# Bind("genero") %>' runat="server" ID="generoLabel" /><br />
            <asp:LinkButton CssClass="btn btn-danger" runat="server" Text="Delete" CommandName="Delete" ID="DeleteButton" CausesValidation="False" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource OnDeleted="SqlAlunos_Deleted" runat="server" ID="SqlAlunos" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="delete FROM [alunos] 
where nprocesso=@nprocesso"
        SelectCommand="SELECT * FROM [alunos] 
where nprocesso=@nprocesso">
        <DeleteParameters>
            <asp:Parameter Name="nprocesso"></asp:Parameter>
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="nprocesso" Name="nprocesso"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
