using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineHealthCareServices.Doctor
{
    public partial class Patients : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);
        int DoctorId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["doctorId"] != null && Session["doctorId"].ToString() != "")
            {
                DoctorId = Convert.ToInt32(Session["doctorId"]);
            }
            else
            {
                Response.Redirect("userLogin.aspx");
            }


            if (IsPostBack)
                return;
            bindRepeater();
        }

        protected void bindRepeater()
        {
            SqlDataAdapter adap = new SqlDataAdapter("select * from Appointment ap inner join Gender gd on ap.GenderId=gd.genderId where ap.DoctorId="+DoctorId+"", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();

        }


    }
}