using cursed.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace cursed.View
{
    /// <summary>
    /// Логика взаимодействия для AdminAddNewComponentPage.xaml
    /// </summary>
    public partial class AdminAddNewComponentPage : Page
    {
        Core db = new Core();
        List<ComponentTypes> componentTypesList = new List<ComponentTypes>();
        List<Manufacturers> manufacturersList = new List<Manufacturers>();
        public AdminAddNewComponentPage()
        {
            InitializeComponent();
            updateCombo();
        }

        private void AddNewManufacturerButtonClick(object sender, RoutedEventArgs e)
        {
            AddNewManufacturerStackPanel.Visibility = Visibility.Visible;
        }

        private void AddManufacturerButtonClick(object sender, RoutedEventArgs e)
        {
            Manufacturers newManufacturer = new Manufacturers
            {
                ManufacturerName = NewManufacturerName.Text,
            };
            db.context.Manufacturers.Add(newManufacturer);
            db.context.SaveChanges();
            updateCombo();
            AddNewManufacturerStackPanel.Visibility = Visibility.Collapsed;
        }

        private void AddNewComponentButtonClick(object sender, RoutedEventArgs e)
        {
            try
            {
                Manufacturers manufacturer = ComponentManufacturerComboBox.SelectedItem as Manufacturers;
                ComponentTypes componentType = ComponentType.SelectedItem as ComponentTypes;
                Components newComponent = new Components
                {
                    ComponentModel = ComponentModelTextBox.Text,
                    ComponentPrice = Convert.ToDouble(ComponentPriceTextBox.Text),
                    ComponentAmount = Convert.ToInt32(ComponentAmountTextBox.Text),
                    ComponentArticle = ComponentArticleTextBox.Text,
                    ComponentManufacturerId = manufacturer.IdManufacturer,
                    ComponentTypeId = componentType.IdComponentType,
                };
                db.context.Components.Add(newComponent);
                db.context.SaveChanges();
                this.NavigationService.GoBack();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Произошла ошибка добавления компонента\n\n\n" + ex.Message);
            }
        }

        public void updateCombo()
        {
            componentTypesList = db.context.ComponentTypes.ToList();
            ComponentType.ItemsSource = componentTypesList;
            manufacturersList = db.context.Manufacturers.ToList();
            ComponentManufacturerComboBox.ItemsSource = manufacturersList;
        }
    }
}
