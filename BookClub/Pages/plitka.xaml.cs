using BookClub.Models;
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

namespace BookClub.Pages
{
    /// <summary>
    /// Логика взаимодействия для plitka.xaml
    /// </summary>
    public partial class plitka : Page
    {
        private int _currentPage = 1, _countInPage = 3, _maxPages;
        public plitka()
        {
            InitializeComponent();

            var allManuf = BookEntities.GetContext().merch
                .Select(m => m.manufacturer)
                .Distinct()
                .ToList();

            allManuf.Insert(0, "Все производители");
            ComboMan.ItemsSource = allManuf;

            UpdateTours();
        }

        public void UpdateTours() 
        {
            var currentMerch = BookEntities.GetContext().merch.ToList();
            if (ComboMan.SelectedIndex > 0)
            {
                var selectedManufacturer = (ComboMan.SelectedItem as string);
                if (!string.IsNullOrEmpty(selectedManufacturer))
                {
                    currentMerch = currentMerch.Where(p => p.manufacturer.Contains(selectedManufacturer)).ToList();
                }
            }

            currentMerch = currentMerch.Where(p => p.name.ToLower().Contains(TBoxSearch.Text.ToLower())).ToList();

            if (CheckDiscount.IsChecked == true)
            {
                currentMerch = currentMerch.Where(p => p.discount > 0).ToList();
            }
            LVMerch.ItemsSource = currentMerch;
            
        }

        private void TBoxSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            UpdateTours();
        }

        private void ComboMan_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateTours();
        }

        private void CheckDis(object sender, RoutedEventArgs e)
        {
            UpdateTours();
        }

        private void BtnFirstPage_Click(object sender, RoutedEventArgs e) => ChangePage(1);

        private void BtnPreviousPage_Click(object sender, RoutedEventArgs e) => ChangePage(_currentPage - 1);

        private void BtnNextPage_Click(object sender, RoutedEventArgs e) => ChangePage(_currentPage + 1);

        private void BtnLastPage_Click(object sender, RoutedEventArgs e) => ChangePage(_maxPages);

        private void ChangePage(int page)
        {
            _currentPage = Math.Max(1, Math.Min(page, _maxPages));
            RefreshData();
        }

        private void RefreshData()
        {
            var merchik =  BookEntities.GetContext().merch.ToList();
            _maxPages = (int)Math.Ceiling(merchik.Count * 1.0 / _countInPage);
            merchik = merchik.Skip((_currentPage - 1) * _countInPage).Take(_countInPage).ToList();

            LblPages.Content = $"{_currentPage}/{_maxPages}";
            LVMerch.ItemsSource = merchik;

            ManageButtonsEnable();
            GeneratePageNumbers();
        }

        private void GeneratePageNumbers()
        {
            SPanelPages.Children.Clear();

            foreach (int i in Enumerable.Range(1, _maxPages))
            {
                Button btn = new Button { Content = i.ToString(), Width = 28 };
                btn.Click += (sender, e) => ChangePage(int.Parse(((Button)sender).Content.ToString()));
                SPanelPages.Children.Add(btn);
            }
        }

        private void ManageButtonsEnable()
        {
            bool atFirstPage = _currentPage == 1;
            bool atLastPage = _currentPage == _maxPages;

            BtnFirstPage.IsEnabled = BtnPreviousPage.IsEnabled = !atFirstPage;
            BtnLastPage.IsEnabled = BtnNextPage.IsEnabled = !atLastPage;
        }
    }
}
