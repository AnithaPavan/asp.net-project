using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Reflection;
using System.Data;

namespace DataLayer
{
   public class DataLogic
    {
        public sqlmodule moduleobject = new sqlmodule();
        public DataTable LoginDB(string Empid,string passwrd)
        {
            try
            {                
                reader = moduleobject.ExecuteReader("select * from Login_Table where UserID='" + Empid + "' and Password='" + passwrd + "'");
                dt = new DataTable();
                dt.Load(reader);
            }
            catch { }                      
            
            return dt;
        }

        DataTable dt;
        public DataTable GetCodeString()
        {
            try
            {
               reader = moduleobject.ExecuteReader("select TOP(1) QR_code from inventory_Table where IsActive='1' order by id DESC");
                dt.Load(reader); 
            }
            catch(Exception ex) { }
            return dt;
        }
        public void insertException(Exception exdb, string method, string pageName, String exepurl)
        {
            try
            {
                string query = "insert into ExceptionLogging_Tbl(ExceptionMsg,ExceptionType,ExceptionURL,ExceptionSource,method_name,LogDate,PageName) values ('" + exdb.Message.ToString() + "','" + exdb.GetType().Name.ToString() + "','" + exepurl + "','" + exdb.StackTrace.ToString() + "','" + method + "','" + DateTime.Now.ToString("dd / MM / yyyy") + "','" + pageName + "')";
                moduleobject.SqlExecutenonQuery(query);
            }
            catch
            {

            }
            
        }
        public void deleteTest_Data()
        {
            string query = "delete from inventory_Table where QR_code='ASSIGNMN.2021.04.18.0001'";
            moduleobject.SqlExecutenonQuery(query);
        }

        SqlDataReader reader;
        public DataTable select_Pkey(string Pkey)
        {
            try
            {
                reader = moduleobject.ExecuteReader("select * from inventory_Table where QR_code ='" + Pkey + "' and IsActive='1'");
                dt = new DataTable();
                dt.Load(reader);
            }
            catch (Exception ex)
            {

            }
            return dt;

        }
        public DataTable selectDetailes(string FromDate,string ToDate)
        {
            try
            {
                reader = moduleobject.ExecuteReader("select * from inventory_Table where CONVERT(DATE,Bought_on)>=CONVERT(DATE,'"+FromDate+"') and CONVERT(DATE,Bought_on)<=CONVERT(DATE,'"+ToDate+"') and IsActive='1'");
                dt = new DataTable();
                dt.Load(reader);
            }
            catch (Exception ex)
            {

            }
            return dt;

        }


        int result;
        public int insertInventorydetailes(string pkey,string name,string description,string Price,string Model,string Supplier,string Location,string imgName,string imgPath, byte[] img_data,string operation,string update_img)
        {
            try
            {
                switch (operation)
                {
                    case "insert":
                        string query1 = "insert into inventory_Table(QR_code,Product_name,Product_description,Product_price,Model,Supplier,Location,Bought_on,image_name,Image_url,image,IsActive) values('" + pkey + "','" + name + "','" + description + "','" + Price + "','" + Model + "','" + Supplier + "','" + Location + "','" + DateTime.Now.ToString("yyyy-MM-dd") + "','" + imgName + "','" + imgPath + "','" + img_data + "','1')";
                        result = moduleobject.SqlExecutenonQuery(query1);
                        break;
                    case "update":
                        if (update_img == "yes")
                        {
                            query1 = "update inventory_Table set Product_name='" + name + "',Product_description='" + description + "',Product_price='" + Price + "',Model='" + Model + "',Supplier='" + Supplier + "',Location='" + Location + "',image_name='" + imgName + "',Image_url='" + imgPath + "',image='" + img_data + "' where IsActive='1' and QR_code='" + pkey + "'";
                            result = moduleobject.SqlExecutenonQuery(query1);
                        }
                        else if (update_img == "no")
                        {
                            query1 = "update inventory_Table set Product_name='" + name + "',Product_description='" + description + "',Product_price='" + Price + "',Model='" + Model + "',Supplier='" + Supplier + "',Location='" + Location + "' where IsActive='1' and QR_code='" + pkey + "'";
                            result = moduleobject.SqlExecutenonQuery(query1);
                        }
                        break;
                    case "delete":
                        query1 = "update inventory_Table set IsActive='0' where QR_code='" + pkey + "'";
                        result = moduleobject.SqlExecutenonQuery(query1);
                        break;
                }
            }
            catch { }
            
            return result;
        }

    }
}
