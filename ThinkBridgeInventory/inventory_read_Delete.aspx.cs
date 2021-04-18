using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;
using System.Data;

namespace ThinkBridgeInventory
{
    public partial class inventory_read_Delete : System.Web.UI.Page
    {
        string pkey, option;        
        Logic objectBL = new Logic();
        string url;
        protected void Page_Load(object sender, EventArgs e)
        {
            pkey = (string)Session["QR_code"];
            option = (string)Session["option"];
            Session["QR_code"] = pkey;            
            Session["option"] = option;
            //image_name,Image_url,image,IsActive
            if (!Page.IsPostBack)
            {
                DataTable data = objectBL.GetPrimaryKey(pkey);
                TextBoxProduct_name.Text = data.Rows[0]["Product_name"].ToString();
                TextBoxProductDescrp.Text = data.Rows[0]["Product_description"].ToString();
                TextBoxProductPrice.Text = data.Rows[0]["Product_price"].ToString();
                TextBoxSupplier.Text = data.Rows[0]["Supplier"].ToString();
                TextBoxModel.Text = data.Rows[0]["Model"].ToString();
                TextBoxLocation.Text = data.Rows[0]["Location"].ToString();
                url = data.Rows[0]["Location"].ToString();
                imgPicture.ImageUrl = "~/" + url;

                if (option == "Read")
                {
                    LabelIM.Text = "Inventory Read Form";
                    Read_delete.Text = "Home Page";
                }
                else
                {
                    LabelIM.Text = "Inventory Delete Form";
                    Read_delete.Text = "Delete";
                }
            }

        }

        protected void Read_delete_Click(object sender, EventArgs e)
        {
            if (option == "Read")
            {
                Response.Redirect("~/Home_page.aspx");
            }
            else
            {
                objectBL.insertDetailes(pkey, "", "", "", "", "", "", "", "", null, "delete","");
            }

        }
    }
}