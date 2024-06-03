using cursed.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Controls;
using System.Windows.Media.Imaging;

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
        int idRole = Properties.Settings.Default.idRole;
        public ComputerPage(Computers computer)
        {
            InitializeComponent();
            currentComputer = computer;
            ComputerNameTextBlock.Text = computer.ComputerName;
            ComponentBinding();
            string filename = computer.ComputerPicPath;
            //string compImagePath = @"../../Resources/Images/Computers/" + filename;
            ComputerImage.Source = new BitmapImage(new Uri(filename, UriKind.RelativeOrAbsolute));
            if (idRole == 1)
            {
                AdminControlsStackPanel.Visibility = System.Windows.Visibility.Visible;
            }
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
            try
            {
                db.context.Computers.Remove(db.context.Computers.Where(x => x.ComputerId == currentComputer.ComputerId).FirstOrDefault());
                db.context.SaveChanges();
                
            }
            catch{}
            this.NavigationService.Navigate(new MainPage());
        }
    }
}
