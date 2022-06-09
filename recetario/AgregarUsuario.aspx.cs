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
    public partial class AgregarUsuario : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btn_guardar_usuario(object sender, EventArgs e)
        {
            Chef c1 = new Chef(txtNombre.Text, txtApaterno.Text, txtAmaterno.Text, txtPassword.Text);
            bool resp = c1.saveChef();
            if (resp)
            {
                //Response.Write("Guardado");
                Id.Text = "Tu usuario ha sido creado, tu ID para ingresar es: " + c1.Id;
            }
        }

        protected void btn_logear_usuario(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}