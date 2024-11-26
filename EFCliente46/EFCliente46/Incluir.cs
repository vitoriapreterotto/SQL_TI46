using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFCliente46
{
    internal class Incluir
    {
        public void incluir()
        {
            string Nome, Endereco, Cidade, Telefone;

            Console.WriteLine("Digite o seu nome: ");
            Nome = Console.ReadLine();
            Console.WriteLine("Digite seu longadouro: ");
            Endereco = Console.ReadLine();
            Console.WriteLine("Digite a sua Cidade: ");
            Cidade = Console.ReadLine();
            Console.WriteLine("Insira o seu celular: ");
            Telefone = Console.ReadLine();

            using (var contexto = new CadastroClientesEntities())
            {
                contexto.Cadastro.Add(new Cadastro
                {
                    NomeCliente = Nome,
                    Endereco = Endereco,
                    Cidade = Cidade,
                    TelefoneContato = Telefone
                });
                contexto.SaveChanges();
            }
        }
    }
}
