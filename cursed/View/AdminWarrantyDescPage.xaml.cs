using cursed.Model;
using System.Windows.Controls;

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
        }
    }
}
