using cursed.Model;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace cursed.View
{
    /// <summary>
    /// Логика взаимодействия для AdminEditComponentAmountPage.xaml
    /// </summary>
    public partial class AdminEditComponentAmountPage : Page
    {
        Core db = new Core();
        List<Components> componentsList = new List<Components>();
        public AdminEditComponentAmountPage()
        {
            InitializeComponent();
            componentsList = db.context.Components.Include("Manufacturers").ToList();
            ComponentsGrid.ItemsSource = componentsList;
        }

        private void ComponentsGrid_RowEditEnding(object sender, DataGridRowEditEndingEventArgs e)
        {
            if (e.EditAction == DataGridEditAction.Commit)
            {
                var editedRow = e.Row.Item as Components;
                db.context.Entry(editedRow).State = EntityState.Modified;
                db.context.SaveChanges();
            }
        }

        private void AddNewComponentButtonClick(object sender, RoutedEventArgs e)
        {
            this.NavigationService.Navigate(new AdminAddNewComponentPage());
        }

        private void RemoveComponentButtonClick(object sender, RoutedEventArgs e)
        {

            Components selectedComponent = this.ComponentsGrid.SelectedItem as Components;
            if (selectedComponent != null)
            {
                db.context.Components.Remove(selectedComponent);
            }
            db.context.SaveChanges();
            componentsList = db.context.Components.Include("Manufacturers").ToList();
            ComponentsGrid.ItemsSource = componentsList;
        }
    }
}
