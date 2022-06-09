using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace recetario
{
    public partial class maestra : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Id"] == null)
            {
                logout.Text = "Log in";
                nueva.Visible = false;

            }
            else
            {
                logout.Text = "Log out";
            }
        }
        protected void btn_home(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
        protected void btn_recipes(object sender, EventArgs e)
        {


        }
        protected void btn_partners(object sender, EventArgs e)
        {

        }
       
        protected void btn_logut(object sender, EventArgs e)
        {
            Session["Id"] = null;
            Response.Redirect("Login.aspx");
        }
        protected void btn_nueva(object sender, EventArgs e)
        {
            Response.Redirect("AgregarReceta.aspx");
        }

    }
}