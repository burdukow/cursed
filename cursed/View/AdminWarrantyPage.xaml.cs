using cursed.Model;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace cursed.View
{
    /// <summary>
    /// Interaction logic for AdminWarrantyPage.xaml
    /// </summary>
    public partial class AdminWarrantyPage : Page
    {
        Core db = new Core();
        List<Orders> orderList = new List<Orders>();
        public AdminWarrantyPage()
        {
            InitializeComponent();
            orderList = db.context.Orders.Include("Computers").Include("Components").ToList();
            WarrantyListView.ItemsSource = orderList;
        }

        private void WarrantyButtonClick(object sender, RoutedEventArgs e)
        {
            Button button = sender as Button;
            Orders order = button.DataContext as Orders;
            this.NavigationService.Navigate(new AdminWarrantyDescPage(order));
        }

    }
}
