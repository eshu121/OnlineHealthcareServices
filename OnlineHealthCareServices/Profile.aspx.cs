using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace OnlineHealthCareServices
{
    public partial class Profile : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);
        int UserDetailId = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserDetailId"] != null && Session["UserDetailId"].ToString() != "")
            {
                UserDetailId = Convert.ToInt32(Session["UserDetailId"]);
            }
            else
            {
                Response.Redirect("userLogin.aspx");
            }


            SqlDataAdapter adap = new SqlDataAdapter("select * from UserDetail where isActive=1 and UserDetailId=" + UserDetailId + "", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);

            if (dt.Rows.Count > 0)
            {

                txtUserName.Text = dt.Rows[0]["FirstName"].ToString();
                txtAge.Text = dt.Rows[0]["Age"].ToString();
                txtAddress.Text = dt.Rows[0]["AddresssLine1"].ToString();
                imgProfile.ImageUrl = "~/UserProfile/" + dt.Rows[0]["ProfileImg"].ToString();
                txtMobileNo.Text = dt.Rows[0]["MobileNumber"].ToString();
                txtUser.Text = dt.Rows[0]["EmailId"].ToString();
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["UserDetailId"] = null;
            Response.Redirect("userLogin.aspx");
        }
    }
}