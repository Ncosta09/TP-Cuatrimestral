using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TPC_Dominio
{
    public class Articulo
    {
        public int Id { get; set; }
        public int Cantidad { get; set; }
        public string Codigo { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public decimal Precio { get; set; }
        public int Stock { get; set; }
        public string ImgUrl { get; set; }
        public string ImgUrl2 { get; set; }
        public Talle Talle { get; set; }
        public Categoria Categoria { get; set; }
        public Marca Marca { get; set; }
        public bool Estado { get; set; }
    }
}
