using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFCliente46
{
    internal class Consulta
    {
        public void consulta()
        {
            using (var contexto = new CadastroClientesEntities()) 
            {
                var Cadastro = contexto.Cadastro.ToList();

                foreach (var cadastro in Cadastro)
                {
                    Console.WriteLine($"ID: {cadastro.Cliente_ID}, " +
                        $"Nome: {cadastro.NomeCliente}, " +
                        $"Endereço: {cadastro.Endereco}, " +
                        $"Cidade: {cadastro.Cidade}, " +
                        $"Telefone: {cadastro.TelefoneContato}");
                }
            }
            Console.ReadKey();
        }
    }
}
