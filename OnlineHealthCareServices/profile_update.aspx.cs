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
    public partial class profile_update : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydbcs"].ConnectionString);
        int resCode = 0;
        string middleName = string.Empty;
        string imgPath = string.Empty;
        int UserDetailId = 0;
        DataTable dt;
        commonUse cu = new commonUse();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["UserDetailId"]!=null && Session["UserDetailId"].ToString()!="")
            {
                UserDetailId = Convert.ToInt32(Session["UserDetailId"]);
            }
            else
            {
                Response.Redirect("userLogin.aspx");
            }

            if (IsPostBack)
                return;

            bindGender();
            bindState();
            bindAddressType();

            bindUserDetail(UserDetailId);

            //string mobileNo = Session["MobileNo"].ToString();
            //DataTable dt = new DataTable();
            //con.Open();
            //SqlDataReader myReader = null;
            //SqlCommand myCommand = new SqlCommand("select EmailId,MobileNumber from UserDetail where MobileNumber='" + mobileNo + "'", con);

            //myReader = myCommand.ExecuteReader();

            //while (myReader.Read())
            //{
            //    txtMobileNo.Text = (myReader["MobileNumber"].ToString());
            //    txtEmailId.Text = (myReader["EmailId"].ToString());
            //}
        }

        protected void bindUserDetail(int UserDetailId)
        {
            SqlDataAdapter adap = new SqlDataAdapter("select * from UserDetail where isActive=1 and UserDetailId="+UserDetailId+"", con);
            DataTable dt = new DataTable();
            adap.Fill(dt);

            if(dt.Rows.Count>0)
            {
                int StateId= Convert.ToInt16(dt.Rows[0]["StateId"]);

                ddlDistict.Items.Clear();
                bindDistict(StateId);

                txtFirstname.Text = dt.Rows[0]["FirstName"].ToString();
                txtMiddlename.Text = dt.Rows[0]["MiddleName"].ToString();
                txtLastname.Text = dt.Rows[0]["LastName"].ToString();
                txtAge.Text = dt.Rows[0]["Age"].ToString();
                ddlGender.SelectedIndex = Convert.ToInt16(dt.Rows[0]["GenderId"]);
                txtAddress1.Text = dt.Rows[0]["AddresssLine1"].ToString();
                txtAddress2.Text = dt.Rows[0]["AddresssLine2"].ToString();
                ddlState.SelectedIndex = Convert.ToInt16(dt.Rows[0]["StateId"]);
                ddlDistict.SelectedValue= (dt.Rows[0]["DistictId"].ToString());
                ddlDistict.SelectedValue= (dt.Rows[0]["DistictId"].ToString());
                txtPinCode.Text = dt.Rows[0]["PinCode"].ToString();
                txtLandmark.Text = dt.Rows[0]["LandMark"].ToString();
                ddlAddType.SelectedIndex = Convert.ToInt16(dt.Rows[0]["AddressTypeId"]);
                imgProfile.ImageUrl= "~/UserProfile/"+dt.Rows[0]["ProfileImg"].ToString();
                txtMobileNo.Text = dt.Rows[0]["MobileNumber"].ToString();
                txtEmailId.Text = dt.Rows[0]["EmailId"].ToString();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            imgPath = string.Empty;
           string fileName = string.Empty;

            if (FileUpload1.HasFile)
            {
                fileName = FileUpload1.FileName;
                imgPath = "~/UserProfile/" + FileUpload1.FileName;
                FileUpload1.SaveAs(Server.MapPath(imgPath));
            }
            middleName = txtMiddlename.Text;
            //SqlCommand cmd = new SqlCommand("update UserDetail set FirstName='" + txtFirstname.Text + "',MiddleName='"+middleName+"',LastName='" + txtLastname.Text + "',Age=" + txtAge.Text + ",GenderId=" + ddlGender.Text + ",AddresssLine1='" + txtAddress1.Text + "',AddresssLine2='" + txtAddress2.Text + "',StateId=" + ddlState.Text + ",DistictId=" + ddlDistict.Text + ",PinCode='" + txtPinCode.Text + "',LandMark='" + txtLandmark.Text + "',AddressTypeId="+ddlAddType.Text+",ProfileImg='" + imgPath + "' where MobileNumber='"+txtMobileNo.Text+"'", con);
            //con.Open();
            //cmd.ExecuteNonQuery();
            //con.Close();

            SqlCommand cmd;

            if (Session["UserDetailId"] != null)
            {
                UserDetailId = Convert.ToInt32(Session["UserDetailId"]);
            }

            cmd = new SqlCommand("sp_update", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@UserDetailId", UserDetailId));
            cmd.Parameters.Add(new SqlParameter("@Firstname", txtFirstname.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter("@Middlename", txtMiddlename.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter("@Lastname", txtLastname.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter("@Age", txtAge.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter("@MobileNo", txtMobileNo.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter("@EmailId", txtEmailId.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter("@GenderId", ddlGender.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter("@AddressLine1", txtAddress1.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter("@AddressLine2", txtAddress2.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter("@StateId", ddlState.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter("@DistictId", ddlDistict.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter("@PinCode", txtPinCode.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter("@AddressTypeId", ddlAddType.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter("@LandMark", txtLandmark.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter("@ProfileImg", fileName));

            // get return value from procedure
            SqlParameter parm = new SqlParameter("@resCode", SqlDbType.BigInt); //output parameter
            parm.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(parm);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            resCode = Convert.ToInt32(parm.Value);
            if (resCode == 1)
            {
                string mobileNo = Session["MobileNo"].ToString();
                Response.Redirect("Profile.aspx");
            }            
            else
            {
                lblStatus.Text = "User Profile is Not Updated";
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
            ddlGender.Items.Insert(0, "Please Select");
            ddlGender.SelectedIndex = 0;
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
            dt = new DataTable();
            dt = cu.bindAddressType();

            ddlAddType.DataSource = dt;
            ddlAddType.DataTextField = "addressType";
            ddlAddType.DataValueField = "addressId";
            ddlAddType.DataBind();
            ddlAddType.Items.Insert(0, "Please Select");
            ddlAddType.SelectedIndex = 0;
        }

        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddlState.SelectedIndex>0)
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

                      

    }
}