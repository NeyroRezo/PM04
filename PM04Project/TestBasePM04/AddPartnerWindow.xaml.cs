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
    /// Логика взаимодействия для AddPartnerWindow.xaml
    /// </summary>
    public partial class AddPartnerWindow : Window
    {
        private readonly TestBaseEntities db;
        private readonly MainWindow mainWindow;

        public AddPartnerWindow(MainWindow mainWindow)
        {
            InitializeComponent();

            this.mainWindow = mainWindow;
            db = new TestBaseEntities();
            cmbRating.SelectedValue = 5;
        }

        private void Save_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(txtName.Text))
                {
                    MessageBox.Show("Наименование партнера обязательно для заполнения",
                        "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }

                var newPartner = new Partners
                {
                    Тип_партнера = txtType.Text,
                    Наименование_партнера = txtName.Text,
                    Директор = txtDirector.Text,
                    Электронная_почта_партнера = txtEmail.Text,
                    Телефон_партнера = txtPhone.Text,
                    Юридический_адрес_партнера = txtAddress.Text,
                    ИНН = double.TryParse(txtINN.Text, out var inn) ? inn : 0,
                    Рейтинг = cmbRating.SelectedValue as double?
                };

                db.Partners.Add(newPartner);
                db.SaveChanges();
                mainWindow.LoadPartners();
                Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка при сохранении: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void Cancel_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        protected override void OnClosed(EventArgs e)
        {
            base.OnClosed(e);
            db?.Dispose();
        }
    }
}