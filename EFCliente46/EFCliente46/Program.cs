using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFCliente46
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string opcao;

            Incluir incluir = new Incluir();
            Alterar alterar = new Alterar();
            Deletar deletar = new Deletar();
            Consulta consulta = new Consulta();

            do
            {

                Console.WriteLine("1 - Cadastre um novo cliente");
                Console.WriteLine("2 - Altere os dados do cliente");
                Console.WriteLine("3 - Delete o cadastro de um cliente");
                Console.WriteLine("4 - Consulte um cliente");

                int escolha = Convert.ToInt32(Console.ReadLine());


                switch (escolha)
                {
                    case 1:
                        incluir.incluir();
                        break;

                    case 2:
                        alterar.alterar();
                        break;

                    case 3:
                        deletar.deletar();
                        break;

                    case 4:
                        consulta.consulta();
                        break;

                    default:
                        Console.WriteLine("Operação inválida.");
                        break;
                }

                Console.WriteLine("Deseja continuar no programa? (S/N)");
                opcao = Console.ReadLine().ToUpper();

            } while (opcao == "S");


        }
        

    }
}
