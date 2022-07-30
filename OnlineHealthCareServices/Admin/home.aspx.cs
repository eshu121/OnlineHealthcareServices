using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineHealthCareServices.Admin
{
    public partial class home : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
            bindUserDetail();
            bindUserDetail1();
            bindUserDetail2();
            bindUserDetail3();
            bindRepeater();
        }
        protected void bindRepeater()
        {
            SqlDataAdapter adap = new SqlDataAdapter("select ap.appointmentid, CONCAT(ap.FirstName, ' ', ap.LastName) as Name, ap.EmailId, ap.MobileNo, ap.AppointmentDate, gd.genderName, sl.slotName, dd.doctorName, ds.departmentName from Appointment ap inner join DoctorDetails dd on ap.DoctorId = dd.doctorId inner join Department ds on ap.DiseaseId = ds.departmentId inner join Gender gd on ap.GenderId = gd.genderId inner join Slot sl on ap.Slot = sl.slotId", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            DataTable dt3 = dt.Rows.Cast<System.Data.DataRow>().Take(5).CopyToDataTable();
            Repeater1.DataSource = dt3;
            Repeater1.DataBind();
            SqlDataAdapter adap1 = new SqlDataAdapter(" select ds.doctorId,ds.doctorName,ds.EmailId,ds.MobileNo,ds.Degree,dp.departmentName,ds.Doctorimg from DoctorDetails ds inner join Department dp on ds.Department=dp.departmentId ", con);
            DataTable dt1 = new DataTable();
            adap1.Fill(dt1);
            DataTable dt2 = dt1.Rows.Cast<System.Data.DataRow>().Take(5).CopyToDataTable();
            Repeater2.DataSource = dt2;
            Repeater2.DataBind();


        }
        protected void bindUserDetail()
        {
            SqlDataAdapter adap = new SqlDataAdapter("select count(UserDetailId) as users from UserDetail ", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);
                Label4.Text = dt.Rows[0]["users"].ToString();
        }
        protected void bindUserDetail1()
        {
            SqlDataAdapter adap = new SqlDataAdapter("select count(appointmentid) as appointment from Appointment ", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            Label2.Text = dt.Rows[0]["appointment"].ToString();
        }
        protected void bindUserDetail2()
        {
            SqlDataAdapter adap = new SqlDataAdapter("select count(labTestDetailId) as labtest from LabTestDetail ", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            Label3.Text = dt.Rows[0]["labtest"].ToString();
        }
        protected void bindUserDetail3()
        {
            SqlDataAdapter adap = new SqlDataAdapter("select count(PrescriptionDetailId) as prescription from PrescriptionDetail", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            Label1.Text = dt.Rows[0]["prescription"].ToString();
        }
    }
}