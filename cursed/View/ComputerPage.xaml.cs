using cursed.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace cursed.View
{
    /// <summary>
    /// Interaction logic for ComputerPage.xaml
    /// </summary>
    public partial class ComputerPage : Page
    {
        Core db = new Core();
        List<Components> arrayComponents;
        List<Computer_Component_Relationship> arrayComputerComponentRelationship = new List<Computer_Component_Relationship>();
        string computerSpecification;
        Computers currentComputer;
        public ComputerPage(Computers computer)
        {
            InitializeComponent();
            currentComputer = computer;
            ComputerNameTextBlock.Text = computer.ComputerName;
            ComponentBinding();
        }
        private void ComponentBinding()
        {
            arrayComputerComponentRelationship = db.context.Computer_Component_Relationship.ToList();

            var componentIds = arrayComputerComponentRelationship
                .Where(cr => cr.ComputerId == currentComputer.ComputerId)
                .Select(cr => cr.ComponentId)
                .ToList();

            arrayComponents = db.context.Components
                .Where(c => componentIds.Contains(c.IdComponent))
                .ToList();

            foreach (var component in arrayComponents)
            {
                var componentInfo = db.context.Components
                    .Where(c => c.IdComponent == component.IdComponent)
                    .Join(db.context.Manufacturers,
                        comp => comp.ComponentManufacturerId,
                        manuf => manuf.IdManufacturer,
                        (comp, manuf) => new { Component = comp, Manufacturer = manuf })
                    .FirstOrDefault();

                if (componentInfo != null)
                {
                    computerSpecification += $"{db.context.ComponentTypes.FirstOrDefault(ct => ct.IdComponentType == component.ComponentTypeId)?.ComponentTypeName}:  {componentInfo.Manufacturer.ManufacturerName + " " + componentInfo.Component.ComponentModel}\n";
                }
            }

            ComputerComponentsTextBlock.Text = computerSpecification;
        }
    }
}
