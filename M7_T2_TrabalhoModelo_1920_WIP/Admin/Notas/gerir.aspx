<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="gerir.aspx.cs" Inherits="M7_T2_TrabalhoModelo_1920_WIP.Admin.Notas.gerir" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Gerir Notas</h1>
    <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlNotas" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton runat="server" Text="Update" CommandName="Update" CausesValidation="True" ID="LinkButton1"></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" CausesValidation="False" ID="LinkButton1"></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" OnClientClick="return confirm('Tem a certeza que pretende remover esta nota?')"  Text="Delete" CommandName="Delete" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
            <asp:TemplateField HeaderText="id_disciplina" SortExpression="id_disciplina">
                <EditItemTemplate>
                    <asp:DropDownList ID="id_disciplinaTextBox2" runat="server" SelectedValue='<%# Bind("id_disciplina") %>' DataSourceID="SqlDisciplinas" DataTextField="nome" DataValueField="id"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDisciplinas" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [id], [nome] FROM [disciplinas] ORDER BY [nome]"></asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        CssClass="alert-danger" Display="Dynamic"
                        ControlToValidate="id_disciplinaTextBox2"
                        ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("id_disciplina") %>' ID="Label1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="nprocesso" SortExpression="nprocesso">
                <EditItemTemplate>
                    <asp:DropDownList ID="nprocessoTextBox2" runat="server" SelectedValue='<%# Bind("nprocesso") %>' DataSourceID="SqlAlunos" DataTextField="nome" DataValueField="nprocesso"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlAlunos" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [nprocesso], [nome] FROM [alunos] ORDER BY [nome]"></asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                        CssClass="alert-danger" Display="Dynamic"
                        ControlToValidate="nprocessoTextBox2"
                        ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("nprocesso") %>' ID="Label2"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="valor" SortExpression="valor">
                <EditItemTemplate>
                    <asp:TextBox TextMode="Number" Text='<%# Bind("valor") %>' runat="server" ID="valorTextBox" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                        CssClass="alert-danger" Display="Dynamic"
                        ControlToValidate="valorTextBox"
                        ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server"
                        ErrorMessage="A nota deve estar entre 0 e 20"
                        CssClass="alert-danger" Display="Dynamic"
                        ControlToValidate="valorTextBox"
                        Type="Integer" MinimumValue="0" MaximumValue="20"></asp:RangeValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("valor") %>' ID="Label3"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="data" SortExpression="data">
                <EditItemTemplate>
                    <asp:TextBox TextMode="Date" Text='<%# Bind("data","{0:yyyy-MM-dd}") %>' runat="server" ID="dataTextBox" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                        CssClass="alert-danger" Display="Dynamic"
                        ControlToValidate="dataTextBox"
                        ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("data","{0:dd-MM-yyyy}") %>' ID="Label4"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="nrmodulo" SortExpression="nrmodulo">
                <EditItemTemplate>
                    <asp:TextBox TextMode="Number" Text='<%# Bind("nrmodulo") %>' runat="server" ID="nrmoduloTextBox" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                        CssClass="alert-danger" Display="Dynamic"
                        ControlToValidate="nrmoduloTextBox"
                        ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("nrmodulo") %>' ID="Label5"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlNotas" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE  FROM [notas] Where id=@id" SelectCommand="SELECT * FROM [notas]" UpdateCommand="UPDATE notas SET id_disciplina = @id_disciplina, nprocesso = @nprocesso, valor = @valor, data = @data, nrmodulo = @nrmodulo WHERE (id = @id)">
        <DeleteParameters>
            <asp:Parameter Name="id"></asp:Parameter>
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_disciplina"></asp:Parameter>
            <asp:Parameter Name="nprocesso"></asp:Parameter>
            <asp:Parameter Name="valor"></asp:Parameter>
            <asp:Parameter Name="data" DbType="Date"></asp:Parameter>
            <asp:Parameter Name="nrmodulo"></asp:Parameter>
            <asp:Parameter Name="id"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
