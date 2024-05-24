using cursed.Model;
using System;
using System.Collections.Generic;
using System.Linq;
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
        public AdminWarrantyDescPage(Orders order)
        {

            InitializeComponent();
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
            MasterComboBox.ItemsSource = fio;
            List<OrderStatuses> orderStatuses = new List<OrderStatuses>();
            orderStatuses = db.context.OrderStatuses.ToList();
            OrderStatusComboBox.ItemsSource = orderStatuses;
            Computers computer = db.context.Computers.Where(x => x.ComputerId == order.ComputerId).FirstOrDefault();
            string filename = computer.ComputerPicPath;
            string compImagePath = @"../../Resources/Images/Computers/" + filename;
            ComputerImage.Source = new BitmapImage(new Uri(compImagePath, UriKind.Relative));
        }
    }
}
