using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace cursed.ViewModel.Tests
{
    [TestClass()]
    public class OrderVMTests
    {
        /// <summary>
        /// Тест проверки создания гарантийной заявки, когда вводится пустой тип комплектующего (не выбран в combobox).
        /// Ожидается исключение.
        /// </summary>
        [TestMethod()]
        [ExpectedException(typeof(Exception))]
        public void CreateOrderTest_NoComponentSelected_ThrowsException()
        {
            bool auth = OrderVM.CreateOrder("", "Problema", "BSOD");
        }
        /// <summary>
        /// Тест проверки создания гарантийной заявки, когда вводится пустое описание.
        /// Ожидается исключение.
        /// </summary>
        [TestMethod()]
        [ExpectedException(typeof(Exception))]
        public void CreateOrderTest_NoDescription_ThrowsException()
        {
            bool order = OrderVM.CreateOrder("Процессор", "", "BSOD");
        }
        /// <summary>
        /// Тест проверки создания гарантийной заявки, когда вводится пустое поле выбора компьютера (не выбран в combobox).
        /// Ожидается исключение.
        /// </summary>
        [TestMethod()]
        [ExpectedException(typeof(Exception))]
        public void CreateOrderTest_NoComputerSelected_ThrowsException()
        {
            bool order = OrderVM.CreateOrder("Процессор", "Problema", "");
        }
        /// <summary>
        /// Тест проверки создания гарантийной заявки, когда вводится пустое поле выбора компьютера (не выбран в combobox).
        /// Ожидается исключение.
        /// </summary>
        [TestMethod()]
        public void CreateOrderTest_AllOk_ReturnsTrue()
        {
            bool order = OrderVM.CreateOrder("Процессор", "Problema", "BSOD");
            bool excepted = true;
            Assert.AreEqual(excepted, order);
        }
    }
}