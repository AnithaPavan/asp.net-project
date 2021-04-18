using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;

namespace ThinkBridgeInventory
{
    public partial class Inventory_opertion : System.Web.UI.Page
    {
        string pkey,option;
        string path; string fileName,url;
        Logic objectBL = new Logic();

        protected void Page_Load(object sender, EventArgs e)
        {
            pkey = (string)Session["QR_code"];
            option= (string)Session["option"];
            Session["QR_code"] = pkey;
            Session["option"] = option;
            
            if (!Page.IsPostBack)
            {
                if (option == "New")
                {
                    Button2.Text = "Save";
                }
                else
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

                    Button2.Text = "Update";
                }
            }
            if (FileUpload1.PostedFile != null && FileUpload1.PostedFile.ContentLength > 0)
                UpLoadAndDisplay();
        }

        static string imgName; static string imgPath;
        private void UpLoadAndDisplay()
        {
            imgName = FileUpload1.FileName;
            imgPath = "images/" + imgName;
            int imgSize = FileUpload1.PostedFile.ContentLength;
            if (FileUpload1.PostedFile != null && FileUpload1.PostedFile.FileName != "")
            {

                FileUpload1.SaveAs(Server.MapPath(imgPath));
                imgPicture.ImageUrl = "~/" + imgPath;
            }
        }

        string ImageUrl;
        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                System.IO.Stream stream = FileUpload1.PostedFile.InputStream;
                int length = FileUpload1.PostedFile.ContentLength;
                byte[] img_data = new byte[length];
                int start_byte_value = 0;
                stream.Read(img_data, start_byte_value, length);
                String extension = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName);

                string update_image = "no";
                if (FileUpload1.HasFile)
                {
                    fileName = FileUpload1.FileName.ToString();
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/images/") + fileName);
                    ImageUrl = "~/images/" + fileName;
                    update_image = "yes";

                }
                if (option == "New")
                {
                    objectBL.insertDetailes(pkey,TextBoxProduct_name.Text,TextBoxProductDescrp.Text, TextBoxProductPrice.Text, TextBoxModel.Text, TextBoxSupplier.Text, TextBoxLocation.Text, imgName, imgPath, img_data,"insert","");
                }
                else if(option == "update" && update_image=="no")
                {
                    objectBL.insertDetailes(pkey,TextBoxProduct_name.Text,TextBoxProductDescrp.Text, TextBoxProductPrice.Text, TextBoxModel.Text, TextBoxSupplier.Text, TextBoxLocation.Text, "", "", null, "update", "no");
                }
                else if (option == "update" && update_image == "yes")
                {
                    objectBL.insertDetailes(pkey,TextBoxProduct_name.Text,TextBoxProductDescrp.Text, TextBoxProductPrice.Text, TextBoxModel.Text, TextBoxSupplier.Text, TextBoxLocation.Text, imgName, imgPath, img_data, "update", "yes");
                }
                
            }
            catch (Exception ex)
            {
                objectBL.SendExcepToDB(ex, MethodBase.GetCurrentMethod().Name, this.GetType().Name);
            }
        }
        
    }
}