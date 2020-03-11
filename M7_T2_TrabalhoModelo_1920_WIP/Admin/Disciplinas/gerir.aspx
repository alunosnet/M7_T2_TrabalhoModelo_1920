<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="gerir.aspx.cs" Inherits="M7_T2_TrabalhoModelo_1920_WIP.Admin.Disciplinas.gerir" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Gerir disciplinas</h1>
    Curso:<asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"></asp:TextBox><asp:Button CssClass="btn btn-info" ID="Button1" runat="server" Text="Pesquisar" />
    <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDisciplinas1" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton runat="server" Text="Update" CommandName="Update" CausesValidation="True" ID="LinkButton1"></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" CausesValidation="False" ID="LinkButton1"></asp:LinkButton>&nbsp;<asp:LinkButton OnClientClick="return confirm('Tem a certeza que pretende remover esta disciplina?')" runat="server" Text="Delete" CommandName="Delete" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
            <asp:TemplateField HeaderText="Nome" SortExpression="nome">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("nome") %>' ID="nomeTextBox"></asp:TextBox>
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
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("nome") %>' ID="Label1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nº módulos" SortExpression="nrmodulos">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("nrmodulos") %>' ID="nrmodulosTextBox"></asp:TextBox>
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
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("nrmodulos") %>' ID="Label2"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="curso" SortExpression="curso">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("curso") %>' ID="cursoTextBox"></asp:TextBox>
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
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("curso") %>' ID="Label3"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>

    <asp:SqlDataSource runat="server" ID="SqlDisciplinas1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="delete from disciplinas where id=@id" SelectCommand="SELECT * FROM [disciplinas] WHERE ([curso] LIKE '%' + @curso + '%')" UpdateCommand="UPDATE disciplinas SET nome = @nome, nrmodulos = @nrmodulos, curso = @curso WHERE (id = @id)">
        <DeleteParameters>
            <asp:Parameter Name="id"></asp:Parameter>
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="curso"></asp:ControlParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="nome"></asp:Parameter>
            <asp:Parameter Name="nrmodulos"></asp:Parameter>
            <asp:Parameter Name="curso"></asp:Parameter>
            <asp:Parameter Name="id"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    
</asp:Content>
