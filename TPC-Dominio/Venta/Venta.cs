using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TPC_Dominio
{
    public class Venta
    {
        public int Id { get; set; }
        public decimal Monto { get; set; }
        public string Forma { get; set; }
        public int Cuotas { get; set; }
        public Usuario Usuario { get; set; }
        public Cliente Cliente { get; set; }
        public bool Estado { get; set; }
    }
}
