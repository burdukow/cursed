using cursed.Model;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Controls;

namespace cursed.View
{
    /// <summary>
    /// Interaction logic for ComputerPage.xaml
    /// </summary>
    public partial class ComputerPage : Page
    {
        Core db = new Core();
        List<Components> arrayComponents;
        List<ComputerComponentRelationship> arrayComputerComponentRelationship = new List<ComputerComponentRelationship>();
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
            arrayComputerComponentRelationship = db.context.ComputerComponentRelationship.ToList();

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

        private void RemoveComputerButton_Click(object sender, System.Windows.RoutedEventArgs e)
        {

        }
    }
}
