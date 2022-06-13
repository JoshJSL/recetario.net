using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace recetario
{
    public class Ingrediente
    {
        public int IdCategoria { get; set; }
        public string Nombre { get; set; }
        public string Id { get; set; }

        public Ingrediente(string id)
        {
            Id = id;
            getIng();
        }

        public Ingrediente(string nombre, int idCategoria)
        {
            Nombre = nombre;
            IdCategoria = idCategoria;
        }
        public Ingrediente(string id, string nombre, int idCategoria)
        {
            Id=id;
            Nombre = nombre;
            IdCategoria = idCategoria;
        }
        public bool delIng()
        {
            bool res;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string query = "exec deleteIngrediente '" + Id + "'";

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
                    Id = null;
                    res= true;

                }
            }
            return res;
        }

        public bool modIng()
        {
            bool res;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string query = "exec modIngrediente '" + Id + "', '" + Nombre + "', "+IdCategoria+" ";

                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                DataSet dst = new DataSet();
                adapter.Fill(dst);

                res = (Convert.ToInt32(dst.Tables[0].Rows[0]["result"]) != 0);

            }
            return res;
        }

        public bool saveIng()
        {
            bool res;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string query = "select TOP 1 id_ingrediente from ingrediente order by id_ingrediente DESC";
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                DataSet dst = new DataSet();
                adapter.Fill(dst);
                if (dst.Tables[0].Rows.Count == 0)
                {
                    Id = "I0001";
                }
                else
                {
                    string id = ((Convert.ToInt32((dst.Tables[0].Rows[0][0] + "").Substring(1))) + 1) + "";

                    Id = "I" + (id.Length == 1 ? "00" : id.Length == 2 ? "0" : "") + id;
                }

                query = "exec saveIngrediente '" + Id + "', '" + Nombre+ "', " + IdCategoria+" ";
                adapter = new SqlDataAdapter(query, conn);
                dst = new DataSet();
                adapter.Fill(dst);

                if (Convert.ToInt32(dst.Tables[0].Rows[0]["result"]) == 0)
                {
                    Id = null;
                    res= false;
                }
                else
                {
                    res= true;
                }
            }
            return res;

        }
        private void getIng()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string query = "select * from ingrediente where id_ingrediente='"+Id+"'";
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                DataSet dst = new DataSet();
                adapter.Fill(dst);

                if (dst.Tables[0].Rows.Count == 1)
                {
                    IdCategoria=Convert.ToInt32(dst.Tables[0].Rows[0]["id_categoria"]);
                    Nombre = dst.Tables[0].Rows[0]["nombre"] + "";
                }

            }
        }
        public static Ingrediente[] getIngCat(int idCategoria)
        {
            Ingrediente[] ing;


            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string query = "select * from ingrediente where id_categoria= "  + idCategoria + " ";
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                DataSet dst = new DataSet();
                adapter.Fill(dst);

                ing = new Ingrediente[dst.Tables[0].Rows.Count];
                for (int i = 0; i < dst.Tables[0].Rows.Count; i++)
                {
                    ing[i] = new Ingrediente(dst.Tables[0].Rows[i]["id_ingrediente"] + "", dst.Tables[0].Rows[i]["nombre"] + "", Convert.ToInt32(dst.Tables[0].Rows[i]["id_categoria"]));
                }


            }
            return ing;
        }
        public static DataSet getAllIngDatSetCat(string restriciones="")
        {
            DataSet dst;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string query = "select i.nombre as 'nomIng', c.nombre as 'nomCat', i.id_categoria, i.id_ingrediente from ingrediente i inner join categoria c on c.id_categoria = i.id_categoria" + restriciones + " ";
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                dst = new DataSet();
                adapter.Fill(dst);

            }
            return dst;
        }
    }
}