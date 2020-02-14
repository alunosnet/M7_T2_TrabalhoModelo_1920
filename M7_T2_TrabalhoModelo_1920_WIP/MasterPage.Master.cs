using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M7_T2_TrabalhoModelo_1920_WIP
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["M7_TM"];
            if (cookie != null)
                div_aviso.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //criar um cookie
            HttpCookie cookie = new HttpCookie("M7_TM");
            cookie.Expires = DateTime.Now.AddYears(1);

            //enviar para o browser
            Response.Cookies.Add(cookie);
            //esconder a div
            div_aviso.Visible = false;
        }
    }
}