using cursed.Model;
using System.Linq;
using System.Threading.Tasks;

namespace cursed.ViewModel
{
    public class ComputerVM
    {

        /// <summary>
        /// Добавляет связь в таблицу связей компьютер-комплектующее
        /// </summary>
        /// <param name="computerId">Идентификатор компьютера.</param>
        /// <param name="componentName">Название комплектующего.</param>
        public static void addComputerComponentRelationship(int computerId, string componentName)
        {
            Core db = new Core();
            int componentId = db.context.Components.Where(x => x.ComponentModel == componentName).FirstOrDefault().IdComponent;
            ComputerComponentRelationship relationship = new ComputerComponentRelationship()
            {
                ComputerId = computerId,
                ComponentId = componentId
            };
            db.context.ComputerComponentRelationship.Add(relationship);
            db.context.SaveChanges();
        }

        /// <summary>
        /// Создает новый компьютер в базе данных.
        /// </summary>
        /// <param name="compName">Имя компьютера.</param>
        /// <param name="compTypeId">ID типа компьютера.</param>
        /// <param name="CompImage">Путь к изображению компьютера.</param>
        /// <returns>ID созданного компьютера.</returns>
        public static int CreateNewComputer(string compName, int compTypeId, string CompImage)
        {
            Core db = new Core();
            Computers newComp = new Computers
            {
                ComputerName = compName,
                ComputerTypeId = compTypeId,
                ComputerPicPath = CompImage
            };
            db.context.Computers.Add(newComp);
            db.context.SaveChanges();

            return newComp.ComputerId;
        }
    }
}
