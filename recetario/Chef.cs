using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace recetario
{
    public class Chef
    {
        public string Id { get; set; }
        public string Nombre { get; set; }
        public string ApellidoPat { get; set; }
        public string ApellidoMat { get; set; }
        public string Contrasenia { get; set; }

        public Chef(string idChef, string contrasenia)
        {
            Id = idChef;
            Contrasenia=contrasenia;
        }

        public Chef(string nombre, string apellidoPat, string apellidoMat, string contrasenia )
        {
            Nombre=nombre;
            ApellidoPat=apellidoPat;
            ApellidoMat=apellidoMat;
            Contrasenia = contrasenia;
            Id = null;
        }
        public bool delChef()
        {
            bool res;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string query = "exec deleteChef '" + Id + "'";

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
                    ApellidoMat = null;
                    ApellidoPat = null;
                    Id = null;
                    Contrasenia = null;
                    res= true;

                }
            }
            return res;
        }

        public bool modChef()
        {
            bool res;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string query = "exec modChef '" + Nombre + "', '" + ApellidoPat + "', '" + ApellidoMat + "', '" + Contrasenia + "', '" + Id+ "'";

                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                DataSet dst = new DataSet();
                adapter.Fill(dst);

                res = (Convert.ToInt32(dst.Tables[0].Rows[0]["result"]) != 0);

            }
            return res;
        }

        public bool saveChef()
        {
            bool res;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string query = "select TOP 1 id_chef from chef order by id_chef DESC";
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                DataSet dst = new DataSet();
                adapter.Fill(dst);
                if (dst.Tables[0].Rows.Count == 0)
                {
                    Id = "C0001";
                }
                else
                {
                    string id = ((Convert.ToInt32((dst.Tables[0].Rows[0][0] + "").Substring(1))) + 1)+"";

                    Id = "C"+(id.Length==1?"00": id.Length == 2?"0":"")+id;
                }

                query = "exec saveChef '" + Nombre + "', '" + ApellidoPat + "', '" + ApellidoMat + "', '" + Contrasenia + "', '" + Id+ "'"; 
                adapter = new SqlDataAdapter(query, conn);
                dst = new DataSet();
                adapter.Fill(dst);

                res = (Convert.ToInt32(dst.Tables[0].Rows[0]["result"]) != 0);

            }
            return res;


        }

        public bool isValidChef()
        {
            bool res;

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string query = "select * from chef where id_chef = '" + Id + "' and contrasenia ='"+ Contrasenia + "'";
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                DataSet dst = new DataSet();
                adapter.Fill(dst);
                if (dst.Tables[0].Rows.Count == 0)
                {
                    res = false;
                }
                else
                {
                    Nombre = dst.Tables[0].Rows[0]["nombre"] + "";
                    ApellidoPat = dst.Tables[0].Rows[0]["apellido_p"] + "";
                    ApellidoMat = dst.Tables[0].Rows[0]["apellido_m"] + "";

                    res = true;
                }

            }
            return res;

        }
    }
}