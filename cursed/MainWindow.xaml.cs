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
            UpdateButtons();
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
            UpdateButtons();
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
            UpdateButtons();
        }

        private void ExitButton_Click(object sender, RoutedEventArgs e)
        {
            Properties.Settings.Default.idUser = 0;
            Properties.Settings.Default.idRole = 0;
            Properties.Settings.Default.Save();
            UpdateButtons();
            MainFrame.NavigationService.Refresh();
        }
        private void UpdateButtons()
        {
            if (MainFrame.CanGoBack)
            {
                CancelStackPanel.Visibility = Visibility.Visible;
            }
            else if (!MainFrame.CanGoBack)
            {
                CancelStackPanel.Visibility = Visibility.Collapsed;
            }
            if (Properties.Settings.Default.idUser == 0)
            {
                AuthedStackPanel.Visibility = Visibility.Collapsed;
                NotAuthedStackPanel.Visibility = Visibility.Visible;
            }
            else if (Properties.Settings.Default.idUser != 0)
            {
                AuthedStackPanel.Visibility = Visibility.Visible;
                NotAuthedStackPanel.Visibility = Visibility.Collapsed;
            }
        }
    }
}
