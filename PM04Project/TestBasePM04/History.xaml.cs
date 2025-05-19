using Master_floor;
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
using System.Windows.Shapes;

namespace TestBasePM04
{
    /// <summary>
    /// Логика взаимодействия для History.xaml
    /// </summary>
    public partial class History : Window
    {
        private readonly MainWindow _mainWindow = new MainWindow();
        private readonly int partnerId;
        private readonly TestBaseEntities db = new TestBaseEntities();

        public History(int id)
        {
            InitializeComponent();
            partnerId = id;
            LoadPurchaseHistory();
        }

        private void LoadPurchaseHistory()
        {
            try
            {
                var partner = db.Partners.FirstOrDefault(p => p.ID == partnerId);
                if (partner != null)
                {
                    tbPartnerInfo.Text = $"История покупок партнера: {partner.Наименование_партнера}";
                }

                var purchases = db.Partners_product.Where(pp => pp.ID_Partner == partnerId).Join(db.Product,pp => pp.ID_Product, p => p.ID, (pp, p) => new PurchaseHistory
                        {
                            ProductName = p.Наименование_продукции,
                            Quantity = pp.Количество_продукции,
                            SaleDate = pp.Дата_продажи
                        }).OrderByDescending(p => p.SaleDate).ToList();
                dgPurchases.ItemsSource = purchases;
            }

            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка загрузки истории покупок: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void Close_Click(object sender, RoutedEventArgs e)
        {
            _mainWindow.Show();
            this.Close();
        }
    }
}
