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
    public partial class ListaRecetas : System.Web.UI.Page
    {
        private DataSet dst;
        public List<DataSet> lr = new List<DataSet>();
        protected GridView GridView1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataSet dst = Datos();
                    GridView1.DataSource = dst;
                    GridView1.DataBind();
                
            }
        }
        protected void Editar(object sender, GridViewEditEventArgs e)
        {
            Response.Redirect("");
        }
        protected void Eliminar(object sender, GridViewDeleteEventArgs e)
        {
            lr.Add(Datos());
            string id = GridView1.Rows[e.RowIndex].Cells[0].Text;
            Receta r = new Receta(id);
            bool m = r.delChef();
            //DataTable dt = new DataTable();
            //dt.Rows.RemoveAt(Convert.ToInt32(e.RowIndex));
            int i = Convert.ToInt32(e.RowIndex);
            lr.RemoveAt(i);
            
            if (m == true)
            {
                Response.Write("Se elimino correctamente");
            }
            GridView1.DataSource = lr;
            GridView1.DataBind();
        }
        public DataSet Datos()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string query = "select * from receta";
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                dst = new DataSet();
                adapter.Fill(dst);
                return dst;
            }
        }
    }
}