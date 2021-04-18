using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThinkBridgeInventory
{
    public partial class Home_page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void NewInventory_Click(object sender, EventArgs e)
        {
            Session["option"] = "New";
            Response.Redirect("~/NewQRCode.aspx");
        }
        protected void ReadInventory_click(object sender, EventArgs e)
        {
            Session["option"] = "Read";
            Response.Redirect("~/QRcodePage.aspx");
        }
        protected void Query_click(object sender, EventArgs e)
        {
            Session["option"] = "query";
            Response.Redirect("~/QueryPage.aspx");
        }
        protected void DeleteInventory_click(object sender, EventArgs e)
        {
            Session["option"] = "delete";
            Response.Redirect("~/QRcodePage.aspx");
        }
        protected void UpdateInventory_click(object sender, EventArgs e)
        {
            Session["option"] = "update";
            Response.Redirect("~/QRcodePage.aspx");
        }
        
    }
}