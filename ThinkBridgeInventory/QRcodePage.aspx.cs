using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using BusinessLayer;
using System.Data;

namespace ThinkBridgeInventory
{
    public partial class QRcodePage : System.Web.UI.Page
    {
        string Pkey;
        Logic objectBL = new Logic();
        protected void Page_Load(object sender, EventArgs e)
        {
            LabelError.Visible = false;
        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            if (TextSearch.Text != "")
            {
                Session["QR_code"] = TextSearch.Text;
                Pkey = Session["QR_code"].ToString();                
                DataTable dt = objectBL.GetPrimaryKey(TextSearch.Text);                
                if (dt.Rows.Count != 0)
                {                   
                    if ((string)Session["option"] == "Read")
                    {                        
                            Session["option"] = "Read";
                            Response.Redirect("~/inventory_read_Delete.aspx");
                       
                    }
                    else if ((string)Session["option"] == "delete")
                    {                        
                            Session["option"] = "update";
                            Response.Redirect("~/inventory_read_Delete.aspx");
                        
                    }
                    else if ((string)Session["option"] == "update")
                    {
                        Session["option"] = "update";
                        Response.Redirect("~/Inventory_Assign_update.aspx");
                    }
                    else if ((string)Session["option"] == "query")
                    {
                        Session["option"] = "query";
                        Response.Redirect("~/QueryPage.aspx");
                    }
                }
                else
                {
                    LabelError.Text = "This unique code not Exist";
                    LabelError.Visible = true;
                }
            }
            else
            {
                LabelError.Text = "please enter unique code";
                LabelError.Visible = true;
            }

        }
    
    }
}