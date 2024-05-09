using cursed.Model;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace cursed.View
{
    /// <summary>
    /// Interaction logic for AdminAddComputerPage.xaml
    /// </summary>
    public partial class AdminAddComputerPage : Page
    {
        Core db = new Core();
        List<ComputerTypes> computerTypes = new List<ComputerTypes>();
        List<Components> components = new List<Components>();

        public AdminAddComputerPage()
        {
            InitializeComponent();
            components = db.context.Components.ToList();
            computerTypes = db.context.ComputerTypes.ToList();
            ComputerTypeComboBox.ItemsSource = computerTypes.Select(x => x.ComputerTypeName).ToList();
            ProcessorComboBox.ItemsSource = components.Where(x => x.ComponentTypeId == 1).Select(x => x.ComponentModel).ToList();
            MotherboardComboBox.ItemsSource = components.Where(x => x.ComponentTypeId == 2).Select(x => x.ComponentModel).ToList();
            VideoCardComboBox.ItemsSource = components.Where(x => x.ComponentTypeId == 3).Select(x => x.ComponentModel).ToList();
            RAMComboBox.ItemsSource = components.Where(x => x.ComponentTypeId == 4).Select(x => x.ComponentModel).ToList();
            CapacityComboBox.ItemsSource = components.Where(x => x.ComponentTypeId == 5).Select(x => x.ComponentModel).ToList();
            CPUCoolerComboBox.ItemsSource = components.Where(x => x.ComponentTypeId == 6).Select(x => x.ComponentModel).ToList();
            PSUComboBox.ItemsSource = components.Where(x => x.ComponentTypeId == 7).Select(x => x.ComponentModel).ToList();
            NetworkCardComboBox.ItemsSource = components.Where(x => x.ComponentTypeId == 8).Select(x => x.ComponentModel).ToList();
            SoundCardComboBox.ItemsSource = components.Where(x => x.ComponentTypeId == 9).Select(x => x.ComponentModel).ToList();
        }

        private void AddNewComputerButtonClick(object sender, RoutedEventArgs e)
        {

        }

        private void CancelButtonClick(object sender, RoutedEventArgs e)
        {

        }
    }
}
