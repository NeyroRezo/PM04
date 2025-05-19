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
    /// Логика взаимодействия для EditPartnerWindow.xaml
    /// </summary>
    public partial class EditPartnerWindow : Window
    {
        private readonly TestBaseEntities db;
        private readonly int partnerId;
        private readonly Partners partner;
        private readonly MainWindow mainWindow;

        public EditPartnerWindow(int id, MainWindow mainWindow)
        {
            InitializeComponent();

            this.mainWindow = mainWindow;
            db = new TestBaseEntities();
            partnerId = id;
            partner = db.Partners.FirstOrDefault(p => p.ID == partnerId);

            if (partner == null)
            {
                MessageBox.Show("Партнёр не найден!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                Close();
                return;
            }

            LoadPartnerData();
        }

        private void LoadPartnerData()
        {
            try
            {
                txtType.Text = partner.Тип_партнера;
                txtName.Text = partner.Наименование_партнера;
                txtDirector.Text = partner.Директор;
                txtEmail.Text = partner.Электронная_почта_партнера;
                txtPhone.Text = partner.Телефон_партнера;
                txtAddress.Text = partner.Юридический_адрес_партнера;
                txtINN.Text = partner.ИНН.ToString();

                if (partner.Рейтинг.HasValue)
                {
                    cmbRating.SelectedValue = (int)Math.Round(partner.Рейтинг.Value);
                }
                else
                {
                    cmbRating.SelectedIndex = 4;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка загрузки данных: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void Save_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(txtName.Text))
                {
                    MessageBox.Show("Наименование партнера обязательно для заполнения!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }
                partner.Тип_партнера = txtType.Text;
                partner.Наименование_партнера = txtName.Text;
                partner.Директор = txtDirector.Text;
                partner.Электронная_почта_партнера = txtEmail.Text;
                partner.Телефон_партнера = txtPhone.Text;
                partner.Юридический_адрес_партнера = txtAddress.Text;

                if (double.TryParse(txtINN.Text, out var inn))
                {
                    partner.ИНН = inn;
                }
                else
                {
                    MessageBox.Show("ИНН должен быть числом!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }

                if (cmbRating.SelectedValue is int rating)
                {
                    partner.Рейтинг = rating;
                }

                db.SaveChanges();
                mainWindow.LoadPartners();
                Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка при сохранении: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void Delete_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var result = MessageBox.Show("Вы уверены, что хотите удалить этого партнера?", "Подтверждение удаления", MessageBoxButton.YesNo, MessageBoxImage.Warning);

                if (result == MessageBoxResult.Yes)
                {
                    var purchases = db.Partners_product.Where(pp => pp.ID_Partner == partnerId).ToList();
                    db.Partners_product.RemoveRange(purchases);

                    db.Partners.Remove(partner);
                    db.SaveChanges();

                    mainWindow.LoadPartners();
                    Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка при удалении: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
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