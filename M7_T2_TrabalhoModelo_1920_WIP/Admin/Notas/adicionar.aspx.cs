using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M7_T2_TrabalhoModelo_1920_WIP.Admin.Notas
{
    public partial class adicionar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //página para admin
            if (Session["perfil"] == null || Session["perfil"].Equals("0") == false)
                Response.Redirect("~/index.aspx");

            //TODO: validar as notas para evitar que o mesmo aluno tenha mais do que 
            //uma nota na mesma disciplina e no mesmo módulo
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //o nprocesso do aluno
            DropDownList DDAluno = FormView1.FindControl("nprocessoTextBox2") 
                as DropDownList;
            //id disciplina
            DropDownList DDDisciplina= FormView1.FindControl("id_disciplinaTextBox2")
                as DropDownList;
            //nr módulo
            TextBox TBModulo= FormView1.FindControl("nrmoduloTextBox")
                as TextBox;

            int nprocesso = int.Parse(DDAluno.SelectedValue);
            int id_disciplina = int.Parse(DDDisciplina.SelectedValue);
            int nrmodulo = int.Parse(TBModulo.Text);

            //string ligação
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            //abrir uma ligação à base de dados
            SqlConnection ligacao = new SqlConnection(connectionString);
            ligacao.Open();
            //executar a consulta
            string sql = @"SELECT * FROM Notas WHERE nprocesso=" + nprocesso +
                " AND id_disciplina=" + id_disciplina +
                " AND nrmodulo=" + nrmodulo;
            SqlCommand command = new SqlCommand(sql, ligacao);
            SqlDataReader dados = command.ExecuteReader();
            if (dados.HasRows)
            {
                args.IsValid = false;
                dados = null;
                command = null;
                ligacao.Close();
                return;
            }
            //fechar a ligação à base de dados
            args.IsValid = true;
            dados = null;
            command = null;
            ligacao.Close();
            return;
        }
    }
}