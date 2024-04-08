using cursed.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
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

        }
    }
}
