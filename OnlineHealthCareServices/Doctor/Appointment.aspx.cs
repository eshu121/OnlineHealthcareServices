using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace OnlineHealthCareServices.Doctor
{
    public partial class Appointment : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);
        int DoctorId = 0;
        string imgPath = string.Empty;
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


            if (!IsPostBack)
            {
                bindRepeater();
            }
        }
        protected void bindRepeater()
        {
            SqlDataAdapter adap = new SqlDataAdapter("select ap.appointmentid, CONCAT(ap.FirstName, ' ', ap.LastName) as Name, ap.EmailId, ap.MobileNo, ap.AppointmentDate, gd.genderName, sl.slotName, dd.doctorName, ds.departmentName from Appointment ap inner join DoctorDetails dd on ap.DoctorId = dd.doctorId inner join Department ds on ap.DiseaseId = ds.departmentId inner join Gender gd on ap.GenderId = gd.genderId inner join Slot sl on ap.Slot = sl.slotId where ap.DoctorId=" + DoctorId + "", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();


        }
    }
}