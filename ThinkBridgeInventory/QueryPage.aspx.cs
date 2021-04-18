using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;

namespace ThinkBridgeInventory
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        Logic objectBL = new Logic();
        string pkey;
        protected void Page_Load(object sender, EventArgs e)
        {
            pkey = (string)Session["QR_code"];
            TextBoxFrom.Attributes["max"] = DateTime.Now.ToString("yyyy-MM-dd");
            TextBoxTo.Attributes["max"] = DateTime.Now.ToString("yyyy-MM-dd");
            if (!Page.IsPostBack)
            {
                TextBoxFrom.Text = DateTime.Now.ToString();
                TextBoxTo.Text = DateTime.Now.ToString();

            }
        }
        protected void Bind()
        {
           DataTable data = new DataTable();
            data = objectBL.querydetail(TextBoxFrom.Text,TextBoxTo.Text);
            if (data.Rows.Count == 0)
            {
                GridView1.DataSource = new object[] { null };
            }
            else
            {
                GridView1.DataSource = data;
            }
            GridView1.DataBind();
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            Bind();
        }
    }
}