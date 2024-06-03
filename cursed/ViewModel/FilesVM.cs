using Microsoft.Office.Interop.Word;
using System;
using System.Collections.Generic;
using System.IO;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Reflection;
using System.Threading.Tasks;
using System.Windows;

namespace cursed.ViewModel
{
    public class FilesVM
    {

        /// <summary>
        /// Редактирует шаблон Word-документа, заменяя заполнители данными из словаря.
        /// </summary>
        /// <param name="outputPath">Путь для сохранения отредактированного документа.</param>
        /// <param name="data">Словарь, содержащий пары "ключ-значение", где ключ - имя заполнителя в шаблоне, а значение - данные для замены.</param>
        /// <remarks>
        /// Метод открывает шаблон Word-документа, ищет заполнители, соответствующие ключам в словаре, 
        /// заменяет их значениями и сохраняет отредактированный документ в указанный путь.
        /// </code>
        /// </remarks>
        /// <exception cref="Exception">
        /// Выбрасывается, если возникла ошибка при работе с Word-документом.
        /// </exception>
public static void EditWordFile(string outputPath, Dictionary<string, string> data)
        {
            string baseDirectory = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);
            string relativeTemplatePath = @"..\..\Resources\Docs\WarrantyTemplate.docx";
            string templatePath = Path.Combine(baseDirectory, relativeTemplatePath);

            try
            {
                var app = new Microsoft.Office.Interop.Word.Application();
                app.Documents.Open(templatePath);


                Object missing = Type.Missing;

                foreach ( var item in data) { 
                    Find find = app.Selection.Find;
                    find.Text = item.Key;
                    find.Replacement.Text = item.Value;

                    Object wrap = WdFindWrap.wdFindContinue;
                    Object replace = WdReplace.wdReplaceAll;

                    find.Execute(FindText: Type.Missing,
                        MatchCase: false,
                        MatchWholeWord: false,
                        MatchWildcards: false,
                        MatchSoundsLike: missing,
                        MatchAllWordForms: false,
                        Forward: true,
                        Wrap: wrap,
                        Format: false,
                        ReplaceWith: missing, Replace: replace);
                }

                app.ActiveDocument.SaveAs2(outputPath);
                app.ActiveDocument.Close();
                app.Quit();

            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }


        private const string ApiKey = ""; // Сюда надо APIKey от imgbb 
        private const string BaseUrl = "https://api.imgbb.com/1/upload";

        /// <summary>
        /// Загружает изображение на сервер и возвращает URL загруженного изображения.
        /// </summary>
        /// <param name="imagePath">Полный путь к изображению на диске.</param>
        /// <returns>URL загруженного изображения.</returns>
        /// <exception cref="FileNotFoundException">
        /// Выбрасывается, если файл с указанным путем не найден.
        /// </exception>
        /// <exception cref="Exception">
        /// Выбрасывается, если возникла ошибка при загрузке изображения на ImgBB.
        /// </exception>
        public async Task<string> UploadImage(string imagePath)
        {
            if (!File.Exists(imagePath))
            {
                throw new FileNotFoundException("Файл не найден: " + imagePath);
            }

            using (var client = new HttpClient())
            {
                var formData = new MultipartFormDataContent();
                var fileContent = new ByteArrayContent(File.ReadAllBytes(imagePath));
                fileContent.Headers.ContentType = MediaTypeHeaderValue.Parse("image/jpeg");
                formData.Add(fileContent, "image", Path.GetFileName(imagePath));
                formData.Add(new StringContent(ApiKey), "key");

                var response = await client.PostAsync(BaseUrl, formData);

                if (response.IsSuccessStatusCode)
                {
                    var responseContent = await response.Content.ReadAsStringAsync();
                    var uploadResponse = Newtonsoft.Json.JsonConvert.DeserializeObject<UploadResponse>(responseContent);
                    return uploadResponse.data.url;
                }
                else
                {
                    throw new Exception($"Ошибка загрузки файла: {response.StatusCode} - {response.ReasonPhrase}");
                }
            }
        }

        private class UploadResponse
        {
            public Data data { get; set; }
        }

        private class Data
        {
            public string url { get; set; }
        }
    }
}
