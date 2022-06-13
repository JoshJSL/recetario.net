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
        static Categoria[] cats;
        static List<string> delList= new List<string>();
        static List<string[]> dataInfo = new List<string[]>();

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
                Response.Redirect("Home.aspx");
            }
            if (Session["IdRecMod"] == null && !IsPostBack && Session["fromNew"] == null)
            {

                    delList = new List<string>();
                    dataInfo = new List<string[]>();
                
            }
            if (Session["IdRecMod"] != null)
            {
                delList = new List<string>();
                titulo.Text = "<h1>Edit Recipe Form</h1>";
                string idRece = Convert.ToString(Session["IdRecMod"]);
                Session["IdRecMod"] = null;
                idRec.Text = idRece;
                Receta rec= new Receta(idRece);
                if (rec.Nombre != null)
                {
                    txtName.Text=rec.Nombre;
                    txtPreparacion.Text=rec.Preparacion;
                }
                dataInfo = new List<string[]>();
                foreach(RecetaIngredientes recIng in rec.Ingredientes)
                {
                    Ingrediente ing=new Ingrediente(recIng.IdIngrediente);
                    Categoria cat = new Categoria(ing.IdCategoria);

                    string[] item = new string[5];
                    
                    item[0] = cat.Nombre;
                    item[1] = ing.Nombre;
                    item[2] = recIng.Cantidad;
                    item[3] = recIng.IdIngrediente;
                    item[4] = "";
                    dataInfo.Add(item);

                }


            }
            
            
            if (!IsPostBack)
            {
                fillCat();
                
            }
            if (Session["fromNew"] != null)
            {
                saveInfo inf = (saveInfo)Session["fromNew"];
                txtName.Text = inf.nombre;
                txtPreparacion.Text = inf.prep;
                idRec.Text = inf.idRec;

                dataInfo = inf.ing;
                Session["fromNew"] = null;

            }

            for (int i =0; i<dataInfo.Count;i++)
            {
                string[] item=dataInfo[i];
                TableRow tr = new TableRow();
                TableCell cc = new TableCell(), ci = new TableCell(), cca = new TableCell(), ca = new TableCell();

                Label lc = new Label();
                lc.Text = item[0];
                cc.Controls.Add(lc);

                Label li = new Label();
                li.Text = item[1];
                ci.Controls.Add(li);

                Label lca = new Label();
                lca.Text = item[2];
                cca.Controls.Add(lca);

                Button btn = new Button();
                btn.CssClass = "cellBtn";
                btn.Text = "❌";
                btn.CommandArgument = i+"";
                btn.Click += new EventHandler(this.Btn_EliminarIng);
                ca.Controls.Add(btn);


                tr.Cells.Add(cc);
                tr.Cells.Add(ci);
                tr.Cells.Add(cca);
                tr.Cells.Add(ca);

                ingTab.Rows.AddAt(ingTab.Rows.Count , tr);
            }
            

        }

        public void fillCat()
        {
            cats = Categoria.getAllCat();
            categorias.Items.Clear();
            categorias.Items.Add("Categoria");

            foreach (Categoria cat in cats)
            {
                categorias.Items.Add(cat.Nombre);

            }
            ingredientes.Items.Clear();
            ingredientes.Items.Add("Ingrediente");
        }
        protected void Btn_EliminarIng(object sender, EventArgs e)
        {
            Button btn = (Button)(sender);
            int pos = Convert.ToInt32(btn.CommandArgument);
            delList.Add(dataInfo[pos][3]);

            dataInfo.RemoveAt(pos);

            saveState();
            Response.Redirect(Request.RawUrl);
        }
        protected void Btn_AgregarIng(object sender, EventArgs e)
        {
            string[] item = new string[5];
            item[0] = categorias.SelectedValue;
            item[1] = ingredientes.SelectedItem.Text;
            item[2] = txtCan.Text;
            item[3] = ingredientes.SelectedItem.Value;
            item[4] = "add";

            dataInfo.Add(item);

            saveState();
            Response.Redirect(Request.RawUrl);
        }
        protected void sel_cat(object sender, EventArgs e)
        {
            

            if (categorias.SelectedIndex != 0)
            {
                Ingrediente[] ings= Ingrediente.getIngCat(cats[categorias.SelectedIndex - 1].Id);
                ingredientes.Items.Clear();
                ingredientes.Items.Add("Ingrediente");

                foreach (Ingrediente ing in ings)
                {
                    ListItem li = new ListItem();
                    li.Value = ing.Id;
                    li.Text = ing.Nombre;
                    ingredientes.Items.Add(li);
                }
            }
            
        }
        protected void btn_guardar_receta(object sender, EventArgs e)
        {
            string idr = idRec.Text;
            if(idr != "")
            {
                Receta r1 = new Receta(idr, txtName.Text,((Chef)Session["Id"]).Id,txtPreparacion.Text,null);
                    
                bool resp = r1.modRes();
                

                if (resp)
                {
                    
                    foreach (string idIngDel in delList)
                    {
                        RecetaIngredientes rein = new RecetaIngredientes(idr, idIngDel);
                        rein.delRecIng();
                    }
                    msg.Text = ("Modificado ");
                    
                }
                else
                {
                    msg.Text = ("No se ha modificado");
                }
            }
            else
            {
                Receta r1 = new Receta(txtName.Text, ((Chef)Session["Id"]).Id, txtPreparacion.Text);
                bool resp = r1.saveRes();
                if (resp)
                {
                    msg.Text=("Guardado");
                    idr = r1.Id;
                }
                else
                {
                    msg.Text = ("No se ha guardado");
                }
            }
            foreach(string[] item in dataInfo)
            {
                if (item[4] == "add")
                {
                   RecetaIngredientes ri=new RecetaIngredientes(idr, item[3],item[2]);
                    ri.saveRecIng();
                }
            }

        }
        protected void btn_nuevoIng(object sender, EventArgs e)
        {
            saveState();
            Response.Redirect("NuevoIngrediente.aspx", false);
        }

        public void saveState()
        {
            saveInfo info = new saveInfo();
            info.nombre = txtName.Text;
            info.prep = txtPreparacion.Text;
            info.ing = dataInfo;
            info.idRec = idRec.Text;
            Session["fromNew"] = info;
        }




    }

    class saveInfo
    {
        public string nombre;
        public List<string[]> ing;
        public string prep;
        public string idRec;
    }
}