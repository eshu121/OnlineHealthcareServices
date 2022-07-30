using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using OnlineHealthCareServices.DAL;

namespace OnlineHealthCareServices.Doctor
{
    public partial class home : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);

        int doctorId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
            if (Session["doctorId"] != null && Session["doctorId"].ToString() != "")
            {
                doctorId = Convert.ToInt32(Session["doctorId"]);
            }
            else
            {
                Response.Redirect("../doctorlogin.aspx");
            }
            bindUserDetail();
            bindUserDetail1();
            
            bindRepeater();
        }
        protected void bindRepeater()
        {
            SqlDataAdapter adap = new SqlDataAdapter("select ap.appointmentid, CONCAT(ap.FirstName, ' ', ap.LastName) as Name, ap.EmailId, ap.MobileNo, ap.AppointmentDate, gd.genderName, sl.slotName, dd.doctorName, ds.departmentName from Appointment ap inner join DoctorDetails dd on ap.DoctorId = dd.doctorId inner join Department ds on ap.DiseaseId = ds.departmentId inner join Gender gd on ap.GenderId = gd.genderId inner join Slot sl on ap.Slot = sl.slotId where ap.DoctorId="+doctorId+"", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            


        }
        protected void bindUserDetail()
        {
            SqlDataAdapter adap = new SqlDataAdapter("select count(appointmentid) as appointment from Appointment where doctorId=" + doctorId + " ", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            Label4.Text = dt.Rows[0]["appointment"].ToString();
        }
        protected void bindUserDetail1()
        {
            SqlDataAdapter adap = new SqlDataAdapter("select count(appointmentid) as appointment from Appointment where doctorId="+doctorId+" ", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            Label2.Text = dt.Rows[0]["appointment"].ToString();
        }
       


    }
}