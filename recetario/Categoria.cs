using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace recetario
{
    public class Categoria
    {
        public int Id { get; set; }
        public string Nombre { get; set; }

        public Categoria(int id)
        {
            Id = id;
            getCat();
        }

        public Categoria(string nombre)
        {
            Nombre = nombre;
        }

        public Categoria(int id, string nombre)
        {
            Id = id;
            Nombre = nombre;
        }

        public bool delCat()
        {
            bool res;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string query = "exec deleteCategoria " + Id + " ";

                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                DataSet dst = new DataSet();
                adapter.Fill(dst);

                if (Convert.ToInt32(dst.Tables[0].Rows[0]["result"]) == 0)
                {
                    res= false;
                }
                else
                {
                    Nombre = null;
                    Id=0;
                    res= true;

                }
            }
            return res;
        }

        public bool modCat()
        {
            bool res;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string query = "exec modCategoria '" + Nombre + "', " + Id + " ";

                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                DataSet dst = new DataSet();
                adapter.Fill(dst);

                res = (Convert.ToInt32(dst.Tables[0].Rows[0]["result"]) != 0);

            }
            return res;
        }

        public bool saveCat()
        {
            bool res;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string query = "exec saveCategoria '" + Nombre + "'";
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                DataSet dst = new DataSet();
                adapter.Fill(dst);

                if (Convert.ToInt32(dst.Tables[0].Rows[0]["result"]) == 0)
                {
                    res = false;
                }
                else
                {
                    Id = Convert.ToInt32(dst.Tables[0].Rows[0]["id"]);
                    res= true;
                }
            }
            return res;

        }
        private void getCat()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string query = "select * from categoria where id_categoria='" + Id + "'";
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                DataSet dst = new DataSet();
                adapter.Fill(dst);

                if (dst.Tables[0].Rows.Count == 1)
                {
                    Nombre = dst.Tables[0].Rows[0]["nombre"] + "";
                }

            }
        }

        public static Categoria[] getAllCat()
        {
            Categoria[] cat;


            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string query = "select * from categoria";
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                DataSet dst = new DataSet();
                adapter.Fill(dst);

                cat = new Categoria[dst.Tables[0].Rows.Count];
                for (int i = 0; i < dst.Tables[0].Rows.Count; i++)
                {
                    cat[i] = new Categoria(Convert.ToInt32(dst.Tables[0].Rows[i]["id_categoria"]), dst.Tables[0].Rows[i]["nombre"] + "");
                }


            }
            return cat;
        }

    }
}