using cursed.Model;
using cursed.ViewModel;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media.Imaging;

namespace cursed.View
{
    /// <summary>
    /// Interaction logic for AdminAddComputerPage.xaml
    /// </summary>
    public partial class AdminAddComputerPage : Page
    {
        Core db = new Core();
        List<ComputerTypes> computerTypes = new List<ComputerTypes>();
        List<Components> components = new List<Components>();

        public AdminAddComputerPage()
        {
            InitializeComponent();
            components = db.context.Components.ToList();
            computerTypes = db.context.ComputerTypes.ToList();
            ComputerTypeComboBox.ItemsSource = computerTypes.Select(x => x.ComputerTypeName).ToList();
            ProcessorComboBox.ItemsSource = components.Where(x => x.ComponentTypeId == 1).Select(x => x.ComponentModel).ToList();
            MotherboardComboBox.ItemsSource = components.Where(x => x.ComponentTypeId == 2).Select(x => x.ComponentModel).ToList();
            VideoCardComboBox.ItemsSource = components.Where(x => x.ComponentTypeId == 3).Select(x => x.ComponentModel).ToList();
            RAMComboBox.ItemsSource = components.Where(x => x.ComponentTypeId == 4).Select(x => x.ComponentModel).ToList();
            CapacityComboBox.ItemsSource = components.Where(x => x.ComponentTypeId == 5).Select(x => x.ComponentModel).ToList();
            CPUCoolerComboBox.ItemsSource = components.Where(x => x.ComponentTypeId == 6).Select(x => x.ComponentModel).ToList();
            PSUComboBox.ItemsSource = components.Where(x => x.ComponentTypeId == 7).Select(x => x.ComponentModel).ToList();
            NetworkCardComboBox.ItemsSource = components.Where(x => x.ComponentTypeId == 8).Select(x => x.ComponentModel).ToList();
            SoundCardComboBox.ItemsSource = components.Where(x => x.ComponentTypeId == 9).Select(x => x.ComponentModel).ToList();
        }


        private void CancelButtonClick(object sender, RoutedEventArgs e)
        {
            this.NavigationService.GoBack();
        }

        private async void AddComputerImageButtonClick(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFileDialog1 = new OpenFileDialog();
            openFileDialog1.InitialDirectory = "c:\\";
            openFileDialog1.Filter = "Image Files(*.JPG;*.JPEG;*.PNG;*.GIF)|*.JPG;*.JPEG;*.PNG;*.GIF|All files (*.*)|*.*";
            openFileDialog1.FilterIndex = 0;
            openFileDialog1.RestoreDirectory = true;
            if (openFileDialog1.ShowDialog() == true)
            {
                try
                {
                    string path = openFileDialog1.FileName;
                    string filename = openFileDialog1.SafeFileName;
                    var uploader = new FilesVM();
                    string imageUrl = await uploader.UploadImage(path);
                    BitmapImage computerImage = new BitmapImage(new Uri(imageUrl));
                    ComputerImage.Source = computerImage;
                }
                catch
                {
                    MessageBox.Show("Невозможно загрузить изображение");
                }
            }
        }

        private void AddNewComputerButtonClick(object sender, RoutedEventArgs e)
        {
            try
            {

                int newCompId = ComputerVM.CreateNewComputer(
                    ComputerTitleTextBox.Text,
                    computerTypes.FirstOrDefault(x => x.ComputerTypeName == ComputerTypeComboBox.Text).IdComputerType,
                    ComputerImage.Source != null ? ((BitmapImage)ComputerImage.Source).UriSource.ToString() : string.Empty
                );

                ComputerVM.addComputerComponentRelationship(newCompId, ProcessorComboBox.Text);
                ComputerVM.addComputerComponentRelationship(newCompId, MotherboardComboBox.Text);
                ComputerVM.addComputerComponentRelationship(newCompId, VideoCardComboBox.Text);
                ComputerVM.addComputerComponentRelationship(newCompId, RAMComboBox.Text);
                ComputerVM.addComputerComponentRelationship(newCompId, CapacityComboBox.Text);
                ComputerVM.addComputerComponentRelationship(newCompId, CPUCoolerComboBox.Text);
                ComputerVM.addComputerComponentRelationship(newCompId, PSUComboBox.Text);
                if (NetworkCardComboBox.Text != "")
                    ComputerVM.addComputerComponentRelationship(newCompId, NetworkCardComboBox.Text);
                if (SoundCardComboBox.Text != "")
                    ComputerVM.addComputerComponentRelationship(newCompId, SoundCardComboBox.Text);
                db.context.SaveChanges();

                MessageBox.Show("Компьютер успешно добавлен");
                this.NavigationService.GoBack();
            }
            catch
            {
                MessageBox.Show("Во вермя добавления компьютера произошла ошибка!");
            }
        }
    }
}
