using Microsoft.VisualStudio.TestTools.UnitTesting;
using cursed.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using cursed.Model;
using System.Runtime.Remoting.Contexts;
using System.Data.Entity.Validation;

namespace cursed.ViewModel.Tests
{
    [TestClass()]
    public class ComputerVMTests
    {
        Core db = new Core();
        [TestMethod()]
        public void AddComputerComponentRelationship_ValidData_CreatesRelationship()
        {
            var component = new Components { ComponentModel = "Test Component", ComponentPrice = 1000, ComponentAmount = 1, ComponentManufacturerId = 1, ComponentTypeId = 1, ComponentArticle = "TestArticle" };
            db.context.Components.Add(component);
            db.context.SaveChanges();
            ComputerVM.addComputerComponentRelationship(1, "Test Component");

            var relationship = db.context.ComputerComponentRelationship
                .Where(r => r.ComputerId == 1 && r.Components.ComponentModel == "Test Component")
                .FirstOrDefault();

            Assert.IsNotNull(relationship);
        }

        [TestMethod()]
        public void CreateNewComputerTest()
        {

            int computerId = ComputerVM.CreateNewComputer("Test Computer", 1, "test.jpg");
            var computer = db.context.Computers.FirstOrDefault(c => c.ComputerId == computerId);

            Assert.IsNotNull(computer);
            Assert.AreEqual("Test Computer", computer.ComputerName);
            Assert.AreEqual(1, computer.ComputerTypeId);
            Assert.AreEqual("test.jpg", computer.ComputerPicPath);
        }


        [TestMethod()]
        public void CreateNewComputer_EmptyName_ThrowsException()
        {
                Assert.ThrowsException<DbEntityValidationException>(() => ComputerVM.CreateNewComputer(null, 1, "test.jpg"));
        }
    }
}