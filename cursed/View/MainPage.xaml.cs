using cursed.Model;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace cursed.View
{
    /// <summary>
    /// Логика взаимодействия для MainPage.xaml
    /// </summary>
    public partial class MainPage : Page
    {
        Core db = new Core();
        List<Computers> arrayComputers;
        List<ComputerTypes> arrayComputerTypes;
        int idRole = Properties.Settings.Default.idRole;
        public MainPage()
        {
            InitializeComponent();
            if (idRole == 1)
            {
                AdminStackPanel.Visibility = Visibility.Visible;
            }
            arrayComputers = db.context.Computers.ToList();
            arrayComputerTypes = db.context.ComputerTypes.ToList();
            arrayComputerTypes.Add(new ComputerTypes { IdComputerType = 0, ComputerTypeName = "Все типы компьютеров" });
            ComputersListView.ItemsSource = arrayComputers;
            ComputersTypeListView.ItemsSource = arrayComputerTypes;

        }

        private void ComputerPageButtonClick(object sender, RoutedEventArgs e)
        {
            Button button = sender as Button;
            Computers computer = button.DataContext as Computers;
            this.NavigationService.Navigate(new ComputerPage(computer));
        }

        private void ComputerTypePageButtonClick(object sender, RoutedEventArgs e)
        {
            Button button = sender as Button;
            ComputerTypes computerType = button.DataContext as ComputerTypes;
            if (computerType.IdComputerType == 0)
            {

                ComputersListView.ItemsSource = arrayComputers;
            }
            else
            {
                ComputersListView.ItemsSource = arrayComputers.Where(c => c.ComputerTypeId == computerType.IdComputerType).ToList();
            }
        }
    }
}
