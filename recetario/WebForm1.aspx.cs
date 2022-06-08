using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace recetario
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private DataSet dst;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
                {
                    string query = "select * from receta";
                    SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                    
                    dst = new DataSet();
                    adapter.Fill(dst);

                    gridRes.DataSource = dst;
                    gridRes.DataBind();

                    query = "select * from categoria";
                    adapter = new SqlDataAdapter(query, conn);
                    dst = new DataSet();
                    adapter.Fill(dst);
                    gridTipo.DataSource = dst;
                    gridTipo.DataBind();

                    query = "select * from ingrediente";
                    adapter = new SqlDataAdapter(query, conn);
                    dst = new DataSet();
                    adapter.Fill(dst);
                    gridIng.DataSource = dst;
                    gridIng.DataBind();

                    query = "select * from chef";
                    adapter = new SqlDataAdapter(query, conn);
                    dst = new DataSet();
                    adapter.Fill(dst);
                    gridChe.DataSource = dst;
                    gridChe.DataBind();
                }
                Chef cf = new Chef("C3", "123");
                //label.Text= cf.isValidChef() +"  "+cf.delChef();
            }
        }

    }
}