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
    public partial class doctorlogin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);
        int resCode = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlCommand cmd;

            cmd = new SqlCommand("doctorLogin", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@MobileNo", txtMobile.Text.Trim()));
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
                Session["MobileNo"] = txtMobile.Text;
                Session["doctorId"] = resCode;

                Response.Redirect("Doctor/home.aspx");
            }
        }
    }
}
