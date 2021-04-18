using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using BusinessLayer;
using System.Data;
using DataLayer;

namespace UnitTestProject1
{
    [TestClass]
    public class UnitTest1
    {
        Logic objectBL = new Logic();
        [TestMethod]
        public void LognMethod()
        {
            DataTable dt=new DataTable();
            dt = objectBL.Login("THINK_01", "123");
            Assert.AreEqual(dt.Rows.Count, 1);
        }

        [TestMethod]
        public void InsertMethod()
        {
            objectBL.Deletedata();
            int result = objectBL.Insert_update_delete_Data("ASSIGNMN.2021.04.18.0001","Furniture","good product","5000","samsung","amazon","banglore","home2.jpg","images/home2.jpg",null,"insert",""); 
            Assert.AreEqual(result, 1);
        }
        [TestMethod]
        public void querydetailMethod()
        {
            DataTable dt = new DataTable();
            dt = objectBL.querydetail(DateTime.Now.ToString("yyyy-MM-dd"), DateTime.Now.ToString("yyyy-MM-dd"));            
            Assert.IsTrue(dt.Rows.Count > 0, "Expected actualCount to be greater than 0.");
        }
        [TestMethod]
        public void GetPrimaryKeyMethod()
        {
            DataTable dt = new DataTable();
            dt = objectBL.GetPrimaryKey("ASSIGNMN.2021.04.18.0001");
            Assert.AreEqual(dt.Rows.Count, 1);
            objectBL.Deletedata();
        }
    }
}
