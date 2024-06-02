using cursed.Model;
using cursed.ViewModel;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media.Imaging;

namespace cursed.View
{
    /// <summary>
    /// Логика взаимодействия для AdminWarrantyDescPage.xaml
    /// </summary>
    public partial class AdminWarrantyDescPage : Page
    {
        Core db = new Core();
        private Orders currentOrder;
        public AdminWarrantyDescPage(Orders order)
        {

            InitializeComponent();
            currentOrder = order;
            ComputerNameTextBlock.Text = db.context.Computers.Where(x => x.ComputerId == order.ComputerId).FirstOrDefault().ComputerName;
            ComputerComponentTextBlock.Text = "Проблема с: " +
                db.context.Components.Where(x => x.IdComponent == order.ComponentId).FirstOrDefault().ComponentTypes.ComponentTypeName + " " +
                db.context.Manufacturers.Where(x => x.IdManufacturer == db.context.Components.Where(y => y.IdComponent == order.ComponentId).FirstOrDefault().ComponentManufacturerId).FirstOrDefault().ManufacturerName + " " + 
                db.context.Components.Where(x => x.IdComponent == order.ComponentId).FirstOrDefault().ComponentModel + "\nВ наличии: " + db.context.Components.Where(x => x.IdComponent == order.ComponentId).FirstOrDefault().ComponentAmount + " шт.";
            WarrantyDescTextBlock.Text = "Описание:\n" + order.OrderDescription;
            List<Users> users = db.context.Users.Where(x => x.RoleId == 2).ToList();
            string[] fio = new string[users.Count];
            for(int i =0; i < users.Count; i++)
            {
                fio[i] += users[i].LastName + " " + users[i].FirstName[0] + ". " + users[i].Patronymic[0] + ". ";
            }
            MasterComboBox.ItemsSource = db.context.Users.Where(x => x.RoleId == 2).ToList();
            MasterComboBox.DisplayMemberPath = "LastName";
            MasterComboBox.SelectedValuePath = "IdUser";
            List<OrderStatuses> orderStatuses = new List<OrderStatuses>();
            orderStatuses = db.context.OrderStatuses.ToList();
            OrderStatusComboBox.ItemsSource = orderStatuses;
            Computers computer = db.context.Computers.Where(x => x.ComputerId == order.ComputerId).FirstOrDefault();
            string filename = computer.ComputerPicPath;
            ComputerImage.Source = new BitmapImage(new Uri(filename, UriKind.RelativeOrAbsolute));
        }

        private void SaveWarrantyInfo(object sender, System.Windows.RoutedEventArgs e)
        {


                try
                {
                int statusId = (OrderStatusComboBox.SelectedItem as OrderStatuses)?.IdOrderStatus ?? 0;
                DateTime date = OrderDateExecDatePicker.SelectedDate ?? DateTime.Now;
                int? masterId = (int)(MasterComboBox.SelectedValue ?? Properties.Settings.Default.idUser);
                    Orders editedOrder = db.context.Orders.Where(x => x.IdOrder == currentOrder.IdOrder).FirstOrDefault();
                    editedOrder.OrderStatusId = statusId;
                    editedOrder.MasterId = masterId;
                    editedOrder.OrderExecDate = date;
                    db.context.SaveChanges();
                    MessageBox.Show("Информация о заявке успешно отредактирована!");
                    this.NavigationService.GoBack();
                }
                catch
                {
                    MessageBox.Show("Во время редактирования информации произошла ошибка!");
                }


        }
    }
}
