using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;


namespace OnlineHealthCareServices.Layout
{
    public partial class UserMaster : System.Web.UI.MasterPage
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);
        int UserDetailId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            UserDetailId = Convert.ToInt32(Session["UserDetailId"]);


            SqlDataAdapter adap = new SqlDataAdapter("select * from UserDetail where isActive=1 and UserDetailId=" + UserDetailId + "", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);

            if (dt.Rows.Count > 0)
            {

                imgProfile.ImageUrl = "~/UserProfile/" + dt.Rows[0]["ProfileImg"].ToString();

            }

        }

        protected void btnSignOut_Click(object sender, EventArgs e)
        {
            Session["UserDetailId"] = null;
            Response.Redirect("userLogin.aspx");
        }
    }
}