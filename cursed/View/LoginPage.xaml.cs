using cursed.Model;
using cursed.ViewModel;
using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

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
                bool result = UserVM.AuthCheck(TBoxLogin.Text, PBoxPassword.Password);
                if (result)
                {
                    Users item = db.context.Users.Where(x => x.Login == TBoxLogin.Text && x.Password == PBoxPassword.Password).FirstOrDefault();
                    Properties.Settings.Default.idUser = item.IdUser;
                    Properties.Settings.Default.idRole = item.RoleId;
                    Properties.Settings.Default.Save();
                    this.NavigationService.Navigate(new MainPage());
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
