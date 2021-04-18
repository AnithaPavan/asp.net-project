using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThinkBridgeInventory
{
    public partial class Masterpage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Home_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home_page.aspx");
        }

        protected void BtAdminLogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();

            var page = HttpContext.Current.CurrentHandler as Page;
            ScriptManager.RegisterStartupScript(page, page.GetType(), "alert", "alert('Do you want to Logout?');window.location ='Login_page.aspx';", true);
            //Response.Redirect("~/Login_Page.aspx");
        }
    }
}