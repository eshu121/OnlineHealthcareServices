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
    public partial class addDoctor : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);
       
        int DiseaseId = 0;
        int resCode;
        string imgPath = string.Empty;
        DataTable dt;
        int docId = 0;
        commonUse cu = new commonUse();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["doctorId"] != null)
            {
                docId = Convert.ToInt32(Request.QueryString["doctorId"]);
                binddata(docId);
            }


            if (!IsPostBack)
            {
                bindDepart();
                bindGender();
            }
        }

        protected void binddata(int docId)
        {
            if (docId != 0)
            {
                SqlDataAdapter adap = new SqlDataAdapter("select * from DoctorDetails where doctorId=" + docId+"", con);
                DataTable dt = new DataTable();
                adap.Fill(dt);
                if (dt.Rows.Count > 0)
                {

                    txtDoctorName.Text = dt.Rows[0]["doctorName"].ToString();

                    txtEducation.Text = dt.Rows[0]["Degree"].ToString();
                    txtEmail.Text = dt.Rows[0]["EmailId"].ToString();
                    ddlGender.SelectedIndex = Convert.ToInt16(dt.Rows[0]["GenderId"]);
                    txtMobile.Text = dt.Rows[0]["MobileNo"].ToString();
                    txtOpd.Text = dt.Rows[0]["OPDSchedule"].ToString();
                    txtExprience.Text = dt.Rows[0]["Exprience"].ToString();
                    imgProfile.ImageUrl = "~/Prescription/" + dt.Rows[0]["Doctorimg"].ToString();
                    ddlDepart.SelectedIndex = Convert.ToInt32(dt.Rows[0]["Department"]);
              
                }

            }
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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            imgPath = string.Empty;
            string fileName = string.Empty;


            if (FileUpload1.HasFile)
            {
                fileName = FileUpload1.FileName;
                imgPath = "~/Prescription/" + FileUpload1.FileName;
                FileUpload1.SaveAs(Server.MapPath(imgPath));
            }
            SqlCommand cmd = new SqlCommand("insert into DoctorDetails(doctorName,Degree,Department,GenderId,MobileNo,EmailId,Exprience,OPDSchedule,Doctorimg,Password,createdBy,createdOn) values('" + txtDoctorName.Text + "','" + txtEducation.Text + "'," + ddlDepart.Text + ","+ddlGender.Text+",'" + txtMobile.Text + "','" + txtEmail.Text + "','" + txtExprience.Text + "','" + txtOpd.Text + "','" + fileName + "','" + txtPass.Text + "',1,getdate()) ", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script language='javascript'>alert('Doctor Add Successfully.');</script>");
            Response.Redirect("Doctors.aspx");

        }
    }
}