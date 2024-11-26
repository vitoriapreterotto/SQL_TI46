using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFCliente46
{
    internal class Deletar
    {
        public void deletar()
        {
            using (var contexto = new CadastroClientesEntities())
            {
                Console.WriteLine("Digite o ID do Cliente que deseja apagar: ");
                var busca = contexto.Cadastro.Find(int.Parse(Console.ReadLine()));
                Console.WriteLine($"Você deseja apagar o Cliente {busca.NomeCliente}? Digite S para apagar ou N para anular");
                var apaga = Console.ReadLine();

                if (apaga == "S")
                {
                    contexto.Cadastro.Remove(busca);
                    contexto.SaveChanges();
                    Console.WriteLine("Cliente excluído com sucesso!");
                }
                else
                {
                    Console.WriteLine("Operação cancelada!");
                }
            }
        }
    }
}
