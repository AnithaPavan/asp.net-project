using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using DataLayer;
using context = System.Web.HttpContext;
using System.Web;
using System.Web.UI;
using System.Reflection;

namespace BusinessLayer
{
    public class Logic
    {         
        public DataLogic dataobj = new DataLogic();
        public sqlmodule moduleobject = new sqlmodule();
        
        string ActualPassword, msg = "";
        SqlDataReader rd;
        public DataTable Login(string Empid, string passwrd)
        { 
            
            DataTable dtt = new DataTable();
            dtt = dataobj.LoginDB(Empid, passwrd);  
                return dtt;
        }

        public DataTable Getcode()
        {
            try
            {
                dt= dataobj.GetCodeString();
            }
            catch { }
            return dt;

        }

        public void Deletedata()
        {
            dataobj.deleteTest_Data();
        }

        private static String exepurl;
        public void SendExcepToDB(Exception exdb, string method, string pageName)
        {
            sqlmodule objecct = new sqlmodule();
            exepurl = context.Current.Request.Url.ToString();
            dataobj.insertException(exdb, method, pageName, exepurl);           
            string UserMessage = "Some Technical Error occurred,Please visit after some time";           
            AlertMesaage(UserMessage);

        }

        public void AlertMesaage(string Message)
        {
            var page = HttpContext.Current.CurrentHandler as Page;
            ScriptManager.RegisterStartupScript(page, page.GetType(), "alert", "alert('" + Message + "')", true);
            HttpContext.Current.Response.Redirect("~/Login_page.aspx");
        }
        DataTable dt;
        public DataTable GetPrimaryKey(string Pkey)
        {
            try
            {
                dt = new DataTable();
                dt = dataobj.select_Pkey(Pkey);
            }
            catch(Exception ex) { }            
            return dt;
        }

        int count;
        public int primaryKey_Exist(string Pkey)
        {            
            try
            {
                DataTable dt = new DataTable();
                dt = dataobj.select_Pkey(Pkey);                              
                count=dt.Rows.Count;
            }
            catch (Exception ex)
            {
                SendExcepToDB(ex, MethodBase.GetCurrentMethod().Name, this.GetType().Name);
            }
            return count;
        }

        public int Insert_update_delete_Data(string pkey, string name, string description, string Price, string Model, string Supplier, string Location, string imgName, string imgPath, byte[] img_data, string operation, string update_img)
        {
            int result = dataobj.insertInventorydetailes(pkey, name, description, Price, Model, Supplier, Location, imgName, imgPath, img_data, operation, update_img);
            return result;
        }


        public void insertDetailes(string pkey,string name, string description, string Price, string Model, string Supplier, string Location, string imgName, string imgPath, byte[] img_data,string operation,string update_img)
        {
            try
            {
                int result = Insert_update_delete_Data(pkey,name, description, Price, Model, Supplier, Location, imgName, imgPath, img_data, operation, update_img);
                string msg = "";
                if (result >= 1 && operation == "insert")
                {
                    msg = "Inventory added successfully";
                }
                else if (result >= 1 && operation == "update")
                {
                    msg = "Inventory updated successfully";
                }
                else if (result >= 1 && operation == "delete")
                {
                    msg = "Inventory Removed successfully";
                }
                var page = HttpContext.Current.CurrentHandler as Page;
                ScriptManager.RegisterStartupScript(page, page.GetType(), "alert", "alert('" + msg + "');window.location ='Home_page.aspx';", true);
            }
            catch (Exception ex)
            {
                SendExcepToDB(ex, MethodBase.GetCurrentMethod().Name, this.GetType().Name);
            }           
            
        }

        public DataTable querydetail(string fromDate,string Todate)
        {
            try
            {               
                dt = new DataTable();
                dt = dataobj.selectDetailes(fromDate, Todate);
            }
            catch (Exception ex) { }
            return dt;
        }
    }
}
