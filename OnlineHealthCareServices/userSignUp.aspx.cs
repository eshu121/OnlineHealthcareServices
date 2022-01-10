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
    public partial class userSignUp : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);
        int resCode = 0;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            
                Session["EmailId"] = txtEmail.Text;

                SqlCommand cmd;

                cmd = new SqlCommand("sp_createAccount", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@FirstName", txtUsername.Text.Trim()));
                cmd.Parameters.Add(new SqlParameter("@MobileNo", txtMobileNo.Text.Trim()));
                cmd.Parameters.Add(new SqlParameter("@EmailId", txtEmail.Text.Trim()));

                cmd.Parameters.Add(new SqlParameter("@Password", txtPass.Text.Trim()));

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
                    lblError.Text = "Your Account is Created Successfully.";
                }
                else
                {
                    lblError.Text = "Your Account Exist, Please Login";
                }


        }
    }
}