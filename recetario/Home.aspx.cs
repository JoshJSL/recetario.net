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
    public partial class Home : System.Web.UI.Page
    {
        private DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            Receta[] ress= Receta.getRecetas();
            panel.CssClass = "container";

            foreach (Receta res in ress)
            {
                Panel p = new Panel();
                Panel p2 = new Panel();
                Panel pp = new Panel();
                Label lbl = new Label();
                Button btn = new Button();
                btn.Text = "Check";
                btn.Click += new EventHandler(this.on_check);
                btn.CommandArgument = res.Id;
                lbl.Text = res.Nombre;
                
                p.Controls.Add(lbl);
                
                p2.Controls.Add(btn);
                pp.Controls.Add(p);
                pp.Controls.Add(p2);

                pp.CssClass = "caja caja1";

                panel.Controls.Add(pp);


            }

        }
        
        protected void on_check(object sender, EventArgs e)
        {

        }
    }
}