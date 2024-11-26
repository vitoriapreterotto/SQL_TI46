using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFCliente46
{
    internal class Alterar
    {
        public void alterar()
        {
            using (var contexto = new CadastroClientesEntities())
            {
                Console.WriteLine("Digite o ID do Cliente que deseja alterar: ");
                var busca = contexto.Cadastro.Find(int.Parse(Console.ReadLine()));
                Console.WriteLine(busca.NomeCliente);
                Console.WriteLine(busca.Cidade);
                Console.WriteLine(busca.Cidade);
                Console.WriteLine(busca.TelefoneContato);
                Console.WriteLine("Entre com a correção do nome: ");
                busca.NomeCliente = Console.ReadLine();
                Console.WriteLine("Digite o endereço correto: ");
                busca.Cidade = Console.ReadLine();
                Console.WriteLine("Digite a cidade correta: ");
                busca.Cidade = Console.ReadLine();
                Console.WriteLine("Digite o telefone correto: ");
                busca.TelefoneContato = Console.ReadLine();

                contexto.SaveChanges();
                Console.WriteLine("Cliente atualizado com sucesso!");
            }
        }
    }
}
