using cursed.model;
using cursed.ViewModel;
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
    /// Логика взаимодействия для LoginPage.xaml
    /// </summary>
    public partial class LoginPage : Page
    {
        Core db = new Core();
        public LoginPage()
        {
            InitializeComponent();
        }

        private void BtnLogin_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                UserVM newObject = new UserVM();
                bool result = newObject.AuthCheck(TBoxLogin.Text, PBoxPassword.Password);
                if (result)
                {
                    Users item = db.context.Users.Where(x => x.Login == TBoxLogin.Text && x.Password == PBoxPassword.Password).FirstOrDefault();
                    Properties.Settings.Default.idUser = item.IdUser;
                    Properties.Settings.Default.idRole = item.RoleId;
                    Properties.Settings.Default.Save();
                    this.NavigationService.Navigate(new MainPage());
                }
            }
            catch(Exception ex) {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
