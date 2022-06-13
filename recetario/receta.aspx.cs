using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace recetario
{
    public partial class receta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IdResChe"] == null)
            {
                Response.Redirect("Home.aspx");

            }
            Receta res = new Receta(Session["IdResChe"] + "");
            if (res.Nombre != null)
            {
                titulo.Text = res.Nombre;
                autor.Text = res.NombreAutor;

                foreach (RecetaIngredientes recIng in res.Ingredientes)
                {
                    Ingrediente ing = new Ingrediente(recIng.IdIngrediente);

                    ingredientes.Items.Add(recIng.Cantidad + "  " + ing.Nombre);

                }

                procedimiento.Text = res.Preparacion.Replace("\n", "<br>");

            }
        }
    }
}