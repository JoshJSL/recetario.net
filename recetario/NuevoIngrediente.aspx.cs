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

        private DataSet dst;
        public List<DataSet> lr = new List<DataSet>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataSet dst = Datos();
                GridView2.DataSource = dst;
                GridView2.DataBind();

            }
        }

        protected void Eliminar(object sender, GridViewDeleteEventArgs e)
        {
            lr.Add(Datos());
            Receta r = new Receta(e.RowIndex.ToString());
            bool m = r.delChef();
            //DataTable dt = new DataTable();
            //dt.Rows.RemoveAt(Convert.ToInt32(e.RowIndex));
            int i = Convert.ToInt32(e.RowIndex);
            lr.RemoveAt(i);

            if (m == true)
            {
                Response.Write("Se elimino correctamente");
            }
            GridView2.DataSource = lr;
            GridView2.DataBind();
        }


        public DataSet Datos()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string query = "select a.id_ingrediente, a.nombre, b.nombre as 'categoria' from ingrediente as a inner join categoria as b on a.id_categoria = b.id_categoria";
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                dst = new DataSet();
                adapter.Fill(dst);
                return dst;
            }
        }


        protected void btn_guardar_ingrediente(object sender, EventArgs e)
        {
            Ingrediente i1 = new Ingrediente(txtName.Text, txtCategory.Text);
            bool resp = r1.saveRes();
            if (resp)
            {
                Response.Write("Guardado");
            }
        }
    }

   
}
