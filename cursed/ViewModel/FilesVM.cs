using System;
using System.IO;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;

namespace cursed.ViewModel
{
    public class FilesVM
    {
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
