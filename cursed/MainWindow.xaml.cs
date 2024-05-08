using cursed.View;
using System;
using System.Windows;

namespace cursed
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            if (Properties.Settings.Default.idUser == 0)
            {
                AuthedStackPanel.Visibility = Visibility.Collapsed;
                NotAuthedStackPanel.Visibility = Visibility.Visible;
                CancelStackPanel.Visibility = Visibility.Collapsed;
            }
            else
            {
                NotAuthedStackPanel.Visibility = Visibility.Collapsed;
                AuthedStackPanel.Visibility = Visibility.Visible;
                CancelStackPanel.Visibility = Visibility.Collapsed;
            }
        }

        private void Window_Closed(object sender, EventArgs e)
        {
            Properties.Settings.Default.idUser = 0;
            Properties.Settings.Default.idRole = 0;
            Properties.Settings.Default.Save();
        }

        private void Window_ContentRendered(object sender, EventArgs e)
        {
            MainFrame.Navigate(new MainPage());
        }

        private void AuthButton_Click(object sender, RoutedEventArgs e)
        {
            NotAuthedStackPanel.Visibility = Visibility.Collapsed;
            CancelStackPanel.Visibility = Visibility.Visible;
            MainFrame.NavigationService.Navigate(new LoginPage());
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            if (MainFrame.NavigationService.CanGoBack)
            {
                MainFrame.NavigationService.GoBack();
            }
            else
            {
                CancelStackPanel.Visibility = Visibility.Collapsed;
            }
        }

        private void MainFrame_ContentRendered(object sender, EventArgs e)
        {
            if (MainFrame.CanGoBack)
            {
                CancelStackPanel.Visibility = Visibility.Visible;
            }
            if (Properties.Settings.Default.idUser == 0 && !MainFrame.CanGoBack)
            {
                AuthedStackPanel.Visibility = Visibility.Collapsed;
                NotAuthedStackPanel.Visibility = Visibility.Visible;
                CancelStackPanel.Visibility = Visibility.Collapsed;
            }
            else if (!MainFrame.CanGoBack && Properties.Settings.Default.idUser != 0)
            {
                NotAuthedStackPanel.Visibility = Visibility.Collapsed;
                AuthedStackPanel.Visibility = Visibility.Visible;
                CancelStackPanel.Visibility = Visibility.Collapsed;
            }
        }
    }
}
