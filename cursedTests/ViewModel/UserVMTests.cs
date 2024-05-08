using Microsoft.VisualStudio.TestTools.UnitTesting;
using cursed.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using cursed.Model;

namespace cursed.ViewModel.Tests
{
    [TestClass()]
    public class UserVMTests
    {
        /// <summary>
        /// Тест проверки авторизации пользователя, когда вводится пустой логин.
        /// Ожидается исключение.
        /// </summary>
        [TestMethod()]
        [ExpectedException(typeof(InvalidOperationException))]
        public void AuthCheckTest_NoLoginField_ThrowsException()
        {
            bool auth = UserVM.AuthCheck("", "password");
        }
        /// <summary>
        /// Тест проверки авторизации пользователя, когда вводится пустой пароль.
        /// Ожидается исключение.
        /// </summary>
        [TestMethod()]
        [ExpectedException(typeof(InvalidOperationException))]
        public void AuthCheckTest_NoPasswordField_ThrowsException()
        {
            bool auth = UserVM.AuthCheck("login", "");
        }
        /// <summary>
        /// Тест проверки авторизации пользователя, когда вводится несуществующий пользователь.
        /// Предполагается, что пользователя с данными для входа "." в виде логина и пароля не существует в базе данных.
        /// Ожидается исключение.
        /// </summary>
        [TestMethod()]
        [ExpectedException(typeof(InvalidOperationException))]
        public void AuthCheckTest_UserDoesntExist_ThrowsException()
        {
            bool auth = UserVM.AuthCheck(".", ".");
        }

        /// <summary>
        /// Тест проверки авторизации пользователя, когда вводится связка логин-пароль от учётной записи администратора.
        /// Предполагается, что пользователь со связкой "admin:admin" существует в базе данных.
        /// </summary>
        [TestMethod()]
        public void AuthCheckTest_Admin_ReturnsTrue()
        {
            bool auth = UserVM.AuthCheck("admin", "admin");
            Assert.IsTrue(auth);
        }
    }
}