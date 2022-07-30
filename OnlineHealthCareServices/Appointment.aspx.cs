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
    public partial class Appointment : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);
        int UserDetailId = 0;
        int DiseaseId = 0;
        int resCode;
        DataTable dt;
        commonUse cu = new commonUse();
        int[] slot;
        string[] date;

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
            if (!IsPostBack)
            {
                bindUserDetail(1);
                bindSample();
                bindSlot();
                bindDisease();
                bindAdd();
                bindGender();
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


        protected void bindUserDetail(int UserDetailId)
        {
            SqlDataAdapter adap = new SqlDataAdapter("select * from UserDetail where isActive=1 and UserDetailId=" + UserDetailId + "", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                int StateId = Convert.ToInt16(dt.Rows[0]["StateId"]);

                txtFirstName.Text = dt.Rows[0]["FirstName"].ToString();
               
                txtLastName.Text = dt.Rows[0]["LastName"].ToString();
                txtAge.Text = dt.Rows[0]["Age"].ToString();
                ddlGender.SelectedIndex = Convert.ToInt16(dt.Rows[0]["GenderId"]);
                txtAddress.Text = dt.Rows[0]["AddresssLine1"].ToString();
                txtMobileNo.Text = dt.Rows[0]["MobileNumber"].ToString();
                txtEmailId.Text = dt.Rows[0]["EmailId"].ToString();
            }
        }
        protected void bindDisease()
        {
           
            SqlDataAdapter adap1 = new SqlDataAdapter("select * from Department where isActive=1", con);
            DataTable dt1 = new DataTable();
            adap1.Fill(dt1);

            ddldisease.DataSource = dt1;
            ddldisease.DataTextField = "departmentName";
            ddldisease.DataValueField = "departmentId";
            ddldisease.DataBind();
            ddldisease.Items.Insert(0, "Select ");
            ddldisease.SelectedIndex = 0;
        }
        private void bindSample()
        {
            SqlDataAdapter adap = new SqlDataAdapter("select sampleId,sampleName from TestSample where isActive=1 ", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            ddlAddType.DataSource = dt;
            ddlAddType.DataTextField = "sampleName";
            ddlAddType.DataValueField = "sampleId";
            ddlAddType.DataBind();
            ddlAddType.Items.Insert(0, "Select ");
            ddlAddType.SelectedIndex = 0;

        }
        protected void bindDoctor(int DiseaseId)
        {
            SqlDataAdapter adap = new SqlDataAdapter("select * from DoctorDetails where Department= " + DiseaseId + "", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            ddlDoctor.DataSource = dt;
            ddlDoctor.DataTextField = "doctorName";
            ddlDoctor.DataValueField = "doctorId";
            ddlDoctor.DataBind();
            ddlDoctor.Items.Insert(0, "Select Doctor");
            ddlDoctor.SelectedIndex = 0;
        }

        private void bindSlot()
        {
            SqlDataAdapter adap = new SqlDataAdapter("select * from Slot where isActive=1", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            ddlSlot.DataSource = dt;
            ddlSlot.DataTextField = "slotName";
            ddlSlot.DataValueField = "slotId";
            ddlSlot.DataBind();
            ddlSlot.Items.Insert(0, "Select Slot");
            ddlSlot.SelectedIndex = 0;

        }

        private void bindAdd()
        {
            SqlDataAdapter adap = new SqlDataAdapter("select * from AddressType", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            ddlAddType.DataSource = dt;
            ddlAddType.DataTextField = "addressType";
            ddlAddType.DataValueField = "addressId";
            ddlAddType.DataBind();
            ddlAddType.Items.Insert(0, "Select Center");
            ddlAddType.SelectedIndex = 0;
        }
        

        protected void btnAddTest_Click(object sender, EventArgs e)
        {
            SqlDataAdapter adap = new SqlDataAdapter("select * from Appointment", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);

           
            SqlCommand cmd;
                    cmd = new SqlCommand("insert into Appointment(UserDetailId,FirstName,LastName,MobileNo,EmailId,GenderId,Age,AppointmentDate,Slot,DiseaseId,DoctorId,Center,createdBy,createdOn)values(" + UserDetailId + ",'" + txtFirstName.Text + "','" + txtLastName.Text + "','" + txtMobileNo.Text + "','" + txtEmailId.Text + "'," + ddlGender.Text + "," + txtAge.Text + ",'" + txtDate.Text + "'," + ddlSlot.Text + "," + ddldisease.Text + "," + ddlDoctor.Text + "," + ddlAddType.Text + ",1,getdate()) ", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                
        }

        protected void ddldisease_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddldisease.SelectedIndex > 0)
            {
                DiseaseId = Convert.ToInt16(ddldisease.SelectedValue);
                bindDoctor(DiseaseId);
            }
            else
            {
                ddlDoctor.Items.Clear();
                ddlDoctor.Items.Insert(0, "Please Select");
                ddlDoctor.SelectedIndex = 0;
            }
        }
    }
}