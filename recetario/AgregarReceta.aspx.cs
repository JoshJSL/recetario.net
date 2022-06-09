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
    public partial class AgregarReceta : System.Web.UI.Page
    {
        protected DropDownList ingredientes;
        static Categoria[] cats;
        protected void Page_Load(object sender, EventArgs e)
        {
            //    protected TextBox txtId;
            //    protected TextBox txtIdChef;
            //    protected TextBox txtName;
            //    protected TextBox txtMeasure;
            //    protected TextBox txtQuantity;
            //    protected TextBox txtPreparacion;
            if (Session["Id"] == null)
            {
                Response.Redirect("Home.aspx")
            }
            if (!IsPostBack)
            {
                cats = Categoria.getAllCat();

                foreach(Categoria cat in cats)
                {
                    categoria.Items.Add(cat.Nombre);

                }
                
            }
        }


        protected void sel_cat(object sender, EventArgs e)
        {
            if (categoria.SelectedIndex != 0)
            {
                Ingrediente[] ings= Ingrediente.getIngCat(cats[categoria.SelectedIndex - 1].Id);
                ingredientes.Items.Clear();
                foreach(Ingrediente ing in ings)
                {
                    ingredientes.Items.Add(ing.Nombre);
                }
            }
            
        }
        protected void btn_guardar_receta(object sender, EventArgs e)
        {
            Receta r1 = new Receta(txtName.Text, txtIdChef.Text, txtPreparacion.Text);
            bool resp = r1.saveRes();
            if(resp)
            {
                Response.Write("Guardado");
            }
        }


    


    }
}