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

namespace OnlineHealthCareServices.Admin
{
    public partial class Doctors : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);
        
        commonUse cu = new commonUse();
        string imgPath = string.Empty;
        DataTable dt;
        int docId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
            bindRepeater();
            bindDepart();
            bindGender();

        }

       

            protected void bindRepeater() {
            SqlDataAdapter adap = new SqlDataAdapter(" select ds.doctorId,ds.doctorName,ds.EmailId,ds.MobileNo,ds.Degree,dp.departmentName,ds.Doctorimg from DoctorDetails ds inner join Department dp on ds.Department=dp.departmentId ", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();

        }
        public void lnkDelete(object sender, EventArgs e)
        {

            int subTestId = 0;
            RepeaterItem item = (sender as LinkButton).NamingContainer as RepeaterItem;
            HiddenField hdnDoctorId = (HiddenField)item.FindControl("hdnDoctorId");
            subTestId = Convert.ToInt32(hdnDoctorId.Value);
            SqlCommand cmd = new SqlCommand("delect from DoctorDetails where doctorId="+subTestId+"", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            imgPath = string.Empty;
            string fileName = string.Empty;

            if (FileUpload1.HasFile)
            {
                fileName = FileUpload1.FileName;
                imgPath = "~/DoctorImg/" + FileUpload1.FileName;
                FileUpload1.SaveAs(Server.MapPath(imgPath));
            }
            
            SqlCommand cmd = new SqlCommand("insert into DoctorDetails(doctorName,Degree,Department,GenderId,MobileNo,EmailId,Exprience,OPDSchedule,Doctorimg,createdBy,createdOn) values('" + txtDoctorName.Text + "','" + txtEducation.Text + "'," + ddlDepart.Text + "," + ddlGender.Text + ",'" + txtMobile.Text + "','" + txtEmail.Text + "','" + txtExprience.Text + "','" + txtOpd.Text + "','" + fileName + "',1,getdate()) ", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Write("<script language='javascript'>alert('Doctor Add Successfully.');</script>");
            Response.Redirect("Doctor.aspx");

        }
        private void bindGender()
        {
            dt = new DataTable();
            dt = cu.bindGender();

            ddlGender.DataSource = dt;
            ddlGender.DataTextField = "genderName";
            ddlGender.DataValueField = "genderId";
            ddlGender.DataBind();
            ddlGender.Items.Insert(0, "Select Gender");
            ddlGender.SelectedIndex = 0;
        }
        private void bindDepart()
        {
            SqlDataAdapter adap = new SqlDataAdapter("select * from Department", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            ddlDepart.DataSource = dt;
            ddlDepart.DataTextField = "departmentName";
            ddlDepart.DataValueField = "departmentId";
            ddlDepart.DataBind();
            ddlDepart.Items.Insert(0, "Select Department");
            ddlDepart.SelectedIndex = 0;
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
        }

        }
    }