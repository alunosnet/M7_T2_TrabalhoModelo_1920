using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M7_T2_TrabalhoModelo_1920_WIP.Admin.Alunos
{
    public partial class Adicionar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //página para admin
            if (Session["perfil"] == null || Session["perfil"].Equals("0") == false)
                Response.Redirect("~/index.aspx");

        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string texto = args.Value.Trim();

            //validar o tamanho
            if (texto.Length != 8)
            {
                args.IsValid = false;
                return;
            }
            //validar o -
            if (texto.IndexOf('-') != 4)
            {
                args.IsValid = false;
                return;
            }
            //validar se tem número antes e depois do -
            //3500-123
            //3500 [0]
            //123  [1]
            string[] partes_cp = texto.Split('-');
            int resultado = 0;
            if (partes_cp.Length != 2)
            {
                args.IsValid = false;
                return;
            }
            if(int.TryParse(partes_cp[0],out resultado) == false)
            {
                args.IsValid = false;
                return;
            }
            if (int.TryParse(partes_cp[1], out resultado) == false)
            {
                args.IsValid = false;
                return;
            }
            args.IsValid = true;
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string texto = args.Value.Trim();

            if (texto.Length < 3)
            {
                args.IsValid = false;
                return;
            }

            args.IsValid = true;
        }

        protected void SqlAlunos_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            //nprocesso
            string processo = e.Command.Parameters["@novo"].Value.ToString();

            //imagem
            FileUpload ficheiro = FormView1.FindControl("FileUpload1") as FileUpload;
            //guardar
            if (ficheiro.HasFile)
            {
                ficheiro.SaveAs(Server.MapPath("~/Public/Imagens/") + processo + ".jpg");
            }
        }
    }
}