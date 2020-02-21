﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="editarAluno.aspx.cs" Inherits="M7_T2_TrabalhoModelo_1920_WIP.Admin.Alunos.editarAluno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Editar dados do aluno</h1>
    <a href="gerir.aspx">Voltar</a>
    <asp:FormView DefaultMode="Edit" Width="100%" ID="FormView1" runat="server" DataKeyNames="nprocesso" DataSourceID="SqlAlunos">
        <EditItemTemplate>
            <asp:Image ImageUrl='<%# Eval("nprocesso","~/Public/Imagens/{0}.jpg") %>' Width="200px" ID="Image1" runat="server" />
            <br />Nº processo:
            <asp:Label CssClass="form-control" Text='<%# Eval("nprocesso") %>' runat="server" ID="nprocessoLabel1" /><br />
             Nome:
            <asp:TextBox PlaceHolder="Insira o nome do aluno" CssClass="form-control" MaxLength="60" Text='<%# Bind("nome") %>' runat="server" ID="nomeTextBox" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="Campo obrigatório"
                ControlToValidate="nomeTextBox"
                CssClass="alert-danger" Display="Dynamic"
                ></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidator2" runat="server" 
                ErrorMessage="O campo deve ter pelo menos 3 letras."
                ControlToValidate="nomeTextBox"
                CssClass="alert-danger" Display="Dynamic"
                OnServerValidate="CustomValidator2_ServerValidate"
                ></asp:CustomValidator>
            <br />
            Morada:
            <asp:TextBox PlaceHolder="Insira a morada do aluno" CssClass="form-control" MaxLength="100" Text='<%# Bind("morada") %>' runat="server" ID="moradaTextBox" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ErrorMessage="Campo obrigatório"
                ControlToValidate="moradaTextBox"
                CssClass="alert-danger" Display="Dynamic"
                ></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidator3" runat="server" 
                ErrorMessage="O campo deve ter pelo menos 3 letras."
                ControlToValidate="moradaTextBox"
                CssClass="alert-danger" Display="Dynamic"
                OnServerValidate="CustomValidator2_ServerValidate"
                ></asp:CustomValidator>
            <br />
            Código postal:
            <asp:TextBox PlaceHolder="Insira um código postal" CssClass="form-control" MaxLength="8" Text='<%# Bind("cp") %>' runat="server" ID="cpTextBox" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ErrorMessage="Campo obrigatório"
                ControlToValidate="cpTextBox"
                CssClass="alert-danger" Display="Dynamic"
                ></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidator1" runat="server" 
                ErrorMessage="O código postal só é válido no formato ####-###"
                ControlToValidate="cpTextBox"
                CssClass="alert-danger" Display="Dynamic"
                OnServerValidate="CustomValidator1_ServerValidate"
                ></asp:CustomValidator>
            <br />
            Data nascimento:
            <asp:TextBox CssClass="form-control" TextMode="Date" Text='<%# Bind("data_nascimento","{0:yyyy-MM-dd}") %>' runat="server" ID="data_nascimentoTextBox" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ErrorMessage="Campo obrigatório"
                ControlToValidate="data_nascimentoTextBox"
                CssClass="alert-danger" Display="Dynamic"
                ></asp:RequiredFieldValidator>
            <br />
            Género:
            <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server" SelectedValue='<%# Bind("genero") %>'>
                <asp:ListItem Value="M">Masculino</asp:ListItem>
                <asp:ListItem Value="F">Feminino</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ErrorMessage="Campo obrigatório"
                ControlToValidate="DropDownList1"
                CssClass="alert-danger" Display="Dynamic"
                ></asp:RequiredFieldValidator>
            <br />
            Fotografia:
            <asp:FileUpload CssClass="form-control" ID="FileUpload1" runat="server" />
            <br />
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
            nprocesso:
            <asp:Label Text='<%# Eval("nprocesso") %>' runat="server" ID="nprocessoLabel" /><br />
            nome:
            <asp:Label Text='<%# Bind("nome") %>' runat="server" ID="nomeLabel" /><br />
            morada:
            <asp:Label Text='<%# Bind("morada") %>' runat="server" ID="moradaLabel" /><br />
            cp:
            <asp:Label Text='<%# Bind("cp") %>' runat="server" ID="cpLabel" /><br />
            data_nascimento:
            <asp:Label Text='<%# Bind("data_nascimento") %>' runat="server" ID="data_nascimentoLabel" /><br />
            genero:
            <asp:Label Text='<%# Bind("genero") %>' runat="server" ID="generoLabel" /><br />
            <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource OnUpdated="SqlAlunos_Updated" runat="server" ID="SqlAlunos" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [alunos]
where nprocesso=@nprocesso"
        UpdateCommand="UPDATE alunos SET nome = @nome, morada = @morada, cp = @cp, data_nascimento = @data_nascimento, genero = @genero WHERE (nprocesso = @nprocesso)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="nprocesso" Name="nprocesso"></asp:QueryStringParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="nome"></asp:Parameter>
            <asp:Parameter Name="morada"></asp:Parameter>
            <asp:Parameter Name="cp"></asp:Parameter>
            <asp:Parameter Name="data_nascimento"></asp:Parameter>
            <asp:Parameter Name="genero"></asp:Parameter>
            <asp:Parameter Name="nprocesso"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
