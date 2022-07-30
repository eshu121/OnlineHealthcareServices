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
    public partial class doctor : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);
        int UserDetailId;
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

            bindDoctor();
        }
        private void bindDoctor()
        {
            SqlDataAdapter adap = new SqlDataAdapter("select * from DoctorDetails ", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            DataList1.DataSource = dt;
            DataList1.DataBind();
        }
    }
}