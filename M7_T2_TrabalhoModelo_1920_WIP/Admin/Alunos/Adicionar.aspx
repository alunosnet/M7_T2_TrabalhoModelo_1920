<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Adicionar.aspx.cs" Inherits="M7_T2_TrabalhoModelo_1920_WIP.Admin.Alunos.Adicionar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h1>Adicionar aluno</h1>
    <asp:FormView DefaultMode="Insert" Width="100%" ID="FormView1" runat="server" DataKeyNames="nprocesso" DataSourceID="SqlAlunos">
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
            <asp:TextBox CssClass="form-control" TextMode="Date" Text='<%# Bind("data_nascimento") %>' runat="server" ID="data_nascimentoTextBox" />
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
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ErrorMessage="Campo obrigatório"
                ControlToValidate="FileUpload1"
                CssClass="alert-danger" Display="Dynamic"
                ></asp:RequiredFieldValidator>
            <br />
            <asp:LinkButton CssClass="btn btn-danger" runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton CssClass="btn btn-info" runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
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
            <asp:LinkButton runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource OnInserted="SqlAlunos_Inserted" runat="server" ID="SqlAlunos" 
        ConnectionString='<%$ ConnectionStrings:ConnectionString %>' 
        InsertCommand="INSERT INTO alunos(nome, morada, cp, data_nascimento, genero) VALUES (@nome, @morada, @cp, @data_nascimento, @genero); SET @novo=SCOPE_IDENTITY();" 
        SelectCommand="select * from alunos">
        <InsertParameters>
            <asp:Parameter Name="nome"></asp:Parameter>
            <asp:Parameter Name="morada"></asp:Parameter>
            <asp:Parameter Name="cp"></asp:Parameter>
            <asp:Parameter Name="data_nascimento" DbType="Date"></asp:Parameter>
            <asp:Parameter Name="genero"></asp:Parameter>
            <asp:Parameter Name="novo" Direction="Output" DbType="Int32"></asp:Parameter>
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
