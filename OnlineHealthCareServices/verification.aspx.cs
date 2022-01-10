using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;
using System.Configuration;
using OnlineHealthCareServices.DAL;

namespace OnlineHealthCareServices
{
    public partial class verification : System.Web.UI.Page
    {
        string mobileNo = string.Empty;
        string emailId = string.Empty;
        commonUse ob = new commonUse();

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["MobileNo"] == null)
            {
                Response.Redirect("userLogin.aspx");
            }

            if (!IsPostBack)
            {
                sendOTP();
                lblMsg.Text = "OTP has been sent successfully on your registered mail.";
                pnlVerify.Visible = true;
                pnlLogin.Visible = false;
            }
        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {
            if (ViewState["otp"].ToString() == txtOTP.Text.Trim())
            {

                SqlCommand cmd = new SqlCommand("update UserDetail set isVerfied=1 where MobileNumber='" + Session["MobileNo"] + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                pnlVerify.Visible = false;
                pnlLogin.Visible = true;
                lblVerify.Text = "Your Account is Verified,Please Login";

            }
            else
            {
                lblVerify.Text = "OTP is not match,Please Enter 6 Digit correct OTP.";
            }
        }

        protected void btnResend_Click(object sender, EventArgs e)
        {
            sendOTP();
            lblMsg.Text = "OTP resend has been sent successfully on your registered mail.";

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("userLogin.aspx");
        }
        protected void sendOTP()
        {
            mobileNo = string.Empty;
            emailId = string.Empty;

            mobileNo = Session["MobileNo"].ToString();

            SqlDataAdapter adap = new SqlDataAdapter("select EmailId from UserDetail where MobileNumber=" + mobileNo + "", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                emailId = dt.Rows[0]["EmailId"].ToString();
                ViewState["otp"] = ob.sendOTP(emailId, "Verify Account");
            }
        }

    }
}