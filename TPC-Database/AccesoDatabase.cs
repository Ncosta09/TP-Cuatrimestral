using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace TPC_Database
{
    public class AccesoDatabase
    {
        private SqlConnection Conexion;

        private SqlCommand Comando;
        public SqlDataReader Lector { get; set; }
        public AccesoDatabase()
        {
            Conexion = new SqlConnection("server=.\\SQLEXPRESS; database=ECOMMERCE_DB; integrated security=true");
            Comando = new SqlCommand();
        }
        public void SetConsulta(string Consulta)
        {
            Comando.CommandType = System.Data.CommandType.Text;
            Comando.CommandText = Consulta;
        }
        public void EjecutarLectura()
        {
            Comando.Connection = Conexion;
            try
            {
                Conexion.Open();
                Lector = Comando.ExecuteReader();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void EjecutarAccion()
        {
            Comando.Connection = Conexion;
            try
            {
                Conexion.Open();
                Comando.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void SetParametro(string Nombre, object Valor)
        {
            Comando.Parameters.AddWithValue(Nombre, Valor);
        }
        public void CerrarConexion()
        {
            if (Lector != null) Lector.Close();
            Conexion.Close();
        }
    }
}
