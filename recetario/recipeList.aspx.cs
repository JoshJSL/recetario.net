using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace recetario
{
    public partial class RecipeList : System.Web.UI.Page
    {
        private static DataSet dst;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Id"] == null) { 
                Response.Redirect("Login.aspx"); 
            }
            bindData();

                
        }

        protected void gridEditar(object sender, DataGridCommandEventArgs e)
        {
            Session["IdRecMod"] = dst.Tables[0].Rows[e.Item.ItemIndex]["id_receta"];
            Response.Redirect("AgregarReceta.aspx");
        }

        public void bindData()
        {
            
            dst = Receta.getRecetasDataSet(" where id_autor='" + ((Chef)Session["Id"]).Id + "'");

            gridRecetas.DataSource = dst;
            gridRecetas.DataBind();
        }
        
        protected void Grid_Comando(Object sender, DataGridCommandEventArgs e)
        {
            switch (((LinkButton)e.CommandSource).CommandName)
            {
                case "eliminar":
                    {
                        Receta r1 = new Receta(dst.Tables[0].Rows[e.Item.ItemIndex]["id_receta"] + "");
                        if (r1.deRec())
                            msg.Text = ("Elimiando");
                        else
                            msg.Text = ("No se ha eliminado");
                        bindData();
                        break;
                    }
                default:
                    break;
            }
        }
        protected void grid_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    }
}