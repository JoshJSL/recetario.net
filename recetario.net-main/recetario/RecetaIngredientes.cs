using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace recetario
{
    public class RecetaIngredientes
    {
        public string IdReceta { get; set; }
        public string IdIngrediente { get; set;}
        public string Cantidad { get; set; }

        public RecetaIngredientes(string idReceta, string idIngrediente, string cantidad)
        {
            IdIngrediente = idIngrediente ;
            IdReceta = idReceta;
            Cantidad = cantidad;
        }
        public bool delRecIng()
        {
            bool res;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string query = "exec deleteRecetaIngrediente  '" + IdReceta + "', '" + IdIngrediente + "'";

                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                DataSet dst = new DataSet();
                adapter.Fill(dst);

                if (Convert.ToInt32(dst.Tables[0].Rows[0]["result"]) == 0)
                {
                    res= false;
                }
                else
                {
                    IdIngrediente = null;
                    IdReceta = null;
                    Cantidad=null;
                    res= true;

                }
            }
            return res;
        }

        public bool modRecIng()
        {
            bool res;

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string query = "exec modRecetaIngrediente '" + IdReceta + "', '" + IdIngrediente + "', '" + Cantidad + " '";

                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                DataSet dst = new DataSet();
                adapter.Fill(dst);

                res = (Convert.ToInt32(dst.Tables[0].Rows[0]["result"]) != 0);

            }
            return res;
        }

        public bool saveRecIng()
        {
            bool res;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string query = "exec saveRecetaIngrediente '" + IdReceta + "', '" + IdIngrediente + "', '" + Cantidad+" '";
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                DataSet dst = new DataSet();
                adapter.Fill(dst);

                res = (Convert.ToInt32(dst.Tables[0].Rows[0]["result"])!=0);
                
            }

            return res;

        }

        public static RecetaIngredientes[] getRecIng(string idReceta)
        {
            RecetaIngredientes[] recIng;


            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string query = "select * from recetaIngredientes where id_receta = '"+idReceta+"'";
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                DataSet dst = new DataSet();
                adapter.Fill(dst);

                recIng = new RecetaIngredientes[dst.Tables[0].Rows.Count];
                for (int i = 0; i < dst.Tables[0].Rows.Count; i++)
                {
                    recIng[i] = new RecetaIngredientes(dst.Tables[0].Rows[i]["id_receta"] + "", dst.Tables[0].Rows[i]["id_ingrediente"] + "", dst.Tables[0].Rows[i]["cantidad"] + "");
                }

                
            }
            return recIng;
        }
    }
}