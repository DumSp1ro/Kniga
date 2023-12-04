using BookClub.Classes;
using BookClub.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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

namespace BookClub.Pages
{
    /// <summary>
    /// Логика взаимодействия для merchesList.xaml
    /// </summary>
    public partial class merchesList : Page
    {
        private ObservableCollection<OrderItem> orderItems = new ObservableCollection<OrderItem>();
        private ObservableCollection<Point> points;
        public merchesList()
        {
            InitializeComponent();
            var merchik = BookEntities.GetContext().merch.ToList();
            MerchBD.ItemsSource = merchik;
        }
        
        private void MerchBD_MouseRightButtonDown(object sender, MouseButtonEventArgs e)
        {
            if (MerchBD.SelectedItem == null)
            {
                e.Handled = true;
            }
            else
            {
                // Получить выбранный элемент
                merch selectedMerch = MerchBD.SelectedItem as merch;

                // Вывести MessageBox с информацией о выбранном товаре
                MessageBox.Show($"Selected Merch:\nName: {selectedMerch.name}\nManufacturer: {selectedMerch.manufacturer}\nPrice: {selectedMerch.price}", "Merchandise Information", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }

        public class OrderItem
        {
            public int OrderId { get; set; }
            public int UserId { get; set; }
            public int StatusId { get; set; }
            public int PointId { get; set; }
            public DateTime OrderDate { get; set; }
            public int Code { get; set; }
            public int Cost { get; set; }
            public int Discount { get; set; }
            public int MerchId { get; set; }
            public string MerchName { get; set; }
            public decimal MerchPrice { get; set; }
            public int Quantity { get; set; }
            public string SelectedPoint { get; set; }
            public int Point { get; set; }
        }

        private void AddToOrder_Click(object sender, RoutedEventArgs e)
        {
            if (MerchBD.SelectedItem != null)
            {
                merch selectedMerch = MerchBD.SelectedItem as merch;

                OrderItem orderItem = new OrderItem
                {
                    MerchId = selectedMerch.id,
                    MerchName = selectedMerch.name,
                    MerchPrice = selectedMerch.price,
                    Quantity = 1
                };

                if (selectedMerch.discount.HasValue)
                {
                    orderItem.Discount = selectedMerch.discount.Value;
                }
                else
                {
                    MessageBox.Show("У товара нет скидки");
                }

                orderItems.Add(orderItem);

                UpdateOrderViewButtonVisibility();
            }
        }

        private int GenerateOrderCode()
        {
            Random random = new Random();
            int number1 = random.Next(100, 1000);

            return int.Parse($"{number1}");
        }

        private void UpdateOrderViewButtonVisibility()
        {
            if (orderItems.Any())
            {
                ShowOrderButton.Visibility = Visibility.Visible;
            }
            else
            {
                ShowOrderButton.Visibility = Visibility.Collapsed;
            }
        }

        private void ShowOrderButton_Click(object sender, RoutedEventArgs e)
        {
            OneOrder orderViewWindow = new OneOrder(orderItems);
            orderViewWindow.ShowDialog();
        }

    }
}
