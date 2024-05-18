using cursed.Model;
using System;
using System.Collections.Generic;
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
    /// Interaction logic for CreateWarrantyTicketPage.xaml
    /// </summary>
    public partial class CreateWarrantyTicketPage : Page
    {
        Core db = new Core();
        List<Computers> arrayComputers = new List<Computers>();
        List<ComponentTypes> componentTypes = new List<ComponentTypes>();
        public CreateWarrantyTicketPage()
        {
            InitializeComponent();
            arrayComputers = db.context.Computers.ToList();
            WarrantyComputerComboBox.ItemsSource = arrayComputers.Select(x => x.ComputerName);

            componentTypes = db.context.ComponentTypes.ToList();
            WarrantyProblemComboBox.ItemsSource = componentTypes.Select(x => x.ComponentTypeName);
        }

        private void CreateWarrantyTicketButtonClick(object sender, RoutedEventArgs e)
        {
            try
            {
                Orders newOrder = new Orders()
                {
                    OrderDescription = WarrantyAdditionalTextBox.Text,
                    ComponentId = componentTypes.Where(x => x.ComponentTypeName == WarrantyProblemComboBox.Text).FirstOrDefault().IdComponentType,
                    ComputerId = arrayComputers.Where(x => x.ComputerName == WarrantyComputerComboBox.Text).FirstOrDefault().ComputerId,
                    OrderStatusId = 4
                };
                db.context.Orders.Add(newOrder);
                db.context.SaveChanges();
                MessageBox.Show("Гарантийная заявка создана, в скором времени оператор её рассмотрит.");
                this.NavigationService.GoBack();
            }
            catch
            {
                MessageBox.Show("Произошла ошибка при создании заявки!");
            }
        }
    }
}
