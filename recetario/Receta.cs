using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace recetario
{
    public class Receta
    {
        public string Id{ get; set; }
        public string Nombre { get; set; } 
        public string IdAutor { get; set; }
        public string Preparacion { get;set; }
        public RecetaIngredientes[] Ingredientes { get; set;}
        public string NombreAutor { get; set; }

        public Receta (string id)
        {
            Id = id;
            getRec();
        }

        public Receta(string nombre, string idAutor, string preparacion)
        {
            Nombre = nombre;
            IdAutor = idAutor;
            Preparacion = preparacion;
        }

        public Receta(string id, string nombre, string idAutor, string preparacion, RecetaIngredientes[] ingredientes)

        {
            Id = id;
            Nombre= nombre;
            IdAutor=idAutor;
            Preparacion = preparacion;
            Ingredientes = ingredientes;
        }


        public bool deRec()
        {
            bool res;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string query = "exec deleteReceta '" + Id + "'";

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
                    IdAutor = null;
                    Preparacion= null;
                    Id = null;
                    res= true;

                }
            }
            return res;
        }

        public bool modRes()
        {
            bool res;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string query = "exec modReceta '" + Id + "', '" + IdAutor + "', '" + Nombre + "', '" + Preparacion + "'";

                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                DataSet dst = new DataSet();
                adapter.Fill(dst);

                res = (Convert.ToInt32(dst.Tables[0].Rows[0]["result"]) != 0);

            }
            return res;
        }

        public bool saveRes()
        {
            bool res;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string query = "select TOP 1 id_receta from receta order by id_receta DESC";
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                DataSet dst = new DataSet();
                adapter.Fill(dst);
                if (dst.Tables[0].Rows.Count == 0)
                {
                    Id = "R001";
                }
                else
                {
                    string id = ((Convert.ToInt32((dst.Tables[0].Rows[0][0] + "").Substring(1))) + 1) + "";

                    Id = "R" + (id.Length == 1 ? "00" : id.Length == 2 ? "0" : "") + id;
                }

                query = "exec saveReceta '" + Id + "', '" + IdAutor+ "', '" + Nombre+ "', '" + Preparacion+ "'";
                Console.WriteLine(query);
                adapter = new SqlDataAdapter(query, conn);
                dst = new DataSet();
                adapter.Fill(dst);

                if (Convert.ToInt32(dst.Tables[0].Rows[0]["result"]) == 0)
                {
                    Id = null;
                    res = false;
                }
                else
                {
                    res= true;
                }
                return res;

            }

        }

        public void getRec()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string query = "select r.id_autor,r.id_receta,r.nombre,r.preparacion, CONCAT(c.nombre,' ',c.apellido_p,' ',c.apellido_m) as 'autor' from receta r inner join chef c on c.id_chef=r.id_autor where id_receta='" + Id + "'";
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                DataSet dst = new DataSet();
                adapter.Fill(dst);

                if (dst.Tables[0].Rows.Count == 1)
                {
                    Nombre = dst.Tables[0].Rows[0]["nombre"] + "";
                    IdAutor= dst.Tables[0].Rows[0]["id_autor"] + "";
                    Preparacion= dst.Tables[0].Rows[0]["preparacion"] + "";
                    NombreAutor= dst.Tables[0].Rows[0]["autor"] + "";

                    Ingredientes = RecetaIngredientes.getRecIng(Id);
                }

            }
        }
        public static Receta[] getRecetas(string restricicones = "")
        {
            Receta[] res;


            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string query = "select * from receta " + restricicones;
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                DataSet dst = new DataSet();
                adapter.Fill(dst);

                res = new Receta[dst.Tables[0].Rows.Count];
                for (int i = 0; i < dst.Tables[0].Rows.Count; i++)
                {
                    res[i] = new Receta(dst.Tables[0].Rows[i]["id_receta"] + "", dst.Tables[0].Rows[i]["nombre"] + "", dst.Tables[0].Rows[i]["id_autor"] + "", dst.Tables[0].Rows[i]["preparacion"] + "",RecetaIngredientes.getRecIng(dst.Tables[0].Rows[i]["id_receta"]+""));
                }


            }
            return res;
        }

        public static DataSet getRecetasDataSet(string restricciones = "")
        {
            DataSet dst;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string query = "select * from receta " + restricciones;
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                dst = new DataSet();
                adapter.Fill(dst);
            }
            return dst;
        }
    }

}