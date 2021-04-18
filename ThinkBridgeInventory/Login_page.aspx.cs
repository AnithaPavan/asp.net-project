using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Reflection;
using BusinessLayer;

namespace ThinkBridgeInventory
{
    public partial class Login_page : System.Web.UI.Page
    {
        Logic objectBL = new Logic();
        String ActualPassword = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtPassword_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Login_btn(object sender, EventArgs e)
        {           
            try
            {
               // SqlDataReader reader =  //(operation, tableName, columnName, value, length, condition, constring);
                
                DataTable dt1 = objectBL.Login(txtUserName.Text, txtPassword.Text);
                //dt.Load(reader);
                if (dt1.Rows.Count!=0)
                {
                    //while (reader.Read())
                    //{
                    //    Session["UserRight"] = reader.GetString(user_right_column);
                    //    ActualPassword = reader.GetString(password_column);
                    //    Session["UserName"] = reader.GetString(name_column);
                    //    Session["UserId"] = reader.GetString(emp_id_column);
                    //}
                    Response.Redirect("~/Home_page.aspx",false);                    
                   Context.ApplicationInstance.CompleteRequest();
                }
                else
                {
                    lblErrorMessage.Text = "Invalid user credentials";
                    lblErrorMessage.Visible = true;
                }
            }
            catch(Exception ex)
            {
                //objectBL.SendExcepToDB(ex, MethodBase.GetCurrentMethod().Name, this.GetType().Name);
            }
               
        }
    }
}