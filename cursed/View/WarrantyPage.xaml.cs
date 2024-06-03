using cursed.Model;
using cursed.ViewModel;
using Microsoft.Office.Interop.Word;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Markup;
using System.Windows.Media.Imaging;

namespace cursed.View
{
    /// <summary>
    /// Логика взаимодействия для WarrantyPage.xaml
    /// </summary>
    public partial class WarrantyPage : System.Windows.Controls.Page
    {
        Core db = new Core();
        List<Orders> orderList = new List<Orders>();
        Orders currOrder = new Orders();
        public WarrantyPage()
        {
            InitializeComponent();
            orderList = db.context.Orders.ToList();
        }

        private void CodeWarrantyButtonCLick(object sender, System.Windows.RoutedEventArgs e)
        {
            if (orderList.Where(x => x.OrderCode == CodeTextBox.Text).FirstOrDefault() != null)
            {
                Orders order = orderList.Where(x => x.OrderCode == CodeTextBox.Text).First();
                ShowInfo(order);
            }
            else
            {
                MessageBox.Show("Заявка не найдена");
            }
        }
        private void ShowInfo(Orders order)
        {
            currOrder = order;
            WarrantyCodeStackPanel.Visibility = System.Windows.Visibility.Collapsed;
            WarrantyInfoStackPanel.Visibility = System.Windows.Visibility.Visible;
            ComputerNameTextBlock.Text = db.context.Computers.Where(x => x.ComputerId == order.ComputerId).FirstOrDefault().ComputerName;
            ComputerComponentTextBlock.Text = "Проблема с: " +
                db.context.Components.Where(x => x.IdComponent == order.ComponentId).FirstOrDefault().ComponentTypes.ComponentTypeName + " " +
                db.context.Manufacturers.Where(x => x.IdManufacturer == db.context.Components.Where(y => y.IdComponent == order.ComponentId).FirstOrDefault().ComponentManufacturerId).FirstOrDefault().ManufacturerName + " " +
                db.context.Components.Where(x => x.IdComponent == order.ComponentId).FirstOrDefault().ComponentModel;
            WarrantyDescTextBlock.Text = "Описание:\n" + order.OrderDescription;
            string master = db.context.Users.Where(x => x.IdUser == order.MasterId).FirstOrDefault() == null ? null : db.context.Users.Where(x => x.IdUser == order.MasterId).FirstOrDefault().LastName + " " + db.context.Users.Where(x => x.IdUser == order.MasterId).FirstOrDefault().FirstName;
            MasterTextBlock.Text = master != null ? master : "Мастер не назначен";
            string orderStatus = db.context.OrderStatuses.Where(x => x.IdOrderStatus == order.OrderStatusId).Select(x => x.OrderStatusName).First();
            OrderStatusTextBlock.Text = orderStatus;
            if (orderStatus == "Готов, ожидает клиента")
                GenerateWarrantyButton.Visibility = System.Windows.Visibility.Visible;
            string orderExecDate = order.OrderExecDate.ToString();
            OrderDateExecTextBlock.Text = orderExecDate != null ? orderExecDate : "Дата не указана";
            Computers computer = db.context.Computers.Where(x => x.ComputerId == order.ComputerId).FirstOrDefault();
            string filename = computer.ComputerPicPath;
            ComputerImage.Source = new BitmapImage(new Uri(filename, UriKind.RelativeOrAbsolute));
        }

        private void GenerateWarrantyButtonCLick(object sender, RoutedEventArgs e)
        {
            MessageBoxResult dialog = MessageBox.Show("Желаете сохранить гарантийный талон?", "Гарантийный талон", MessageBoxButton.YesNo);
            if (dialog == MessageBoxResult.Yes)
            {
                Microsoft.Win32.SaveFileDialog dlg = new Microsoft.Win32.SaveFileDialog();
                dlg.FileName = "Гарантийный талон";
                dlg.DefaultExt = ".txt";
                dlg.Filter = "Office Files|*.doc;*.docx";
                Nullable<bool> result = dlg.ShowDialog();
                var warrantyData = new Dictionary<string, string>
                {
                    {"<IdOrder>", currOrder.IdOrder.ToString()},
                    {"<PcName>", db.context.Computers.Where(x => x.ComputerId == currOrder.ComputerId).FirstOrDefault().ComputerName},
                    {"<ModelName>", db.context.Components.Where(x => x.IdComponent == currOrder.ComponentId).FirstOrDefault().ComponentModel},
                    {"<Article>", db.context.Components.Where(x => x.IdComponent == currOrder.ComponentId).FirstOrDefault().ComponentArticle},
                    {"<WarrantyExecDate>", currOrder.OrderExecDate.Value .ToString("dd.MM.yyyy")},
                    {"<Master>", db.context.Users.Where(x => x.IdUser == currOrder.MasterId).FirstOrDefault().LastName + " " + db.context.Users.Where(x => x.IdUser == currOrder.MasterId).FirstOrDefault().FirstName},
                    {"<ComponentPrice>", db.context.Components.Where(x => x.IdComponent == currOrder.ComponentId).FirstOrDefault().ComponentPrice.ToString() + " руб." },
                    {"<Description>", currOrder.OrderDescription}
                };
                if (result == true)
                {
                    FilesVM.EditWordFile(dlg.FileName, warrantyData);
                }
            }
           
        }
}
}
