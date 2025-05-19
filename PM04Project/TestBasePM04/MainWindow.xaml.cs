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
using TestBasePM04;

namespace Master_floor
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        readonly TestBaseEntities db = new TestBaseEntities();

        public MainWindow()
        {
            InitializeComponent();
            LoadPartners();
        }

        public void LoadPartners()
        {
            try
            {
                var partnersList = db.Partners.AsNoTracking().ToList().Select(p => new Partner 
                                     {
                                         ID = p.ID,
                                         Тип_партнера = p.Тип_партнера,
                                         Наименование_партнера = p.Наименование_партнера,
                                         Директор = p.Директор,
                                         Телефон_партнера = p.Телефон_партнера,
                                         Рейтинг = p.Рейтинг.HasValue ? $"Рейтинг: {p.Рейтинг}" : "Рейтинг: не указан",
                                         Скидка = CalculateDiscount(GetTotalPurchases(p.ID))
                                     }).ToList();

                listPartner.ItemsSource = partnersList;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка загрузки данных: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private double? GetTotalPurchases(int partnerId)
        {
            return db.Partners_product.AsNoTracking().Where(pp => pp.ID_Partner == partnerId).Sum(pp => pp.Количество_продукции);
        }

        public string CalculateDiscount(double? totalPurchases)
        {
            if (!totalPurchases.HasValue || totalPurchases < 10000) return "0%";
            if (totalPurchases < 50000) return "5%";
            if (totalPurchases < 300000) return "10%";
            return "15%";
        }

        private void ListPartner_MouseDoubleClick(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            if (listPartner.SelectedItem is Partner selectedPartner)
            {
                var editWindow = new EditPartnerWindow(selectedPartner.ID, this);
                editWindow.ShowDialog();
            }
        }

        private void BtnAddPartner_Click(object sender, RoutedEventArgs e)
        {
            var addWindow = new AddPartnerWindow(this);
            addWindow.ShowDialog();
        }

        private void BtnProduct_Click(object sender, RoutedEventArgs e)
        {
            if (listPartner.SelectedItem is Partner selectedPartner)
            {
                var historyWindow = new History(selectedPartner.ID);
                historyWindow.Show();
                this.Close();
            }
            else
            {
                MessageBox.Show("Пожалуйста, выберите партнера для просмотра истории покупок",
                    "Внимание", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        protected override void OnClosed(EventArgs e)
        {
            base.OnClosed(e);
            db?.Dispose();
        }
    }
}