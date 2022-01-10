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
    public partial class userLogin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);
        int resCode = 0;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlCommand cmd;

            cmd = new SqlCommand("userLogin", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MobileNo", txtMobile.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter("@userPassword", txtPass.Text.Trim()));

            // get return value from procedure
            SqlParameter parm = new SqlParameter("@resCode", SqlDbType.BigInt); //output parameter
            parm.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(parm);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            resCode = Convert.ToInt32(parm.Value);
            if (resCode == -1)
            {
                Session["MobileNo"] = txtMobile.Text;
                
                Response.Redirect("verification.aspx");
            }
            else if (resCode >= 1)
            {
                Session["MobileNo"] = txtMobile.Text;
                Session["UserDetailId"] = resCode;

                if(Session["pageInfo"] != null)
                {
                    if (Session["pageInfo"].ToString() == "bookApp")
                    {
                        Session["pageInfo"] = null;
                        Response.Redirect("Book_Appointment.aspx");

                    }
                }
                else if (Session["pageInfo1"] != null)
                {
                    if (Session["pageInfo1"].ToString() == "bookLab")
                    {

                        Session["pageInfo1"] = null;
                        Response.Redirect("Lab_Test.aspx");

                    }
                }
                else if (Session["pageInfo2"] != null)
                {
                    if (Session["pageInfo2"].ToString() == "order")
                    {
                        Session["pageInfo2"] = null;
                        Response.Redirect("user_Prescription.aspx");

                    }
                }
                else
                {
                    Response.Redirect("user_home.aspx");
                }                             
            }
            else
            {
                lblLoginError.Text = "May be you are not exist User";
            }

        }

        protected void btnForgotPass_Click(object sender, EventArgs e)
        {
            SqlCommand cmd;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);
            int resCode = 0;

            cmd = new SqlCommand("forgotPassword", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MobileNo", txtMobile.Text.Trim()));
            // get return value from procedure
            SqlParameter parm = new SqlParameter("@resCode", SqlDbType.BigInt); //output parameter
            parm.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(parm);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            resCode = Convert.ToInt32(parm.Value);

            if (resCode == 1)
            {
                Session["MobileNo"] = txtMobile.Text;

                Response.Redirect("forgot_Verifiaction.aspx");
            }
            else
            {
                lblLoginError.Text = "Your Mobile No. is Incorrect, Please Enter Correct Mobile No.";
            }



        }
    }
}