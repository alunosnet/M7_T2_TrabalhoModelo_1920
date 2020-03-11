﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M7_T2_TrabalhoModelo_1920_WIP
{
    public partial class detalhes_curso : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //criar um cookie para guardar o curso escolhido
            try
            {
                string curso = Request.QueryString["q"].ToString();
                HttpCookie cookie = new HttpCookie("curso", curso);
                cookie.Expires = DateTime.Now.AddMonths(1);
                Response.Cookies.Add(cookie);
            }
            catch
            {
                Response.Redirect("index.aspx");
            }
        }
    }
}