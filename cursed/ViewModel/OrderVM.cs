using cursed.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace cursed.ViewModel
{
    public class OrderVM
    {

        public static Core db = new Core();
        /// <summary>
        /// Генерирует случайный шестисимвольный код, состоящий из цифр и букв (в верхнем и нижнем регистре).
        /// </summary>
        /// <returns>Сгенерированный код.</returns>
        private static string GenerateCode()
        {
            string symbols = "1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPSDFGHJKLZXCVBNM";
            string generatedCode = "";

            Random random = new Random();

            for (int i = 0; i < 6; i++)
            {
                int minValue = 0;
                int maxValue = symbols.Length - 1;
                generatedCode += symbols[random.Next(minValue, maxValue)];
            }
            return generatedCode;
        }

        /// <summary>
        /// Создает новую заявку на ремонт.
        /// </summary>
        /// <param name="ComponentTypeProblem">Название типа комплектующего, с которым проблема.</param>
        /// <param name="problemDescription">Описание проблемы.</param>
        /// <param name="computerProblem">Название компьютера, на котором возникла проблема.</param>
        /// <returns>True, если заявка успешно создана, иначе False.</returns>
        /// <exception cref="Exception">
        /// Выбрасывается, если:
        /// - Не выбран тип комплектующего.
        /// - Не указана информация о проблеме.
        /// - Не выбран компьютер.
        /// - Не найдено комплектующее по указанному названию.
        /// </exception>
        public static bool CreateOrder(string ComponentTypeProblem, string problemDescription, string computerProblem)
        {
            List<Computers> arrayComputers = new List<Computers>();
            List<ComponentTypes> componentTypes = new List<ComponentTypes>();
            arrayComputers = db.context.Computers.ToList();
            componentTypes = db.context.ComponentTypes.ToList();
            if (ComponentTypeProblem == string.Empty)
            {
                throw new Exception("Не выбран тип комплектующего.");
            }
            if (problemDescription == string.Empty)
            {
                throw new Exception("Не указана информация о проблеме.");
            }
            if (computerProblem == string.Empty)
            {
                throw new Exception("Не выбран компьютер.");
            }

            var component = (from type in db.context.ComponentTypes
                             where type.ComponentTypeName == ComponentTypeProblem
                             select type.Components.FirstOrDefault()).FirstOrDefault();
            if (component != null)
            {
                string code = GenerateCode();
                while (db.context.Orders.Any(x => x.OrderCode == code))
                { code = GenerateCode(); }
                Orders newOrder = new Orders()
                {
                    OrderDescription = problemDescription,
                    ComponentId = component.IdComponent,
                    ComputerId = arrayComputers.Where(x => x.ComputerName == computerProblem).FirstOrDefault().ComputerId,
                    OrderStatusId = 4,
                    OrderCode = code
                };
                db.context.Orders.Add(newOrder);
                db.context.SaveChanges();
            }
            else
            {
                throw new Exception();
            }
            return true;
        }

    }
}
