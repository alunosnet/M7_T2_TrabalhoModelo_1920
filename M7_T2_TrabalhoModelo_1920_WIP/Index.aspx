<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="M7_T2_TrabalhoModelo_1920_WIP.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Login-->
    <div runat="server" id="divLogin">
        Nome:<asp:TextBox ID="TBNome" runat="server"></asp:TextBox><br />
        Password:<asp:TextBox TextMode="Password" ID="TBPassword" runat="server"></asp:TextBox><br />
        <asp:Button ID="Button1" runat="server" Text="Login" />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <asp:DetailsView OnDataBound="DetailsView1_DataBound" ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="nome" DataSourceID="SqlLogin">
            <Fields>
                <asp:BoundField DataField="nome" HeaderText="nome" ReadOnly="True" SortExpression="nome"></asp:BoundField>
                <asp:BoundField DataField="perfil" HeaderText="perfil" SortExpression="perfil"></asp:BoundField>
                <asp:BoundField DataField="nprocesso" HeaderText="nprocesso" SortExpression="nprocesso"></asp:BoundField>
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource runat="server" ID="SqlLogin" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [nome], [perfil], [nprocesso] FROM [utilizadores] WHERE (([nome] = @nome) AND ([palavra_passe] = HASHBYTES('SHA2_512',@palavra_passe)))">
            <SelectParameters>
                <asp:ControlParameter DbType="AnsiString" ControlID="TBNome" PropertyName="Text" Name="nome"  ></asp:ControlParameter>
                <asp:ControlParameter DbType="AnsiString" ControlID="TBPassword" PropertyName="Text" Name="palavra_passe"  ></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <!--Listar cursos-->
    <div runat="server" id="divCursos"></div>
    <!--Listar disciplinas-->
    <div runat="server" id="divDisciplinas"></div>
</asp:Content>
