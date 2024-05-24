using cursed.Model;
using cursed.ViewModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Windows.Controls;
using System.Windows.Media.Imaging;

namespace cursed.View
{
    /// <summary>
    /// Логика взаимодействия для WarrantyPage.xaml
    /// </summary>
    public partial class WarrantyPage : Page
    {
        Core db = new Core();
        List<Orders> orderList = new List<Orders>();
        public WarrantyPage()
        {
            InitializeComponent();
            orderList = db.context.Orders.ToList();
        }

        private void CodeWarrantyButtonCLick(object sender, System.Windows.RoutedEventArgs e)
        {
            if(orderList.Where(x => x.OrderCode == CodeTextBox.Text).First() != null)
            {
                Orders order = orderList.Where(x => x.OrderCode == CodeTextBox.Text).First();
                ShowInfo(order);
            }
        }
        private void ShowInfo(Orders order)
        {
            WarrantyCodeStackPanel.Visibility = System.Windows.Visibility.Collapsed;
            WarrantyInfoStackPanel.Visibility = System.Windows.Visibility.Visible;
            ComputerNameTextBlock.Text = db.context.Computers.Where(x => x.ComputerId == order.ComputerId).FirstOrDefault().ComputerName;
            ComputerComponentTextBlock.Text = "Проблема с: " +
                db.context.Components.Where(x => x.IdComponent == order.ComponentId).FirstOrDefault().ComponentTypes.ComponentTypeName + " " +
                db.context.Manufacturers.Where(x => x.IdManufacturer == db.context.Components.Where(y => y.IdComponent == order.ComponentId).FirstOrDefault().ComponentManufacturerId).FirstOrDefault().ManufacturerName + " " +
                db.context.Components.Where(x => x.IdComponent == order.ComponentId).FirstOrDefault().ComponentModel;
            WarrantyDescTextBlock.Text = "Описание:\n" + order.OrderDescription;
            string master = db.context.Users.Where(x => x.IdUser == order.MasterId).FirstOrDefault() == null ? null : db.context.Users.Where(x => x.IdUser == order.MasterId).FirstOrDefault().LastName + " " + db.context.Users.Where(x => x.IdUser == order.MasterId).FirstOrDefault().FirstName;
            MasterTextBlock.Text = master != null? master : "Мастер не назначен";
            string orderStatus = db.context.OrderStatuses.Where(x => x.IdOrderStatus == order.OrderStatusId).Select(x => x.OrderStatusName).First();
            OrderStatusTextBlock.Text = orderStatus;
            string orderExecDate = order.OrderExecDate.ToString();
            OrderDateExecTextBlock.Text = orderExecDate != null ? orderExecDate : "Дата не указана";
            Computers computer = db.context.Computers.Where(x => x.ComputerId == order.ComputerId).FirstOrDefault();
            string filename = computer.ComputerPicPath;
            string compImagePath = @"../../Resources/Images/Computers/" + filename;
            ComputerImage.Source = new BitmapImage(new Uri(compImagePath, UriKind.Relative));
        }
    }
}
