using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TPC_Dominio
{
    //Lo puedo hacer asi o puedo sacar la herencia y agregar un IdPersona 
    public class Usuario : Cliente        
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public bool Tipo { get; set; }
    }
}
