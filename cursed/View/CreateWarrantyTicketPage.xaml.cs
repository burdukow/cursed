using cursed.Model;
using cursed.ViewModel;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
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
                OrderVM.CreateOrder(
                    WarrantyProblemComboBox.Text,
                    WarrantyAdditionalTextBox.Text,
                    WarrantyComputerComboBox.Text
                    );
                Orders newOrder = db.context.Orders.Where(x => x.OrderDescription == WarrantyAdditionalTextBox.Text).FirstOrDefault();
                MessageBox.Show("Гарантийная заявка создана, в скором времени оператор её рассмотрит.\n\n\n" +
    "Сейчас будет выведен сгенерированный код, обязательно его запишите или сохраните, иначе вы не сможете узнать статус заявки.");
                MessageBoxResult dialog = MessageBox.Show("Ваш уникальный код заявки: " + newOrder.OrderCode + "\nЖелаете его сохранить?", newOrder.OrderCode, MessageBoxButton.YesNo);
                if (dialog == MessageBoxResult.Yes)
                {
                    Microsoft.Win32.SaveFileDialog dlg = new Microsoft.Win32.SaveFileDialog();
                    dlg.FileName = "Код заявки";
                    dlg.DefaultExt = ".txt";
                    dlg.Filter = "Text documents (.txt)|*.txt";
                    Nullable<bool> result = dlg.ShowDialog();
                    if (result == true)
                    {
                        File.WriteAllText(dlg.FileName, newOrder.OrderCode);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Произошла ошибка при создании заявки!\n" + ex.Message);
            }

        }
    }
}
