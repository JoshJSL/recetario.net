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
            bindtoddl();
        }

        private void bindtoddl()
        {
            SqlCommand cm;


            List<DataSet> listreceta = new List<DataSet>();


            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                

                

                conn.Open();

                cm = new SqlCommand("select nombre from receta", conn);

                SqlDataReader rdr = cm.ExecuteReader();

                rdr.Read();

                //string cmd = "select nombre from receta where id_receta = 'R001'";
                //SqlDataAdapter sda = new SqlDataAdapter(cmd, conn);
                //ds = new DataSet();
                //sda.Fill(ds);

                //listreceta.Add(ds);
                receta1.Text = rdr["nombre"].ToString();
               
                //receta2.Text = listreceta[1].ToString();
                //receta3.Text = listreceta[2].ToString();

            }

            //SqlCommand cm = new SqlCommand("select nombre from receta where id_receta = 'R001'");



        }
    }
}