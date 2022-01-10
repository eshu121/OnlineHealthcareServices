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
    public partial class user_Prescription : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);
        DataTable dt;
        int UserDetailId = 0;
        int PrescriptionId = 0;
        commonUse cu = new commonUse();
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
            if (IsPostBack)
                return;

            if(Request.QueryString["PresId"]!=null)
            {
                PrescriptionId = Convert.ToInt32(Request.QueryString["PresId"]);

                if(PrescriptionId>0)
                {

                    bindPrescriptionDetail(PrescriptionId);
                }
            }


            bindState();
            bindAddressType();
            bindPayment();
        }

        private void bindState()
        {
            dt = new DataTable();
            dt = cu.bindState();

            ddlState.DataSource = dt;
            ddlState.DataTextField = "stateName";
            ddlState.DataValueField = "stateId";
            ddlState.DataBind();
            ddlState.Items.Insert(0, "Please Select");
            ddlState.SelectedIndex = 0;

        }


        private void bindDistict(int stateId)
        {
            ddlDistict.Items.Clear();
            dt = new DataTable();
            dt = cu.bindDistrict(stateId);
            ddlDistict.DataSource = dt;
            ddlDistict.DataTextField = "distictName";
            ddlDistict.DataValueField = "distictId";
            ddlDistict.DataBind();
            ddlDistict.Items.Insert(0, "Please Select");
            ddlDistict.SelectedIndex = 0;

        }
        private void bindAddressType()
        {
            SqlDataAdapter adap = new SqlDataAdapter("select addressId, addressType from AddressType where isActive=1", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);

            ddlAddType.DataSource = dt;
            ddlAddType.DataTextField = "addressType";
            ddlAddType.DataValueField = "addressId";
            ddlAddType.DataBind();
            ddlAddType.Items.Insert(0, "Please Select");
            ddlAddType.SelectedIndex = 0;
        }
        private void bindPayment()
        {
            SqlDataAdapter adap = new SqlDataAdapter("select paymentId, paymentMode from PaymentMode where isActive=1", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            ddlPayment.DataSource = dt;
            ddlPayment.DataTextField = "paymentMode";
            ddlPayment.DataValueField = "paymentId";
            ddlPayment.DataBind();
            ddlPayment.Items.Insert(0, "Please Select");
            ddlPayment.SelectedIndex = 0;

        }
       

        protected void ddlState_SelectedIndexChanged1(object sender, EventArgs e)
        {
            if (ddlState.SelectedIndex > 0)
            {
                int stateId = 0;
                stateId = Convert.ToInt16(ddlState.SelectedValue);
                bindDistict(stateId);
            }
            else
            {
                ddlDistict.Items.Clear();
                ddlDistict.Items.Insert(0, "Please Select");
                ddlDistict.SelectedIndex = 0;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            string imgPath = string.Empty;
            string fileName = string.Empty;

            if (FileUpload1.HasFile)
            {
                fileName = FileUpload1.FileName;
                imgPath = "~/Prescription/" + FileUpload1.FileName;
                FileUpload1.SaveAs(Server.MapPath(imgPath));
            }
            SqlCommand cmd = new SqlCommand("insert into PrescriptionDetail(UserDetailId,PatientName,DoctorName, Addresss, StateId ,DistictId, PinCode , LandMark , AddressTypeId,NumberOfDays , PaymentMode, PrescriptionImg,MobileNO,CreatedDate ) values(" + UserDetailId+",'" + txtPatientName.Text+ "','" + txtDoctorName.Text + "','" + txtAddress.Text + "'," + ddlState.Text + "," + ddlDistict.Text + ",'" + txtPinCode.Text + "','" + txtLandmark.Text + "'," + ddlAddType.Text + ",'" + txtNOD.Text + "'," + ddlPayment.Text + ",'" + fileName + "','"+txtMobileNo.Text+ "',getdate()) ", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            clear();
            Response.Redirect("order.aspx");
        }

        protected void clear()
        {
            txtPatientName.Text = "";
            txtDoctorName.Text = "";
            txtAddress.Text = "";
            txtLandmark.Text = "";
            txtNOD.Text = "";
            txtPinCode.Text = "";
            ddlState.Text = "Please Select";
            ddlPayment.Text = "Please Select";
            ddlAddType.Text = "Please Select";
        }
        protected void bindPrescriptionDetail(int PrescriptionId)
        {
            SqlDataAdapter adap = new SqlDataAdapter("select * from PrescriptionDetail where PrescriptionDetailId="+PrescriptionId+"", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                int StateId = Convert.ToInt16(dt.Rows[0]["StateId"]);

                ddlDistict.Items.Clear();
                bindDistict(StateId);

                txtPatientName.Text = dt.Rows[0]["PatientName"].ToString();
                txtDoctorName.Text = dt.Rows[0]["DoctorName"].ToString();
                txtAddress.Text = dt.Rows[0]["Addresss"].ToString();
                txtPinCode.Text = dt.Rows[0]["PinCode"].ToString();
                txtLandmark.Text = dt.Rows[0]["LandMark"].ToString();
                txtNOD.Text = dt.Rows[0]["NumberOfDays"].ToString();
                txtMobileNo.Text = dt.Rows[0]["MobileNo"].ToString();
                imgPrescp.ImageUrl = "~/Prescription/" + dt.Rows[0]["PrescriptionImg"].ToString();
                ddlState.SelectedIndex = Convert.ToInt16(dt.Rows[0]["StateId"]);
                ddlDistict.SelectedValue = (dt.Rows[0]["DistictId"].ToString());
                txtPinCode.Text = dt.Rows[0]["PinCode"].ToString();
                txtLandmark.Text = dt.Rows[0]["LandMark"].ToString();
                ddlAddType.SelectedIndex = Convert.ToInt16(dt.Rows[0]["AddressTypeId"]);
                

            }
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("order_Status.aspx");
        }
    }
}