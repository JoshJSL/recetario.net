using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace recetario
{
    public partial class NuevoIngrediente : System.Web.UI.Page
    {
        static Categoria[] cats;
        private static DataSet dst;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindGrid();



                    cats = Categoria.getAllCat();

                    foreach (Categoria cat in cats)
                    {
                        ListItem li=new ListItem();
                        li.Value = cat.Id+"";
                        li.Text = cat.Nombre;
                        categorias.Items.Add(li);

                    }
                

            }
            if (Session["fromNew"] == null)
            {
                reg.Visible = false;
            }
        }

       

        protected void grid_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void btn_regresar(object sender, EventArgs e)
        {

            Response.Redirect("AgregarReceta.aspx");
        }
        protected void btn_guardar_ingrediente(object sender, EventArgs e)
        {
            Ingrediente ing = new Ingrediente(txtIng.Text, Convert.ToInt32(categorias.SelectedValue));
            if (ing.saveIng())
            {
                msg.Text = "Agregado";
                bindGrid();
            }
            else
            {
                msg.Text = "No agregado";
            }

        }
        

        
        public void bindGrid()
        {
            dst = Ingrediente.getAllIngDatSetCat();

            gridIng.DataSource = dst;
            gridIng.DataBind();
        }
        protected void Grid_Comando(Object sender, DataGridCommandEventArgs e)
        {
            switch (((LinkButton)e.CommandSource).CommandName)
            {
                case "eliminar":
                    {
                        Ingrediente ing = new Ingrediente(dst.Tables[0].Rows[e.Item.ItemIndex]["id_ingrediente"] + "");
                        
                        if (ing.delIng())
                            msg.Text = ("Elimiando");
                        else
                            msg.Text = ("No se ha eliminado");

                        bindGrid();
                        break;
                    }
                default:
                    break;
            }
        }

    }

   
}
