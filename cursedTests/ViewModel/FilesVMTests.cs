using Microsoft.VisualStudio.TestTools.UnitTesting;
using cursed.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Text.RegularExpressions;

namespace cursed.ViewModel.Tests
{
    [TestClass()]
    public class FilesVMTests
    {
        [TestMethod()]
        public void UploadImage_InvalidImagePath_ThrowsFileNotFoundException()
        {
            // Arrange
            var imageUploader = new FilesVM();
            var invalidImagePath = "invalid/path/to/image.jpg";

            // Act & Assert
            Assert.ThrowsExceptionAsync<FileNotFoundException>(() => imageUploader.UploadImage(invalidImagePath));
        }
        [TestMethod()]
        public async Task UploadImage_ValidImagePath_ReturnsImageUrl()
        {
            var imageUploader = new FilesVM();
            var imagePath =  @"../../Resources/Images/testimage.jpg";

            var imageUrl = await imageUploader.UploadImage(imagePath);

            // Assert
            Regex pattern = new Regex("https?:\\/\\/(www\\.)?[-a-zA-Z0-9@:%._\\+~#=]{1,256}\\.[a-zA-Z0-9()]{1,6}\\b([-a-zA-Z0-9()@:%_\\+.~#?&//=]*)");
            StringAssert.Matches(imageUrl, pattern);
        }

    }
}