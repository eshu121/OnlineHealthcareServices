using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace OnlineHealthCareServices
{
    public partial class changed_Password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblPassError.Text = "";
            }
            if (Session["MobileNo"] == null)
            {
                Response.Redirect("userLogin.aspx");
            }
        }

        protected void btnForgot_Click(object sender, EventArgs e)
        {
            SqlCommand cmd;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);
            int resCode = 0;

            cmd = new SqlCommand("ChangedPassword", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@CurrentPassword", txtCurrentPass.Text.Trim()));
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

                cmd = new SqlCommand("update UserDetail set UserPassword='" + txtNewPass.Text + "' where MobileNumber='" + Session["MobileNo"] + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                lblPassError.Text = "Your Password is Forgot Successfully.";
            }
            else
            {
                lblPassError.Text = "Your Current Password is Incorrect, Please Enter Correct Password";
            }
        }
    }
}
