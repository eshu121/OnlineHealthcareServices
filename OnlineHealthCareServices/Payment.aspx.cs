using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace OnlineHealthCareServices
{
    public partial class Payment1 : System.Web.UI.Page
    {
        int PrescriptionId = 0;
        int testId = 0;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Request.QueryString["PresId"] != null)
            {
                PrescriptionId = Convert.ToInt32(Request.QueryString["PresId"]);

                Amount(PrescriptionId);

            }
            else if(Request.QueryString["labTestId"] != null)
            {
                testId = Convert.ToInt32(Request.QueryString["labTestId"]);
                testAmount(testId);
            }
            

        }
       

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (PrescriptionId != 0)
            {
                SqlCommand cmd = new SqlCommand("update PrescriptionDetail set paymentStatus=1 where PrescriptionDetailId=" + PrescriptionId + "", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                // Response.Redirect("paymentSuccess.aspx");
            }
            else if (testId != 0)
            {
                SqlCommand cmd = new SqlCommand("update LabTest set PaymentStatus=1 where labTestId=" + testId + "", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("paymentSuccess.aspx");
            }
            else
            {
                Response.Redirect("Payment.aspx");
                
            }
            
        }
        private void Amount(int PrescriptionId)
        {
            SqlDataAdapter adap = new SqlDataAdapter("select (Amount - Discount) as Paid from PrescriptionDetail where PrescriptionDetailId=" + PrescriptionId + "", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            Label1.Text = dt.Rows[0]["Paid"].ToString();
        }
        private void testAmount(int testId)
        {
            SqlDataAdapter adap = new SqlDataAdapter("select Price from LabTest where labTestId = " + testId + "", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            Label1.Text = dt.Rows[0]["Price"].ToString();
        }
    }
}