using BookClub.Classes;
using BookClub.Models;
using System.Windows;
using System.Windows.Controls;
using Microsoft.Win32;
using System.Linq;
using System.Collections.Generic;
using PdfSharp.Drawing;
using PdfSharp.Pdf;
using System;
using System.Windows.Media.Imaging;
using System.Windows.Media;
using ZXing;
using System.Windows.Interop;
using System.IO;

namespace BookClub.Pages
{
    /// <summary>
    /// Логика взаимодействия для OrdersPages.xaml
    /// </summary>
    public partial class OrdersPages : Page
    {
        public OrdersPages()
        {
            InitializeComponent();
            List<orders> ordersList = BookEntities.GetContext().orders.ToList();
            dataGrid.ItemsSource = ordersList;
        }

        private void SaveRowButton_Click(object sender, RoutedEventArgs e)
        {
            Button button = sender as Button;

            if (button != null)
            {
                orders selectedOrder = button.DataContext as orders;

                if (selectedOrder != null)
                {
                    SaveTalonPDF(selectedOrder);
                }
            }
        }

        private void GenerateBarcodeButton_Click(object sender, RoutedEventArgs e)
        {
            Button button = sender as Button;

            if (button != null)
            {
                orders selectedOrder = button.DataContext as orders;

                if (selectedOrder != null)
                {
                    GenerateAndSaveBarcodePDF(selectedOrder);
                }
            }
        }

        private void SaveTalonPDF(orders order)
        {
            SaveFileDialog saveFileDialog = new SaveFileDialog();
            saveFileDialog.Filter = "PDF файл (*.pdf)|*.pdf";

            if (saveFileDialog.ShowDialog() == true)
            {
                string pdfFilePath = saveFileDialog.FileName;

                SaveToPdf(pdfFilePath, order);

                MessageBox.Show("Талон успешно сохранен.", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }

        private void GenerateAndSaveBarcodePDF(orders order)
        {
            SaveFileDialog saveFileDialog = new SaveFileDialog();
            saveFileDialog.Filter = "PDF файл (*.pdf)|*.pdf";

            if (saveFileDialog.ShowDialog() == true)
            {
                string barcodeFilePath = saveFileDialog.FileName;

                // Генерация и сохранение штрих-кода в формате PDF
                SaveBarcodeToPdf(order, barcodeFilePath);

                MessageBox.Show("Штрих-код успешно сохранен.", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }

        private void SaveToPdf(string filePath, orders selectedOrder)
        {
            // Создание документа PDF
            PdfDocument document = new PdfDocument();
            PdfPage page = document.AddPage();
            XGraphics gfx = XGraphics.FromPdfPage(page);

            // Добавление данных из объекта selectedOrder в документ
            XFont font = new XFont("Arial", 12);

            int yPos = 10;
            foreach (var property in selectedOrder.GetType().GetProperties())
            {
                string propertyName = property.Name;

                // Проверка, не является ли свойство типом ICollection<T>
                if (property.PropertyType.GetInterface("ICollection") == null)
                {
                    object propertyValue = property.GetValue(selectedOrder);
                    string line = $"{propertyName}: {propertyValue}";

                    gfx.DrawString(line, font, XBrushes.Black, new XRect(10, yPos, page.Width, page.Height), XStringFormats.TopLeft);

                    yPos += 20;
                }
            }

            // Сохранение документа в PDF
            document.Save(filePath);
        }

        private void SaveBarcodeToPdf(orders order, string filePath)
        {
            // Создание документа PDF
            PdfDocument document = new PdfDocument();
            PdfPage page = document.AddPage();
            XGraphics gfx = XGraphics.FromPdfPage(page);

            // Генерация штрих-кода и добавление в документ
            ZXing.BarcodeWriter barcodeWriter = new ZXing.BarcodeWriter();
            barcodeWriter.Format = BarcodeFormat.CODE_128;

            string content = $"ID: {order.id}\nClient: {order.id_users}\nStatus: {order.id_status}\nPoint: {order.id_point}\nOrder Date: {order.order_date}\nCode: {order.code}\nCost: {order.cost}\nDiscount: {order.discount}";

            BitmapSource barcodeBitmap = Imaging.CreateBitmapSourceFromHBitmap(barcodeWriter.Write(content).GetHbitmap(),
                IntPtr.Zero,
                Int32Rect.Empty,
                BitmapSizeOptions.FromEmptyOptions());

            MemoryStream memoryStream = new MemoryStream();
            PngBitmapEncoder encoder = new PngBitmapEncoder();
            encoder.Frames.Add(BitmapFrame.Create(barcodeBitmap));
            encoder.Save(memoryStream);

            XImage barcodeImage = XImage.FromStream(memoryStream);

            gfx.DrawImage(barcodeImage, 10, 10);

            // Сохранение документа в PDF
            document.Save(filePath);
        }

        private void EditOrder(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame1.Navigate(new EditOrders((sender as Button).DataContext as orders)); 
        }
    }
}
