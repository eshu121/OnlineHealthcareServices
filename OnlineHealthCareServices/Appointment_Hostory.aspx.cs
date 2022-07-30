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

namespace OnlineHealthCareServices
{
    public partial class Appointment_Hostory : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);

        int DiseaseId = 0;
        int resCode;
        string imgPath = string.Empty;
        DataTable dt;
        commonUse cu = new commonUse();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindRepeater();
            }
        }

        protected void bindRepeater()
        {
            SqlDataAdapter adap = new SqlDataAdapter("select ap.appointmentid, CONCAT(ap.FirstName, ' ', ap.LastName) as Name, ap.EmailId, ap.MobileNo, ap.AppointmentDate, gd.genderName, sl.slotName, dd.doctorName, ds.departmentName from Appointment ap inner join DoctorDetails dd on ap.DoctorId = dd.doctorId inner join Department ds on ap.DiseaseId = ds.departmentId inner join Gender gd on ap.GenderId = gd.genderId inner join Slot sl on ap.Slot = sl.slotId", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();


        }

    }
}