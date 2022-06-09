using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace recetario
{
    public partial class ValidarUsuario : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Id"] = null;
        }

        protected void btn_validar_usuario(object sender, EventArgs e)
        {
            Chef c1 = new Chef(txtId.Text, txtPassword.Text);
            bool resp = c1.isValidChef();
            if (resp)
            {
                //Response.Write("Guardado");
                Session["Id"] = c1.Id;
                Response.Redirect("Home.aspx");
            }
            else
            {
                Response.Write("Credenciales inválidas, intentalo nuevamente");
            }
        }
        protected void btn_registrar_usuario(object sender, EventArgs e)
        {
            Response.Redirect("AgregarUsuario.aspx");
        }
    }
}