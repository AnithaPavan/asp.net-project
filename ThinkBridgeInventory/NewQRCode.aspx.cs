using System;
using System.Web.UI;
using System.Data;
using BusinessLayer;
using System.Reflection;

namespace ThinkBridgeInventory
{
    public partial class NewQRCode : System.Web.UI.Page
    {
        string PrimaryKey;
        string Query;
        static DataTable data = new DataTable();
        Logic objectBL = new Logic();        
        string CurrentDate = DateTime.Now.ToString("yyyy.MM.dd");
        string pk, previousDate, counterValueDB, cv;
        int counterValue = 0001;
        DateTime pDate; DateTime cDate;
        int startDate = 9, lengthOfDate = 10, startCValue = 20, lenghthOfCValue = 4;

        protected void Page_Load(object sender, EventArgs e)
        {
            pkvalue.Text = create_barcode();
            PrimaryKey = pkvalue.Text;
            Session["QR_code"] = pkvalue.Text;
        }

        protected void PrintQRcode_Click(object sender, EventArgs e)
        {
            Session["QR_code"] = pkvalue.Text;           
            Response.Redirect("~/Inventory_Assign_update.aspx",false);
            Context.ApplicationInstance.CompleteRequest();
        }

        string BarcodeString;
        protected string create_barcode()
        {
            try
            {
                BarcodeString = "THINKBDG"; string[] value = { "" };
                //get the last row in the Primary Key coll   

                DataTable dataTable = objectBL.Getcode();                
                if (dataTable==null)//Checking if object is null
                {
                    //Than add the currentDate and start the counterValue from 0001.
                    string counterValue1 = counterValue.ToString();//convert int to string
                    counterValue1 = "0001";
                    PrimaryKey = BarcodeString + "." + CurrentDate + "." + counterValue1;//Seperating currentdate and countervalue with "."
                }
                else
                {
                    int row_no = 0, col_no = 0;
                    pk = dataTable.Rows[row_no][col_no].ToString();
                    //fetch previous_date and counter value
                    previousDate = pk.Substring(startDate, lengthOfDate);  // previous_date = Strint2date(substring(previous_primary_key,0,10))
                    counterValueDB = pk.Substring(startCValue, lenghthOfCValue); // COunter_value = substring(previous_primary_key,10,14)

                    pDate = DateTime.Parse(previousDate);

                    CurrentDate = DateTime.Now.ToString("yyyy.MM.dd");//fetch current_date from system
                    cDate = DateTime.Parse(CurrentDate);

                    if (cDate > pDate)
                    {
                        //store the currentdate to primarykey and start the countervalue from 0001
                        cv = "0001";
                        PrimaryKey = BarcodeString + "." + CurrentDate + "." + cv;
                    }

                    else if (CurrentDate == previousDate)
                    {
                        //Increment the countervalue
                        string s = counterValueDB;
                        int number = Convert.ToInt32(s);
                        int initial_value = 1;
                        number += initial_value;
                        string str = number.ToString("D4");
                        PrimaryKey = BarcodeString + "." + CurrentDate + "." + str;
                    }

                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('There is something wrong with Date format of your system!!!');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                objectBL.SendExcepToDB(ex, MethodBase.GetCurrentMethod().Name, this.GetType().Name);
            }
            return PrimaryKey;
        }
    }
}